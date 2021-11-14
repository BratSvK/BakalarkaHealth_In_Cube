using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    // treba byt prihlaseny do systému 
    // [Authorize]
    public class ClenenieSlovenskaController : BaseApiController
    {
        private readonly IClenenieSlovenskaRepository _clenenieSlovenskaRepository;
        public ClenenieSlovenskaController(IClenenieSlovenskaRepository clenenieSlovenskaRepository)
        {
            _clenenieSlovenskaRepository = clenenieSlovenskaRepository;
        }



        // get all derelict 
        
        [HttpGet("okresy")]
        public async Task<ActionResult<IEnumerable<RolaDTO>>> GetAllDistricts()
        {
            var districts = await _clenenieSlovenskaRepository.GetAllDistricts();
            if (districts == null) return NotFound("Nothing find");

            return Ok(districts);
        }

        // get all cities by derelict

        [HttpGet("okres/{idOkres}/mesta")]
        public async Task<ActionResult<IEnumerable<MestoDto>>> GetAllCities(decimal idOkres)
        {
            var cities = await _clenenieSlovenskaRepository.GetAllCitysByDistrict(idOkres);
            if (cities == null) return NotFound("Nothing find");

            return Ok(cities);
        }





    }
}