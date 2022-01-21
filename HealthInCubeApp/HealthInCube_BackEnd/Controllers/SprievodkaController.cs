using AutoMapper;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka;
using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Controllers
{
    [Authorize(Roles = "Lekar,Pacient")]
    public class SprievodkaController : BaseApiController
    {
        private readonly IMapper _mapper;
        private readonly ISprievodkaRepository _sprievodkaRepository;
        private readonly IPracovnaDobaRepository _pracovnaDobaRepository;

        public SprievodkaController(IMapper mapper, ISprievodkaRepository sprievodkaRepository, IPracovnaDobaRepository pracovnaDobaRepository)
        {
            _mapper = mapper;
            _sprievodkaRepository = sprievodkaRepository;
            _pracovnaDobaRepository = pracovnaDobaRepository;
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
        /// Get appointmens in current week
        /// </summary>
        [HttpPost("create")]
        public async Task<ActionResult<SprievodkaDto>> CreateAppointmentByDoctor([FromBody] SprievodkaCreate sprievodkaCreate)
        {
            // enum from microsoft 0 -> Nedela
            PracovnaDoba pracovnaDoba = await _pracovnaDobaRepository.GetPracovnaDobaToDateAsync(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfWeek);
            
            IList<TerminSprievodka> vsetkyTerminyLekar = AppointmentScheduler.GetAppointmentScheduler(pracovnaDoba, sprievodkaCreate.DlzkaVysetrenia);
            var lastFreeAppointment = await _sprievodkaRepository.GetLastTerminCountInDayPerDoctorAsync(sprievodkaCreate.IdLekar, sprievodkaCreate.TerminDatum.DayOfYear);
            if (lastFreeAppointment >= 0 && lastFreeAppointment < vsetkyTerminyLekar.Count)
            {
                var sprievodka = new Sprievodka
                {
                    IdPacient = sprievodkaCreate.IdPacient,
                    IdLekar = sprievodkaCreate.IdLekar,
                    IdTypVysetrenia = sprievodkaCreate.IdTypVysetrenia,
                    TerminOd = sprievodkaCreate.TerminDatum.Add(vsetkyTerminyLekar[lastFreeAppointment].TerminOdInHour),
                    TerminDo = sprievodkaCreate.TerminDatum.Add(vsetkyTerminyLekar[lastFreeAppointment].TerminDoInHour)
                };

                _sprievodkaRepository.InsertItem(sprievodka);

                if (await _sprievodkaRepository.SaveAllAsync())
                {
                    return Ok(sprievodka);
                }
            }

            return BadRequest("Failed to create an appointment!");
        }
    }
}
