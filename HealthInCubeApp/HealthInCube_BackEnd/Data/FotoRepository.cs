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


        public void DeleteItem(FotkaPouzivatel itemId)
        {
            throw new System.NotImplementedException();
        }

        public async Task<FotkaDto> GetFotkaByUserId(decimal userId)
        {
            var fotka =  await _context.FotkaPouzivatel.SingleOrDefaultAsync(f => f.IdPouzivatel == userId);
            return  _mapper.Map<FotkaDto>(fotka);
        }

        public async Task<FotkaDto> GetItemAsync(decimal itemId)
        {
            var fotka = await _context.FotkaPouzivatel.FindAsync(itemId);
            return _mapper.Map<FotkaDto>(fotka);
        }

        public async Task<IEnumerable<FotkaDto>> GetItemsAsync()
        {
            var query = _context.FotkaPouzivatel.AsQueryable();

            return await query.ProjectTo<FotkaDto>(_mapper.ConfigurationProvider).ToListAsync();
        }

        public void InsertItem(FotkaPouzivatel item)
        {
            throw new System.NotImplementedException();
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(FotkaPouzivatel item)
        {
            throw new System.NotImplementedException();
        }
    }
}