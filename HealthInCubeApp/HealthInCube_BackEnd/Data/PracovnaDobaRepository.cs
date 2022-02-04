using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;


namespace HealthInCube_BackEnd.Data
{
    public class PracovnaDobaRepository : IPracovnaDobaRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public PracovnaDobaRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;
        }

        public void DeleteItem(PracovnaDoba pracovnaDoba)
        {
            _context.PracovnaDobas.Remove(pracovnaDoba);
        }

        public Task<PracovnaDobaDto> GetItemAsync(decimal itemId)
        {
            return null;
        }

        public async Task<bool> EntityExists(decimal itemId)
        {
            return await Task.FromResult(false);
        }

        public async Task<IEnumerable<PracovnaDobaDto>> GetItemsAsync()
        {
            return await _context.Sprievodkas
                                .ProjectTo<PracovnaDobaDto>(_mapper.ConfigurationProvider)
                                .ToListAsync();
        }


        public void InsertItem(PracovnaDoba item)
        {
            _context.PracovnaDobas.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(PracovnaDoba item)
        {
           // nothing to change only mark entity that has been modifity 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.PracovnaDobas.CountAsync();
        }

        public async Task<PracovnaDoba> GetOriginItemAsync(decimal userId)
        {
            return await Task.FromResult<PracovnaDoba>(null);
        }

        public async Task<PracovnaDoba> GetPracovnaDobaToDateAsync(decimal idLekar, DayOfWeek den)
        {
            return await _context.PracovnaDobas
                .Where(prac => prac.IdLekar == idLekar && prac.IdDen == (byte)den)
                .AsNoTracking()
                .SingleOrDefaultAsync();
        }
    }
}