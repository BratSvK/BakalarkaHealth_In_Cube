using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.Vysetrenie;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Controller to work with health record.
    /// </summary>
    [Authorize(Roles = "Pacient, Lekar")]
    public class ZdravotnaKartaController : BaseApiController
    {
        private readonly IMapper _mapper;
        private readonly IPacientRepository _pacientRepository;
        private readonly IZdravotnaKartaRepository _zdravotnaKartaRepository;
        private readonly ILekarRepository _lekarRepo;

        public ZdravotnaKartaController(
            IMapper mapper,
            IPacientRepository pacientRepository,
            IZdravotnaKartaRepository zdravotnaKartaRepository,
            ILekarRepository lekarRepo)
        {
            _mapper = mapper;
            _pacientRepository = pacientRepository;
            _zdravotnaKartaRepository = zdravotnaKartaRepository;
            _lekarRepo = lekarRepo;
        }

        /// <summary>
        /// Check the access to a health record.
        /// </summary>
        /// <param name="patientId">The patient id.</param>
        [HttpGet("{patientId}/isAllowed")]
        public async Task<ActionResult<bool>> ChechPermissionToHealthRecord(decimal patientId)
        {
            var doctorId = await _lekarRepo.GetLekarIdByUser(User.GetUserId());
            return await _zdravotnaKartaRepository.IsAllowed(doctorId.Value, patientId);
        }

        /// <summary>
        /// Get health record.
        /// </summary>
        /// <param name="patientId">The patient id.</param>
        /// <returns></returns>
        [HttpGet("{patientId}")]
        public async Task<ActionResult<ZdravotnaKartaDto>> GetZdravotnaKarta(decimal patientId)
        {
            ZdravotnaKartaDto zdravotnaKarta = await _zdravotnaKartaRepository.GetItemAsync(patientId);
            if (zdravotnaKarta == null) return NotFound("Zdravotná karta sa nenašla");
            return Ok(zdravotnaKarta);
        }

        /// <summary>
        /// Patch health record.
        /// </summary>
        /// <param name="patientId">The patient id.</param>
        /// <param name="patchModel">The patch model from client.</param>
        [HttpPatch("{patientId}/update")]
        public async Task<IActionResult> PatchZdravotnaKarta(
            decimal patientId,
            [FromBody] JsonPatchDocument<ZdravotnaKartaUpdateDto> patchModel)
        {
            ZdravotnaKartum zdravotnaKarta = await _zdravotnaKartaRepository.GetOriginItemAsync(patientId);
            if (zdravotnaKarta == null) return NotFound();
            ZdravotnaKartaUpdateDto zdravotnaKartaDto = _mapper.Map<ZdravotnaKartaUpdateDto>(zdravotnaKarta);
            patchModel.ApplyTo(zdravotnaKartaDto);
            _mapper.Map(zdravotnaKartaDto, zdravotnaKarta);

            _zdravotnaKartaRepository.UpdateItem(zdravotnaKarta);
            if (await _zdravotnaKartaRepository.SaveAllAsync()) return Ok();

            return BadRequest("Nastala chyba pri aktualizovaní dát na karte");
        }

        #region Vysetrenia

        
        [HttpPost("{patientId}/vysetrenie")]
        public async Task<IActionResult> WriteResultToHealthRecord(decimal patientId, VysetrenieVysledokDto vysetrenieVysledok)
        {
            ZdravotnaKartum zdravotnaKarta = await _zdravotnaKartaRepository.GetOriginItemAsync(patientId);
            if (zdravotnaKarta == null) return NotFound();
            if (await _zdravotnaKartaRepository.WriteResultToHealthRecord(zdravotnaKarta, vysetrenieVysledok)) 
                return CreatedAtAction(nameof(WriteResultToHealthRecord), string.Empty);
            return BadRequest("Nastala chyba pri aktualizovaní dát na karta");
        }
        #endregion
    }
}
