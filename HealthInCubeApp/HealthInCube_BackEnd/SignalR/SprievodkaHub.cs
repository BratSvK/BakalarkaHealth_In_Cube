using AutoMapper;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Properties;
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
        private readonly IZdravotnaKartaRepository _zdravotnaKartaRepository;
        private readonly IAppointmentSchedulerService _appointmentSchedulerService;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="mapper">Auto mapper.</param>
        /// <param name="sprievodkaRepository">Sprievodka repository.</param>
        /// <param name="pracovnaDobaRepository">Pracovna doba repository.</param>
        /// <param name="lekarRepository">Lekar repository.</param>
        /// <param name="zdravotnaKartaRepository">Zdravotna karta repository.</param>
        /// <param name="appointmentSchedulerService">Appointment service scheduler.</param>
        public SprievodkaHub(
            IMapper mapper,
            ISprievodkaRepository sprievodkaRepository,
            IPracovnaDobaRepository pracovnaDobaRepository,
            ILekarRepository lekarRepository,
            IZdravotnaKartaRepository zdravotnaKartaRepository,
            IAppointmentSchedulerService appointmentSchedulerService)
        {
            _mapper = mapper;
            _sprievodkaRepository = sprievodkaRepository;
            _pracovnaDobaRepository = pracovnaDobaRepository;
            _lekarRepository = lekarRepository;
            _zdravotnaKartaRepository = zdravotnaKartaRepository;
            _appointmentSchedulerService = appointmentSchedulerService;
        }

        /// <summary>
        /// Listen to changes in calendar component to client.
        /// Init hub connection and register to group of listeners.
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

        /// <inheritdoc/>
        public override Task OnDisconnectedAsync(Exception exception)
        {
            return base.OnDisconnectedAsync(exception);
        }

        #region Actions with sprievodka
        /// <summary>
        /// Create appointment by doctor.
        /// Asycn resend to calendars in open mode.
        /// </summary>
        /// <param name="sprievodkaCreate">Model for creating appointment.</param>
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
                    await Clients.Group(groupPatient).SendAsync("EditCalendar", Resource.SignalRSprievodkaHubCreatedSprievodka); 
                    await Clients.Group(groupLekar).SendAsync("EditCalendar",  Resource.SignalRSprievodkaHubCreatedSprievodka);
                }
            }
        }

        /// <summary>
        /// Deleted planned appointment by patient.
        /// Max 48 hours before start of appo.
        /// </summary>
        /// <param name="sprievodkaDelete">Model for deleting appo.</param>
        public async Task DeleteSprievodkaByPatient(SprievodkaDeleteDto sprievodkaDelete)
        {
            if (!sprievodkaDelete.TerminOd.IsAllowedToDenyAppointment())
            {
                return;
            }

            IEnumerable<Sprievodka> sprievodkyAfterRecalculation = await _sprievodkaRepository.DeleteSprievodkaAsync(sprievodkaDelete);

            if (sprievodkyAfterRecalculation.Count() > 0) 
            {
                IList<string> idsOfInterestedPersonsInDay = new List<string>();
                idsOfInterestedPersonsInDay.Add(GetGroupNameDoctor(sprievodkaDelete.IdLekar.ToString()));

                foreach (var sprievodkaUserToNotify in sprievodkyAfterRecalculation)
                {
                    if (sprievodkaUserToNotify.IdPacient != sprievodkaDelete.IdPacient)
                    {
                        idsOfInterestedPersonsInDay.Add(GetGroupNamePatient(sprievodkaUserToNotify.IdPacient.ToString()));
                    }
                }

                foreach (var personToNotify in idsOfInterestedPersonsInDay)
                {
                   await Clients.Group(personToNotify).SendAsync("EditCalendar", Resource.SignalRSprievodkaHubEditSprievodka);
                }
            }
            return;
        }

        #endregion


        private string GetGroupNamePatient(string patientId)
        => $"sprievodka-patient-{patientId}";

        private string GetGroupNameDoctor(string lekarId)
        => $"sprievodka-doctor-{lekarId}";
    }
}
