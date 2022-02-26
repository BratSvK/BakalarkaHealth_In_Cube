using AutoMapper;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.SignalR
{
    /// <summary>
    /// The hub for operations with requests to the threatment apppointment.
    /// </summary>
    public class SprievodkaHub : Hub
    {
        private readonly IMapper _mapper;
        private readonly ISprievodkaRepository _sprievodkaRepository;
        private readonly IPracovnaDobaRepository _pracovnaDobaRepository;
        private readonly ILekarRepository _lekarRepository;
        private readonly IAppointmentSchedulerService _appointmentSchedulerService;

        public SprievodkaHub(
            IMapper mapper,
            ISprievodkaRepository sprievodkaRepository,
            IPracovnaDobaRepository pracovnaDobaRepository,
            ILekarRepository lekarRepository,
            IAppointmentSchedulerService appointmentSchedulerService)
        {
            _mapper = mapper;
            _sprievodkaRepository = sprievodkaRepository;
            _pracovnaDobaRepository = pracovnaDobaRepository;
            _lekarRepository = lekarRepository;
            _appointmentSchedulerService = appointmentSchedulerService;
        }

        /// <summary>
        /// Listen to changes in calendar component to client.
        /// </summary>
        public override async Task OnConnectedAsync()
        {
            var httpContext = Context.GetHttpContext();
            var a = httpContext.Request.Query["sprievodkaParams"];
            var sprievodkaParams = JsonConvert.DeserializeObject<SprievodkaParams>(httpContext.Request.Query["sprievodkaParams"].ToString());
            string groupName;
            if (sprievodkaParams.IdLekar > 0)
            {
                groupName = GetGroupNameDoctor(sprievodkaParams.IdLekar.ToString());

            }
            else
            {
                groupName = GetGroupNamePatient(sprievodkaParams.IdPacient.ToString());
            }

            await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
            await Clients.Group(groupName).SendAsync("ListenToSprievodkaCalendar", "Počúvam");
        }

        public async Task CreateAppointmentByDoctor(SprievodkaCreate sprievodkaCreate)
        {
            // enum from microsoft 0 -> Nedela
            PracovnaDoba pracovnaDoba =
                await _pracovnaDobaRepository.GetPracovnaDobaToDateAsync(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfWeek);
            int averageTimePerPatient = await _lekarRepository.GetAverageTimePerPatientAsync(sprievodkaCreate.IdLekar);

            IList<TerminSprievodkaDto> vsetkyTerminyLekar =
                 _appointmentSchedulerService.CreateAppointmentSchedulerByDay(
                     new SchedulerBuilderModel(
                         sprievodkaCreate.IdLekar,
                         sprievodkaCreate.TerminDatum,
                         averageTimePerPatient,
                         pracovnaDoba));

            var lastFreeAppointment = await _sprievodkaRepository.GetLastTerminCountInDayPerDoctorAsync(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfYear);
            if (lastFreeAppointment >= 0 && lastFreeAppointment < vsetkyTerminyLekar.Count)
            {
                var sprievodka = new Sprievodka
                {
                    IdPacient = sprievodkaCreate.IdPacient,
                    IdLekar = sprievodkaCreate.IdLekar,
                    IdTypVysetrenia = sprievodkaCreate.idTypVysetrenia,
                    TerminOd = sprievodkaCreate.TerminDatum.Add(vsetkyTerminyLekar[lastFreeAppointment].TerminOdInHour),
                    TerminDo = sprievodkaCreate.TerminDatum.Add(vsetkyTerminyLekar[lastFreeAppointment].TerminDoInHour)
                };

                _sprievodkaRepository.InsertItem(sprievodka);

                if (await _sprievodkaRepository.SaveAllAsync())
                {
                    var groupPatient = GetGroupNamePatient(sprievodka.IdPacient.ToString());
                    var groupLekar = GetGroupNameDoctor(sprievodka.IdLekar.ToString());
                    await Clients.Group(groupPatient).SendAsync("NewSprievodka", "Sprievodka pre pacienta pridana"); 
                    await Clients.Group(groupLekar).SendAsync("NewSprievodka", "Sprievodka pre lekara pridana");
                }
            }
        }

        /// <inheritdoc/>
        public override Task OnDisconnectedAsync(Exception exception)
        {
            return base.OnDisconnectedAsync(exception);
        }

        private string GetGroupNamePatient(string patientId)
        => $"sprievodka-patient-{patientId}";

        private string GetGroupNameDoctor(string lekarId)
        => $"sprievodka-doctor-{lekarId}";
    }
}
