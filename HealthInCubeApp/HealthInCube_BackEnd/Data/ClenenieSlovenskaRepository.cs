using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

using System.Linq;

namespace HealthInCube_BackEnd.Data
{
    public class ClenenieSlovenskaRepository : IClenenieSlovenskaRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public ClenenieSlovenskaRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }

        public async Task<IEnumerable<MestoDto>> GetAllCitysByDistrict(decimal districtId)
        {
            var query = _context.Mesto.Where(m => m.IdOkres == districtId).AsQueryable();

            return await query.ProjectTo<MestoDto>(_mapper.ConfigurationProvider).ToListAsync();
        }

        public async Task<IEnumerable<OkresDto>> GetAllDistricts()
        {
            var query = _context.Okres.AsQueryable();

            return await query.ProjectTo<OkresDto>(_mapper.ConfigurationProvider).ToListAsync();
        }
    }
}