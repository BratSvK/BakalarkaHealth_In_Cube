using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Controllers
{
    [Authorize(Roles = "Lekar,Pacient")]
    public class SprievodkaController : BaseApiController
    {
        private readonly ISprievodkaRepository _sprievodkaRepository;
        private readonly IPracovnaDobaRepository _pracovnaDobaRepository;
        private readonly ILekarRepository _lekarRepository;
        private readonly IAppointmentSchedulerService _appointmentSchedulerService;

        public SprievodkaController(
            ISprievodkaRepository sprievodkaRepository, 
            IPracovnaDobaRepository pracovnaDobaRepository,
            ILekarRepository lekarRepository,
            IAppointmentSchedulerService appointmentSchedulerService)
        {
            _sprievodkaRepository = sprievodkaRepository;
            _pracovnaDobaRepository = pracovnaDobaRepository;
            _lekarRepository = lekarRepository;
            _appointmentSchedulerService = appointmentSchedulerService;
        }

        /// <summary>
        /// Get appointmens in current week
        /// </summary>
        [HttpGet("byWeek")]
        public async Task<ActionResult<IEnumerable<SprievodkaDto>>> GetAllAppointmentsByWeek([FromQuery] SprievodkaParams sprievodkaParams)
        {
            var sprievodkyByWeek = await _sprievodkaRepository.GetSprievodkyByWeek(sprievodkaParams);
            
            return Ok(sprievodkyByWeek);
        }

        /// <summary>
        /// Check availability in day.
        /// </summary>
        [HttpGet("availability")]
        public async Task<ActionResult<bool>> ChceckAvailability([FromQuery] SprievodkaCreate sprievodkaCreate)
        {
            PracovnaDoba pracovnaDoba =
               await _pracovnaDobaRepository.GetPracovnaDobaToDateAsync(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfWeek);
            if (pracovnaDoba == null)
            {
                return Ok(false);
            }
            int averageTimePerPatient = await _lekarRepository.GetAverageTimePerPatientAsync(sprievodkaCreate.IdLekar);

            _appointmentSchedulerService.CreateAppointmentSchedulerByDay(
                     new SchedulerBuilderModel(
                         sprievodkaCreate.IdLekar,
                         sprievodkaCreate.TerminDatum,
                         averageTimePerPatient,
                         pracovnaDoba));

            var isAvailable = await _sprievodkaRepository.CheckIsAvailableTerminInDayOfYear(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfYear);
            return Ok(isAvailable);
        }

        /// <summary>
        /// Get appointmens in current week
        /// </summary>
        [Authorize(Roles = "Lekar")]
        [HttpPost("create")]
        public async Task<IActionResult> CreateAppointmentByDoctor([FromBody] SprievodkaCreate sprievodkaCreate)
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
                    return StatusCode((int)HttpStatusCode.Created);
                }
            }

            return BadRequest("Failed to create an appointment!");
        }
    }
}
