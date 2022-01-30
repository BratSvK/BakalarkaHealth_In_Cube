using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers;
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

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="lekarRepo">Doctor repository.</param>
        /// <param name="pacientRepository">Pacient repository.</param>
        /// <param name="mapper">Mapper</param>
        /// <param name="config">Data from config file app config.</param>
        /// <param name="pouzivatelRepository">User repository.</param>
        public LekarController(ILekarRepository lekarRepo, IPacientRepository pacientRepository, IMapper mapper, IConfiguration config, IPouzivatelRepository pouzivatelRepository, IZiadankaRepository ziadankaRepository)
        {
            _lekarRepo = lekarRepo;
            _pacientRepository = pacientRepository;
            _mapper = mapper;
            _config = config;
            _pouzivatelRepository = pouzivatelRepository;
            _ziadankaRepository = ziadankaRepository;
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
        public async Task<ActionResult<ZiadankaDto>> GetAllRequestByDoctor(decimal idLekar)
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
        ///  Create an patient account.
        /// </summary>
        [HttpPost("createPatientAccount")]
        public async Task<ActionResult<ZiadankaDto>> CreatePatientAccount([FromBody] CreatePatientAccountDto createPatientAccount)
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
                SendConfirmationCreationEmailToPatient(userToPatient);
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

        private async Task<ZiadankaDto> RemoveFromRequest(ICollection<Ziadanka> ziadanky, decimal idLekar)
        {
            var requestToDelete = ziadanky.SingleOrDefault(z => z.IdLekar == idLekar);
            if (requestToDelete == null) return null;

            requestToDelete.AcceptedAt = DateTime.Now;
            _ziadankaRepository.UpdateItem(requestToDelete);

            if (await _ziadankaRepository.SaveAllAsync()) return _mapper.Map<ZiadankaDto>(requestToDelete);

            return null;
        }

        private void SendConfirmationCreationEmailToPatient(Pouzivatel userToPatient)
        {

            if (userToPatient == null)
            {
                return;
            }
            var smtpAddress = _config["Smtp:Host"];
            var portNumber = int.Parse(_config["Smtp:Port"]);
            var enableSSL = true;
            var emailFromAddress = _config["Smtp:Username"]; //Sender Email Address  
            var password = _config["Smtp:Password"]; //Sender Password  
            var emailToAddress = userToPatient.Email;

            string filePath = $"{System.IO.Directory.GetCurrentDirectory()}\\Assets\\logo.jpg";

            var linkedResource = new LinkedResource(filePath, MediaTypeNames.Image.Jpeg);

            var subject = "Your patient account has been created";
            var body = "<div style='text-align: center; background-color:  rgba(255, 230, 208, 0.363); width: 50%; position: absolute; margin-left: 25%; border-style: solid; border-width: 1px;border-color: rgba(255, 68, 0, 0.37);" +
             "border-radius:3px; padding: 10px;'>" + $"<div><img style='background: #ffe6d0; width: 100px; height: 100px;'" +
             $"src=\"cid:{linkedResource.ContentId}\"></img></div>" +
             "<br>" +
             "<div style ='font-size: large; color: dimgray;'>Dear " + userToPatient.GetFullName() + ",</div>" +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Your patient account has been created successfully! </div> " +
             "<br>" +
            "<div style ='font-size: meddium; color: dimgray;'> Please update your profile and set your health insurance company</div> " +
             "<br>" +
             "<div style ='font-size: meddium; color: dimgray;'> Have a nice day!  </div> " +
             "<div style ='font-size: meddium; color: dimgray;'> The HealthInCube Team </div> "
            + "</div>";

            var alternativeView = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
            alternativeView.LinkedResources.Add(linkedResource);

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFromAddress);
                mail.To.Add(emailToAddress);
                mail.Subject = subject;
                mail.AlternateViews.Add(alternativeView);
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment  
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new System.Net.NetworkCredential(emailFromAddress, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }
    }
}
