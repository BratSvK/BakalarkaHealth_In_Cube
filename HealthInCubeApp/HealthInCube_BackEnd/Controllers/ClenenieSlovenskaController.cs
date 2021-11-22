using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Division of slovak country.
    /// </summary>
    public class ClenenieSlovenskaController : BaseApiController
    {
        private readonly IClenenieSlovenskaRepository _clenenieSlovenskaRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="clenenieSlovenskaRepository"></param>
        public ClenenieSlovenskaController(IClenenieSlovenskaRepository clenenieSlovenskaRepository)
        {
            _clenenieSlovenskaRepository = clenenieSlovenskaRepository;
        }

        /// <summary>
        /// Get all derelicts in country
        /// </summary>
        /// <returns></returns>
        [HttpGet("okresy")]
        public async Task<ActionResult<IEnumerable<RolaDTO>>> GetAllDistricts()
        {
            var districts = await _clenenieSlovenskaRepository.GetAllDistricts();
            if (districts == null) return NotFound("Nothing find");

            return Ok(districts);
        }

        /// <summary>
        /// Get all cities deralict
        /// </summary>
        /// <param name="idOkres"></param>
        /// <returns></returns>
        [HttpGet("okres/{idOkres}/mesta")]
        public async Task<ActionResult<IEnumerable<MestoDto>>> GetAllCitiesByDistrict(decimal idOkres)
        {
            var cities = await _clenenieSlovenskaRepository.GetAllCitysByDistrict(idOkres);
            if (cities == null) return NotFound("Nothing find");

            return Ok(cities);
        }

             
        [HttpGet("mesta")]
        public async Task<ActionResult<IEnumerable<MestoDto>>> GetAllCities()
        {
            var cities = await _clenenieSlovenskaRepository.GetAllCities();
            if (cities == null) return NotFound("Nothing find");

            return Ok(cities);
        }
    }
}