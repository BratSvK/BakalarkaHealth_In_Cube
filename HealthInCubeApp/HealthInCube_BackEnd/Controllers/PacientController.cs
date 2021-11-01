using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Castle.Core.Internal;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Patient controller.
    /// Working with all entities relative to patient.
    /// </summary>
    //[Authorize(Roles = "Pacient")]
    public class PacientController : BaseApiController
    {
        private readonly IPacientRepository _pacientRepository;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        public PacientController(IPacientRepository pacientRepository, IMapper mapper)
        {
            _pacientRepository = pacientRepository;
            _mapper = mapper;
        }


        [HttpGet("all")]
        public async Task<ActionResult<ICollection<PacientDto>>> GetAllPatients()
        {

            var pacienti = await _pacientRepository.GetItemsAsync();

            if (pacienti.IsNullOrEmpty()) return NotFound("You have no patients records");

            return Ok(pacienti);

        }



        [HttpGet("{userId}/activated")]
        public async Task<ActionResult<bool>> ChecIfIsActivated(decimal userId)
        {
            var isActivated = await _pacientRepository.IsActivated(userId);
            return Ok(isActivated);
        }






    }
}
