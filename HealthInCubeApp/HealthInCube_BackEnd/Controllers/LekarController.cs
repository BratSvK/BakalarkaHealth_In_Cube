using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Controller to work with doctor and stuff about it 
    /// </summary>
    [Authorize(Roles = "Lekar")]
    public class LekarController : BaseApiController
    {
        private readonly ILekarRepository _lekarRepo;

        /// <summary>
        /// ctor.
        /// </summary>
        /// <param name="lekarRepo"></param>
        public LekarController(ILekarRepository lekarRepo)
        {
            _lekarRepo = lekarRepo;

        }

        /// <summary>
        /// Get all doctors by id.
        /// </summary>
        [AllowAnonymous]
        [HttpGet("{idLekar}")]
        public async Task<ActionResult<LekarDto>> GetLekarById(decimal idLekar)
        {
            var lekar = await _lekarRepo.GetItemAsync(idLekar);

            if (lekar == null) return NotFound("Practitioner not found");

            return Ok(lekar);
        }

        /// <summary>
        /// Get all request by doctor.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("{idLekar}/request/all")]
        public async Task<ActionResult<ZiadankaDto>> GetAllRequestByDoctor(decimal idLekar)
        {
            if (_lekarRepo.GetLekarEntity(idLekar).Result == null) return NotFound("Practitioner not exists");

            var requests = await _lekarRepo.GetAllRequetsByDoctorId(idLekar);

            if (requests.IsNullOrEmpty()) return NotFound("Nothing to look!");

            return Ok(requests);
        }



        /// <summary>
        /// Get Lekar by userId.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("user/{idUser}")]
        public async Task<ActionResult<LekarDto>> GetDoctorByUserId(decimal idUser)
        {
            var doctor = await _lekarRepo.GetLekarEntityByUserId(idUser);

            if (doctor == null) return NotFound("Practitioner not exists");

            return Ok(doctor);
        }
    }
}
