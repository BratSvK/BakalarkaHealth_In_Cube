using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{

    public enum TypVseobecnyLekar
    {
        Detsky = 65,
        Dospely = 66
    }


    [Authorize]
    public class NemocnicaController : BaseApiController
    {
        private readonly INemocnicaRepistory _nemocnicaRepository;
        public NemocnicaController(INemocnicaRepistory nemocnicaRepository)
        {
            _nemocnicaRepository = nemocnicaRepository;

        }


        [AllowAnonymous]
        [HttpGet("vseobecnyLekary")]
        public async Task<ActionResult<IEnumerable<LekarDto>>> GetAllGeneralPractitionersAsync([FromQuery] RegisterPacientAgeAndCityDto registerPacientAgeAndCity)
        {   

            var lekari = await _nemocnicaRepository.GetAllPractitionersByCityAsync(registerPacientAgeAndCity.IdCity);
            var lekariByPacientAge = new List<LekarDto>();

            if (lekari.Count() == 0) return NotFound("Nothing found");

            if(registerPacientAgeAndCity.Age > 0 && registerPacientAgeAndCity.Age <= 25)
            {
                lekariByPacientAge = GetLekariByAge(lekari, (int)TypVseobecnyLekar.Detsky);
                
            }
            else 
            {
                lekariByPacientAge = GetLekariByAge(lekari, (int)TypVseobecnyLekar.Dospely);
            }

            return Ok(lekariByPacientAge);
        }




        


        private List<LekarDto> GetLekariByAge(IEnumerable<LekarDto> lekary , int typVseobecny)
        {
            return lekary.Where(l => l.AtestacieLekars.Any(atestacia => atestacia.IdTyp == typVseobecny)).ToList();

        }




    }
}