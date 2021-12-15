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
using HealthInCube_BackEnd.DTOs.Bydlisko;
using System;

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
        private readonly IBydliskoRepository _bydliskoRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        public PouzivatelController(IPouzivatelRepository pouzivatelRepository, IMapper mapper, IFotoRepository fotoRepository, IBydliskoRepository bydliskoRepository)
        {
            _mapper = mapper;
            _fotoRepository = fotoRepository;
            _bydliskoRepository = bydliskoRepository;
            _pouzivatelRepository = pouzivatelRepository;
        }

        #region Pouzivatel-Detail

        [HttpGet("detail")]
        public async Task<ActionResult<PouzivatelDetailDto>> GetUserDetail() => await _pouzivatelRepository.GetPouzivatelDetail(User.GetUserId());

        [HttpGet("addresses")]
        public async Task<ActionResult<IEnumerable<BydliskoDto>>> GetAllAdressessByUser()
        {
            var userId = User.GetUserId();
            var bydliska = await _bydliskoRepository.GetAllAdressessByUser(userId);

            if (!bydliska.Any()) return NotFound("User don't have any adressess");

            return Ok(bydliska); 
        }

        [HttpPut("address/{idAddress}/update")]
        public async Task<ActionResult> UpdateUserAddress([FromBody] UserUpdateBydliskoDto updateBydliskoDto, decimal idAddress)
        {
            var originBydlisko =  await _bydliskoRepository.GetOriginItemAsync(idAddress);

            _mapper.Map(updateBydliskoDto, originBydlisko);

            _bydliskoRepository.UpdateItem(originBydlisko);

            if (await _bydliskoRepository.SaveAllAsync()) return NoContent();

            return BadRequest("Failed to update your address"); 
        }


        [HttpPost("address/create")]
        public async Task<ActionResult<BydliskoDto>> CreateBydlisko(CreateBydliskoDto createBydlisko)
        {
            var userId = User.GetUserId();
            var bydlisko = new Bydlisko
            {
                IdPouzivatel = userId,
                Ulica = createBydlisko.Ulica,
                IdMesto = createBydlisko.IdMesto,
                Trvale = createBydlisko.Trvale ? "Y" : "N"
            };

            _bydliskoRepository.InsertItem(bydlisko);
            
            if (createBydlisko.Trvale) {
                var actualLivingAddress = await _bydliskoRepository.GetTrvaleBydliskoAsync(userId);
                if (actualLivingAddress != null)
                {
                    actualLivingAddress.AdresaDo = DateTime.Now;
                    actualLivingAddress.Trvale = "N";
                    _bydliskoRepository.UpdateItem(actualLivingAddress);
                }
            }
            if (await _bydliskoRepository.SaveAllAsync()) return Ok(_mapper.Map<BydliskoDto>(bydlisko));

            return BadRequest("Failed to create a address");
        }

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