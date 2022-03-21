using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.DTOs.Ziadanka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

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
        private readonly IConfiguration _config;
        private readonly IPouzivatelRepository _pouzivatelRepository;
        private readonly IZiadankaRepository _ziadankaRepository;
        private readonly IEmailGeneratorService _emailGeneratorService;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="lekarRepo">Doctor repository.</param>
        /// <param name="pacientRepository">Pacient repository.</param>
        /// <param name="mapper">Mapper</param>
        /// <param name="config">Data from config file app config.</param>
        /// <param name="pouzivatelRepository">User repository.</param>
        /// <param name="ziadankaRepository">Requuests repository.</param>
        /// <param name="emailGeneratorService">Generator for emails.</param>
        public LekarController(
            ILekarRepository lekarRepo,
            IPacientRepository pacientRepository,
            IMapper mapper,
            IConfiguration config,
            IPouzivatelRepository pouzivatelRepository,
            IZiadankaRepository ziadankaRepository,
            IEmailGeneratorService emailGeneratorService)
        {
            _lekarRepo = lekarRepo;
            _pacientRepository = pacientRepository;
            _mapper = mapper;
            _config = config;
            _pouzivatelRepository = pouzivatelRepository;
            _ziadankaRepository = ziadankaRepository;
            _emailGeneratorService = emailGeneratorService;
        }

        /// <summary>
        /// Get all doctors by id.
        /// </summary>
        [AllowAnonymous]
        [HttpGet("{idLekar}")]
        public async Task<ActionResult<LekarDto>> GetLekarById(decimal idLekar)
        {
            var lekar = await _lekarRepo.GetItemAsync(idLekar);

            if (lekar == null) return NotFound("Lekar neexistuje!");

            return Ok(lekar);
        }

        /// <summary>
        /// Get all request by doctor.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("{idLekar}/request/all")]
        public async Task<ActionResult<ZiadankaPacientDto>> GetAllRequestByDoctor(decimal idLekar)
        {
            if (_lekarRepo.GetLekarEntity(idLekar).Result == null) return NotFound("Lekar neexistuje!");
            var requests = await _lekarRepo.GetAllRequetsByDoctorIdAsync(idLekar);
            return Ok(requests);
        }

        /// <summary>
        /// Get all patients by doctor.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("{idLekar}/patient/list")]
        public async Task<ActionResult<IEnumerable<PacientCardDto>>> GetAllPatient(decimal idLekar, [FromQuery] LekarParams userParams)
        {
            if (_lekarRepo.GetLekarEntity(idLekar).Result == null) return NotFound("Lekar neexistuje!");

            var patients = await _lekarRepo.GetAllPatientsByDoctorIdAsync(idLekar, userParams);

            Response.AddPaginationHeader(patients.CurrentPage, patients.PageSize, patients.TotalCount, patients.TotalPages);

            return Ok(patients);
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

            if (doctor == null) return NotFound("Lekar neexistuj�e!");

            return Ok(doctor);
        }


        /// <summary>
        /// Get Lekar by userId.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("id")]
        public async Task<ActionResult<decimal>> GetDoctorIdByUser()
        {
            var doctorId = await _lekarRepo.GetLekarIdByUser(User.GetUserId());

            if (!doctorId.HasValue) return NotFound("Lekar neexistuje!");

            return Ok(doctorId);
        }

        /// <summary>
        /// Check if doctor account is activated.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <returns></returns>
        [HttpGet("activated")]
        public async Task<ActionResult<bool>> GetIsActivatedAccount()
        {
            var isActivated = await _lekarRepo.GetIsActivatedAccountAsync(User.GetUserId());
            return Ok(isActivated);
        }

        /// <summary>
        ///  Create an patient account.
        /// </summary>
        [HttpPost("createPatientAccount")]
        public async Task<ActionResult<ZiadankaPacientDto>> CreatePatientAccount([FromBody] CreatePatientAccountDto createPatientAccount)
        {
            var patientId = _pacientRepository.GetItemsAsync().GetAwaiter().GetResult().Count();

            var userToPatient = await _pouzivatelRepository.GetPouzivatelWithRequests(createPatientAccount.IdUser);

            var patient = new Pacient
            {
                IdPouzivatel = userToPatient.Id,
                IdPacient = patientId + 1,
                IdVseobecnyLekar = createPatientAccount.IdLekar
            };

            var zdravotnaKarta = new ZdravotnaKartum
            {
                IdPacient = patient.IdPacient,
                IdMestoNarodenia = userToPatient.IdMestoNarodenia
            };

            patient.ZdravotnaKartum = zdravotnaKarta;
            _pacientRepository.InsertItem(patient);

            if (await _pacientRepository.SaveAllAsync())
            {
                await _emailGeneratorService.GenerateEmailForPatientCreation(userToPatient);
                // may have more request to more doctors 
                var requestToDelete = await RemoveFromRequest(userToPatient.Ziadanky, createPatientAccount.IdLekar);

                if (requestToDelete == null) return BadRequest("Failed to remove from requests");

                return Ok(requestToDelete);
            }

            return BadRequest("Failed to create and account for patient");
        }

        /// <summary>
        /// Delete patient by id.
        /// </summary>
        /// <param name="idPatient"></param>
        /// <returns></returns>
        [HttpDelete("{idPatient}")]
        public async Task<ActionResult> DeletePatient(decimal idPatient)
        {
            var patient = await _pacientRepository.GetPacientById(idPatient);
            if (patient == null) return NotFound("Patient not found");
            _pacientRepository.DeleteItem(patient);

            if (await _pacientRepository.SaveAllAsync()) return Ok();
            return BadRequest("Problem deleting the patient");

        }

        /// <summary>
        /// Get Patient by bid.
        /// </summary>
        /// <param name="bid">BID in user table(unique id)</param>
        /// <returns></returns>
        [HttpGet("search/patientByBid/{bid}")]
        public async Task<ActionResult<PacientSearchDto>> GetPatientByBid(string bid)
        {
            var patientSearch = await _pacientRepository.GetPacientByBidAsync(bid.Insert(6, "/"));
            return Ok(patientSearch);
        }

        /// <summary>
        /// Get all types of doctors.
        /// </summary>
        /// <param name="bid">BID in user table(unique id)</param>
        /// <returns></returns>
        [AllowAnonymous()]
        [HttpGet("types")]
        public async Task<ActionResult<IEnumerable<LekarTypeDto>>> GetTypesOfDoctors()
        {
            IEnumerable<LekarTypeDto> types = await _lekarRepo.GetLekarTypesAsync();
            return Ok(types);
        }

        /// <summary>
        /// Get all types of doctors.
        /// </summary>
        /// <param name="bid">BID in user table(unique id)</param>
        /// <returns></returns>
        [HttpGet("all/{idTyp}")]
        public async Task<ActionResult<IEnumerable<LekarSprievodkaDto>>> GetDoctorsByType(decimal idTyp)
        {
            IEnumerable<LekarSprievodkaDto> doctors = await _lekarRepo.GetLekarsByType(idTyp);
            return Ok(doctors);
        }

        private async Task<ZiadankaPacientDto> RemoveFromRequest(ICollection<Ziadanka> ziadanky, decimal idLekar)
        {
            var requestToDelete = ziadanky.SingleOrDefault(z => z.IdLekar == idLekar);
            if (requestToDelete == null) return null;

            requestToDelete.AcceptedAt = DateTime.Now;
            _ziadankaRepository.UpdateItem(requestToDelete);

            if (await _ziadankaRepository.SaveAllAsync()) return _mapper.Map<ZiadankaPacientDto>(requestToDelete);

            return null;
        }
    }
}
