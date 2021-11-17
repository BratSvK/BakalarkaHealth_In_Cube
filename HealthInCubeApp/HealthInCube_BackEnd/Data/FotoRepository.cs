using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HealthInCube_BackEnd.Data
{
    public class FotoRepository : IFotoRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public FotoRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }


        public void DeleteItem(FotkaPouzivatel item)
        {
            _context.FotkaPouzivatel.Remove(item);
        }


        public async Task<FotkaDto> GetItemAsync(decimal userId)
        {
            var fotka = await _context.FotkaPouzivatel.AsNoTracking().SingleOrDefaultAsync(f => f.IdPouzivatel == userId);
            return _mapper.Map<FotkaDto>(fotka);
        }

        public async Task<bool> EntityExists(decimal itemId)
        {
            return await _context.FotkaPouzivatel.AnyAsync(f => f.IdPouzivatel == itemId);
        }

        public async Task<IEnumerable<FotkaDto>> GetItemsAsync()
        {
            var query = _context.FotkaPouzivatel.AsQueryable();

            return await query.ProjectTo<FotkaDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public void InsertItem(FotkaPouzivatel item)
        {
            _context.FotkaPouzivatel.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(FotkaPouzivatel item)
        {
            _context.Entry(item).State = EntityState.Modified;
        }
    }
}