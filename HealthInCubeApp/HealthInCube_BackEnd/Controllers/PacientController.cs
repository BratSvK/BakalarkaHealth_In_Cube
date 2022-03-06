using System.Collections.Generic;
using System.Threading.Tasks;
using Castle.Core.Internal;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Pacient.Activated;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Patient controller.
    /// Working with all entities relative to patient.
    /// </summary>
    [Authorize(Roles = "Pacient")]
    public class PacientController : BaseApiController
    {
        private readonly IPacientRepository _pacientRepository;
        private readonly IZdravotnaKartaRepository _zdravotnaKartaRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="pacientRepository">Patient repository.</param>
        /// <param name="zdravotnaKartaRepository">Health record repository.</param>
        public PacientController(
            IPacientRepository pacientRepository,
            IZdravotnaKartaRepository zdravotnaKartaRepository)
        {
            _pacientRepository = pacientRepository;
            _zdravotnaKartaRepository = zdravotnaKartaRepository;
        }

        [HttpGet("{idPacient}")]
        public async Task<ActionResult<PacientDto>> GetPatient(decimal idPacient)
        {
            var pacient = await _pacientRepository.GetItemAsync(idPacient);

            if (pacient == null) return NotFound("You have no patient records");

            return Ok(pacient);
        }

        [HttpGet("all")]
        public async Task<ActionResult<ICollection<PacientDto>>> GetAllPatients()
        {

            var pacienti = await _pacientRepository.GetItemsAsync();

            if (pacienti.IsNullOrEmpty()) return NotFound("You have no patients records");

            return Ok(pacienti);

        }

        [HttpGet("{userId}/activated")]
        public async Task<ActionResult<ActivatedPatientDto>> ChecIfIsActivated(decimal userId)
        {
            var isActivated = await _pacientRepository.IsActivated(userId);
            if (isActivated == null)
            {
                return Ok(new ActivatedPatientDto
                {
                    IdPacient = -1,
                    IsActivated = false
                });
            }
            return Ok(isActivated);
        }

        [HttpGet("{patientId}/zdravotnaKarta")]
        public async Task<ActionResult<ZdravotnaKartaDto>> GetZdravotnaKarta(decimal patientId)
        {
            ZdravotnaKartaDto zdravotnaKarta = await _zdravotnaKartaRepository.GetItemAsync(patientId);
            if (zdravotnaKarta == null) return NotFound("Zdravotná karta sa nenašla");
            return Ok(zdravotnaKarta);
        }
    }
}
