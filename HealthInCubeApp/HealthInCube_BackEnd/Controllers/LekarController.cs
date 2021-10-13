using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    [Authorize]
    public class LekarController : BaseApiController
    {
        private readonly ILekarRepository _lekarRepo;

        public LekarController(ILekarRepository lekarRepo)
        {
            _lekarRepo = lekarRepo;

        }






        [AllowAnonymous]
        [HttpGet("{idLekar}")]
        public async Task<ActionResult<LekarDto>> GetLekarById(decimal idLekar)
        {
            var lekar = await _lekarRepo.GetItemAsync(idLekar);

            if (lekar == null ) return NotFound("Practitioner not found");

            return Ok(lekar);
            
        }

    }
}