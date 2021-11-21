using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
   
    [Authorize]
    public class NemocnicaController : BaseApiController
    {
        private readonly INemocnicaRepistory _nemocnicaRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="nemocnicaRepository"></param>
        public NemocnicaController(INemocnicaRepistory nemocnicaRepository)
        {
            _nemocnicaRepository = nemocnicaRepository;

        }

        // from query params -> throught client 
        // postman -> from body 
        [AllowAnonymous]
        [HttpGet("vseobecnyLekary")]
        public async Task<ActionResult<IEnumerable<LekarDto>>> GetAllGeneralPractitionersAsync([FromQuery] RegisterPacientAgeAndCityDto registerPacientAgeAndCity)
        {   

            var lekari = await _nemocnicaRepository.GetAllPractitionersByCityAsync(registerPacientAgeAndCity.IdCity);
            var lekariByPacientAge = new List<LekarDto>();

            // ak som nenasiel lekarov podla mesta tak idem do okresu a pridelim toho lekara
            // naprikald ak zadas horny vadicov tak ho presmeruje na nemocnicu v okrese a to je KNM -> polikninika KNM
            if (lekari.Count() == 0 ) 
            {   
                lekari = await _nemocnicaRepository.GetAllPractitionersByOkresAsync(registerPacientAgeAndCity.IdCity);

            }

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


        //  [AllowAnonymous]
        // [HttpGet("oddelenia")]
        // public async Task<ActionResult<IEnumerable<LekarDto>>> GetAllGeneralPractitionersAsync([FromQuery] RegisterPacientAgeAndCityDto registerPacientAgeAndCity)
        // {   

        //     var lekari = await _nemocnicaRepository.GetAllPractitionersByCityAsync(registerPacientAgeAndCity.IdCity);
        //     var lekariByPacientAge = new List<LekarDto>();

        //     if (lekari.Count() == 0) return NotFound("Nothing found");

        //     if(registerPacientAgeAndCity.Age > 0 && registerPacientAgeAndCity.Age <= 25)
        //     {
        //         lekariByPacientAge = GetLekariByAge(lekari, (int)TypVseobecnyLekar.Detsky);
                
        //     }
        //     else 
        //     {
        //         lekariByPacientAge = GetLekariByAge(lekari, (int)TypVseobecnyLekar.Dospely);
        //     }

        //     return Ok(lekariByPacientAge);
        // }

        private List<LekarDto> GetLekariByAge(IEnumerable<LekarDto> lekary , int typVseobecny)
        {
            return lekary.Where(l => l.AtestacieId.Any(atestacia => atestacia == typVseobecny)).ToList();

        }
    }
}