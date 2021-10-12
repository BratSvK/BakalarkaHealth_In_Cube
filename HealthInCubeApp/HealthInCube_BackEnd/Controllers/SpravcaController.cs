using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    public class SpravcaController : BaseApiController
    {
        private readonly INemocnicaRepistory _nemocnicaRepository;

        public SpravcaController(INemocnicaRepistory nemocnicaRepository)
        {
            _nemocnicaRepository = nemocnicaRepository;
        }



        [Authorize(Roles="Spravca")]
        [HttpGet("nemocnice")]
        public async Task<ActionResult<IEnumerable<NemocnicaDto>>> GetNemocnice()
        {
            var nemocnice = await _nemocnicaRepository.GetItemsAsync();

            if (nemocnice == null) return NotFound("Nothing found");

            return Ok(nemocnice);
            
        }




    }
}