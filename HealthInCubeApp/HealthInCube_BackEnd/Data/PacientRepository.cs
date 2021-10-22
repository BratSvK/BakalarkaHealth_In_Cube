using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HealthInCube_BackEnd.Data
{
    /// <summary>
    /// Patient repository.
    /// </summary>
    public class PacientRepository : IPacientRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        public PacientRepository(HealthInCubeContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IEnumerable<PacientDto>> GetItemsAsync()
        {
            var pecienti = await _context.Pacient.Include(p => p.ZdravotnaKartum).Include(p => p.ZdravPoistenies)
                .ToListAsync();


            return _mapper.Map<IEnumerable<PacientDto>>(pecienti);
        }

        public async Task<PacientDto> GetItemAsync(decimal itemId)
        {
            return await _context.Pacient.Include(p => p.ZdravotnaKartum).Include(p => p.ZdravPoistenies)
                .ProjectTo<PacientDto>(_mapper.ConfigurationProvider).SingleOrDefaultAsync();
        }

        public void InsertItem(Pacient item)
        {
            _context.Pacient.Add(item);
        }

        public void DeleteItem(Pacient item)
        {
            _context.Pacient.Remove(item);

        }

        public void UpdateItem(Pacient item)
        {
            // only mark it for update to db 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;

        }

        public async Task<bool> IsActivated(decimal userId)
        {
            return await _context.Pacient.AnyAsync(p => p.IdPouzivatel == userId);
        }
    }
}
