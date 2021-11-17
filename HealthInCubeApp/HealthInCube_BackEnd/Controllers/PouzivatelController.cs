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
    [Authorize(Roles = "Lekar,Pacient")]
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

        #region Pouzivatel-Detail

        
        [HttpGet("detail")]
        public async Task<ActionResult<PouzivatelDetailDto>> GetUserDetail() => await _pouzivatelRepository.GetPouzivatelDetail(User.GetUserId());
        

        

        #endregion



        #region Fotka

        [HttpGet("main-photo")]
        public async Task<ActionResult<FotkaDto>> GetMainUserPhoto() => await _fotoRepository.GetItemAsync(User.GetUserId());
        

        [HttpPost("add-photo")]
        public async Task<ActionResult> AddPhoto(IFormFile file)
        {
            var userId = User.GetUserId();
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

            if (await _fotoRepository.EntityExists(userId))
            {
                _fotoRepository.UpdateItem(fotka);

            } 
            else
            {
                _fotoRepository.InsertItem(fotka);

            }

            if (await _fotoRepository.SaveAllAsync()) return Ok();

            return BadRequest("Failed to save photo");
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




    }
}