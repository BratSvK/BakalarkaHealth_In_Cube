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
    [Authorize]
    public class PouzivatelController : BaseApiController
    {
        private readonly IPouzivatelRepository _pouzivatelRepository;
        private readonly IMapper _mapper;
        public PouzivatelController(IPouzivatelRepository pouzivatelRepository, IMapper mapper)
        {
            _mapper = mapper;
            _pouzivatelRepository = pouzivatelRepository;

        }



        // [HttpGet("roles")]
        // public async Task<ActionResult<IEnumerable<RolaDTO>>> GetAllRoles()
        // {
        //     var role = await _pouzivatelRepository.GetAllRoles();
        //     if (role == null) return NotFound("Nothing find");

        //     return Ok(role);
        // }


        // zatia funguje len pre lekara pridame poliocy pre admin lekar pacient vsetci 
        [Authorize(Roles ="Lekar,Pacient")]
        [HttpPost("add-photo")]
        public async Task<ActionResult> AddPhoto(IFormFile file)
        {
            // Full path to file in temp location
            var filePath = Path.GetTempFileName();

            if (file.Length > 0)
                using (var stream = new FileStream(filePath, FileMode.Create))
                    await file.CopyToAsync(stream);

            var fotkaBlob = await  ImageParser.GetImageBytesAsync(filePath);

            // var fotkaBlob = await ImageParser.GetImageBytesAsync(imagePath);

            var sourceUserId = User.GetUserId();
            var userToAddPhoto = await _pouzivatelRepository.GetPouzivatelEntity(sourceUserId);

            if (userToAddPhoto == null) return NotFound("User not found");

            if (userToAddPhoto.FotkaPouzivatel != null) return BadRequest("You cannot add your main photo");

            var fotkaPouzivatel = new FotkaPouzivatel 
            {
                IdPouzivatel = sourceUserId,
                Fotka = fotkaBlob
            };

            userToAddPhoto.FotkaPouzivatel = fotkaPouzivatel;

            // this is temporary -> look for implementation patter unit world
            if (await _pouzivatelRepository.SaveAllAsync()) return Ok();

            return BadRequest("Failed to save photo");

        }
        
        [Authorize(Roles ="Pacient")]
        [HttpGet("bydliska")]
        public async Task<ActionResult<BydliskoDto>> GetBydliskaAsync() 
        {

            var bydliska = await _pouzivatelRepository.GetBydliskaAsync();

            if(bydliska.Any()) return NotFound("You have no addresses");

            return Ok(bydliska);

        }







    }
}