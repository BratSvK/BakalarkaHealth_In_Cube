using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Working plan for doctor controller.
    /// </summary>
    public class PracovnaDobaController : BaseApiController
    {
        private readonly IPracovnaDobaRepository _pracovnaDobaRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="pracovnaDobaRepository">Pracovna doba repository.</param>
        public PracovnaDobaController(IPracovnaDobaRepository pracovnaDobaRepository)
        {
            _pracovnaDobaRepository = pracovnaDobaRepository;
        }

        /// <summary>
        /// List of working day from db.
        /// </summary>
        /// <returns></returns>
        [HttpGet("list/days")]
        public async Task<IEnumerable<ZoznamDenDto>> GetAllDaysInWeek()
         => await _pracovnaDobaRepository.GetAllDaysListAsync();

    }
}