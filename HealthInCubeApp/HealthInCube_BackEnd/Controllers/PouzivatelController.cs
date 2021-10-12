using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
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










    }
}