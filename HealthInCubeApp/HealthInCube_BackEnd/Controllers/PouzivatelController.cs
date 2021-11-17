using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Pouzivatel controller.
    /// </summary>
    [Authorize]
    public class PouzivatelController : BaseApiController
    {
        private readonly IPouzivatelRepository _pouzivatelRepository;
        private readonly IMapper _mapper;
        private readonly IFotoRepository _fotoRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        public PouzivatelController(IPouzivatelRepository pouzivatelRepository, IMapper mapper, IFotoRepository fotoRepository)
        {
            _mapper = mapper;
            _fotoRepository = fotoRepository;
            _pouzivatelRepository = pouzivatelRepository;
        }


        #region Fotka

        [Authorize(Roles = "Lekar,Pacient")]
        [HttpPost("add-photo")]
        public async Task<ActionResult> AddPhoto(IFormFile file)
        {
            var userId = User.GetUserId();
            if (!_pouzivatelRepository.EntityExists(userId).Result) return NotFound("User not exits");
            // Full path to file in temp location
            var filePath = Path.GetTempFileName();

            if (file.Length > 0)
                using (var stream = new FileStream(filePath, FileMode.Create))
                    await file.CopyToAsync(stream);

            var fotkaBlob = await ImageParser.GetImageBytesAsync(filePath);

            var fotka = new FotkaPouzivatel
            {
                IdPouzivatel = userId,
                Fotka = fotkaBlob
            };

            _fotoRepository.InsertItem(fotka);

            if (await _fotoRepository.SaveAllAsync()) return Ok();

            return BadRequest("Failed to save photo");
        }

        [Authorize(Roles = "Lekar,Pacient")]
        [HttpPut("update-photo")]
        public async Task<ActionResult> UpdateFotka(IFormFile file)
        {
            var userId = User.GetUserId();
            if (!_fotoRepository.EntityExists(userId).Result) return NotFound("Photo not exits");
            // Full path to file in temp location
            var filePath = Path.GetTempFileName();

            if (file.Length > 0)
                using (var stream = new FileStream(filePath, FileMode.Create))
                    await file.CopyToAsync(stream);

            var fotkaBlob = await ImageParser.GetImageBytesAsync(filePath);

            var fotka = new FotkaPouzivatel
            {
                IdPouzivatel = userId,
                Fotka = fotkaBlob
            };

            _fotoRepository.UpdateItem(fotka);

            if (await _fotoRepository.SaveAllAsync()) return Ok();

            return BadRequest("Failed to update photo");
        }



        [Authorize(Roles = "Lekar,Pacient")]
        [HttpDelete("delete-photo")]
        public async Task<ActionResult> DeleteFotka()
        {
            var userId = User.GetUserId();
            var fotka = await _fotoRepository.GetItemAsync(userId);
            if (fotka == null) return NotFound("Photo not exits");

            var fotkaToDelete = _mapper.Map<FotkaPouzivatel>(fotka);

            _fotoRepository.DeleteItem(fotkaToDelete);

            if (await _fotoRepository.SaveAllAsync()) return Ok();

            return BadRequest("Failed to update photo");
        }






        #endregion



        #region Bydlisko

        [Authorize(Roles = "Pacient, Lekar")]
        [HttpGet("bydliska")]
        public async Task<ActionResult<IEnumerable<BydliskoDto>>> GetBydliskaAsync()
        {
            var userId = User.GetUserId();

            var bydliska = await _pouzivatelRepository.GetBydliskaAsync(userId);

            if (bydliska.Any()) return NotFound("You have no addresses");

            return Ok(bydliska);

        }


        [Authorize(Roles = "Pacient, Lekar")]
        [HttpGet("bydlisko/trvale")]
        public async Task<ActionResult<BydliskoDto>> GetTrvaleBydlisko()
        {
            var userId = User.GetUserId();

            var trvaleBydlisko = await _pouzivatelRepository.GetTrvaleBydlisko(userId);

            if (trvaleBydlisko == null) return NotFound("You have no actual living address");

            return Ok(trvaleBydlisko);

        }


        [Authorize(Roles = "Pacient, Lekar")]
        [HttpGet("bydlisko/trvale/mesto")]
        public async Task<ActionResult<BydliskoDto>> GetTrvaleBydliskoMesto()
        {
            var userId = User.GetUserId();

            var trvaleBydlisko = await _pouzivatelRepository.GetTrvaleMesto(userId);

            if (trvaleBydlisko == null) return NotFound("You have no actual living address");

            return Ok(trvaleBydlisko);

        }


        #endregion

    }
}