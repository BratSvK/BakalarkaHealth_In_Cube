using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Data
{
    /// <summary>
    /// Adressess repository.
    /// </summary>
    public class BydliskoRepository : IBydliskoRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        public BydliskoRepository(HealthInCubeContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public void DeleteItem(Bydlisko bydlisko)
        {
            _context.Bydlisko.Remove(bydlisko);
        }

        public async Task<bool> EntityExists(decimal bydliskoId)
        {
            return await _context.Bydlisko.AnyAsync(l => l.IdBydliska == bydliskoId);
        }

        public async Task<IEnumerable<BydliskoDto>> GetAllAdressessByUser(decimal userId)
        {

            if (!_context.Bydlisko.Any(b => b.IdPouzivatel == userId))
            {
                return null;
            }

            var query = await _context.Bydlisko
                .Include(b => b.IdMestoNavigation)
                .Where(b => b.IdPouzivatel == userId)
                .ToListAsync();

            return _mapper.Map<IEnumerable<BydliskoDto>>(query);
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Bydlisko.CountAsync();
        }

        public async Task<BydliskoDto> GetItemAsync(decimal bydliskoId)
        {
            var bydlisko =  await _context.Bydlisko.FindAsync(bydliskoId);

            return _mapper.Map<BydliskoDto>(bydlisko);
        }

        public async Task<IEnumerable<BydliskoDto>> GetItemsAsync()
        {
            return await _context.Bydlisko
                                .Include(b => b.IdMesto)
                                .ProjectTo<BydliskoDto>(_mapper.ConfigurationProvider)
                                .ToListAsync();
        }

        public async Task<Bydlisko> GetOriginItemAsync(decimal bydliskoId)
        {
            return await _context.Bydlisko.FindAsync(bydliskoId);
        }

        public void InsertItem(Bydlisko bydlisko)
        {
            _context.Bydlisko.Add(bydlisko);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Bydlisko bydlisko)
        {
            _context.Entry(bydlisko).State = EntityState.Modified;
        }

        public async Task<Bydlisko> GetTrvaleBydlisko(decimal pouzivatelId)
        {
            return await _context.Bydlisko
                .Include(b => b.IdMestoNavigation)
                .SingleOrDefaultAsync(b => b.IdPouzivatel == pouzivatelId && b.Trvale.Equals("Y"));
        }
    }
}
