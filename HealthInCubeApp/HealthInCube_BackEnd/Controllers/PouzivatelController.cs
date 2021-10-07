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
            this._mapper = mapper;
            this._pouzivatelRepository = pouzivatelRepository;

        }



        [HttpPost("registerUser")]
        public async Task<ActionResult<RegisterPouzivatelDto>> RegisterPouzivatel(RegisterPouzivatelDto registerPouzivatel)
        {
            var pouzivatel = await _pouzivatelRepository.GetItemAsync(registerPouzivatel.IdPouzivatel);

            if (pouzivatel != null && pouzivatel.Email.Equals(registerPouzivatel.Email)) return BadRequest("User with this email already exists");
            var pouzivatelToInsert = await _pouzivatelRepository.InsertItem(_mapper.Map<Pouzivatel>(registerPouzivatel));

            if (await _pouzivatelRepository.SaveAllAsync()) return Ok("pouzivatel registered");

            return BadRequest("Failed to register pouzivatel");


        }







    }
}