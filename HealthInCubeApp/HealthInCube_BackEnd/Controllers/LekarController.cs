using System;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
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
        private readonly IPacientRepository _pacientRepository;
        private readonly IMapper _mapper;

        /// <summary>
        /// ctor.
        /// </summary>
        /// <param name="lekarRepo"></param>
        public LekarController(ILekarRepository lekarRepo, IPacientRepository pacientRepository, IMapper mapper)
        {
            _lekarRepo = lekarRepo;
            _pacientRepository = pacientRepository;
            _mapper = mapper;
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

        /// <summary>
        ///  Create an patient account.
        /// </summary>
        [HttpPost("{idLekar}/createPatientAccount")]
        public async Task<ActionResult<PacientDto>> CreatePatientAccount(decimal idLekar, [FromBody] CreatePatientAccountDto createPatientAccount)
        {
            var patientId =  _pacientRepository.GetItemsAsync().Result.Count();

            var patient = new Pacient
            {
                IdPouzivatel = createPatientAccount.IdUser,
                IdPacient = patientId + 1,
                IdVseobecnyLekar = idLekar
            };

            var zdravotnaKarta = new ZdravotnaKartum
            {
                IdPacient = patient.IdPacient,
                IdMestoNarodenia = createPatientAccount.IdMiestoNarodenia
            };

            patient.ZdravotnaKartum = zdravotnaKarta;
            _pacientRepository.InsertItem(patient);

            if (await _pacientRepository.SaveAllAsync()) return Ok(_mapper.Map<PacientDto>(patient));

            return BadRequest("Failed to create and account for patient");
        }


        [HttpDelete("{idPatient}")]
        public async Task<ActionResult> DeletePatient(decimal idPatient)
        {
            var patient = await _pacientRepository.GetPacient(idPatient);

            if (patient == null) return NotFound("Patient not found");

            _pacientRepository.DeleteItem(patient);

            if (await _pacientRepository.SaveAllAsync()) return Ok();

            return BadRequest("Problem deleting the patient");

        }
    }
}
