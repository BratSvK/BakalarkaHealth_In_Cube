using AutoMapper;
using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka;
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

        public SprievodkaController(IMapper mapper, ISprievodkaRepository sprievodkaRepository)
        {
            _mapper = mapper;
            _sprievodkaRepository = sprievodkaRepository;
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


    }
}
