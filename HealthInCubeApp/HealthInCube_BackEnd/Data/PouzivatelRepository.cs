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
    public class PouzivatelRepository : IPouzivatelRepository
    {

        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public PouzivatelRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }

        public void DeleteItem(Pouzivatel pouzivatel)
        {
            _context.Users.Remove(pouzivatel);
        }

        public async Task<Pouzivatel> GetPouzivatelWithRequests(decimal pouzivatelId)
        {
            var userWithRequest = await _context.Users
                .Include(u => u.Ziadanky)
                .SingleOrDefaultAsync(u => u.Id == pouzivatelId);

            return userWithRequest;
        }    

        public async Task<string> GetTrvaleMesto(decimal pouzivatelId)
        {
            var aktualneMesto = _context.Bydlisko
                .Include(b => b.IdMestoNavigation)
                .AsQueryable();

            aktualneMesto = aktualneMesto.Where(b => b.IdPouzivatel == pouzivatelId && b.Trvale.Equals("Y"));

            return await aktualneMesto.Select(b => b.IdMestoNavigation.Nazov).SingleOrDefaultAsync();
        }

        public async Task<PouzivatelDetailDto> GetPouzivatelDetail(decimal pouzivatelId)
        {
            var pouzivatel =  await _context.Users
                .Include(u => u.Bydliskos)
                .ThenInclude(b =>b.IdMestoNavigation)
                .Where(u => u.Id == pouzivatelId)
                .SingleOrDefaultAsync();

            return _mapper.Map<PouzivatelDetailDto>(pouzivatel);

        }


        public async Task<RegisterPouzivatelDto> GetItemAsync(decimal itemId)
        {
            var uzivatel = await _context.Users.FindAsync(itemId);
            var uzivatelToSend = _mapper.Map<RegisterPouzivatelDto>(uzivatel);
            
            return uzivatelToSend; 
        }

        public async Task<bool> EntityExists(decimal itemId)
        { 
            return await _context.Users.AnyAsync(u => u.Id == itemId);
        }

        public async Task<IEnumerable<RegisterPouzivatelDto>> GetItemsAsync()
        {
            var query = _context.Users.Include(x => x.Bydliskos).AsQueryable();

            return await query.ProjectTo<RegisterPouzivatelDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public void InsertItem(Pouzivatel item)
        {
             _context.Users.Add(item);
            
        }

        public async Task<bool> SaveAllAsync()
        {
            return  await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Pouzivatel item)
        {
            // only mark it for update to db 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Users.CountAsync();
        }

        public Task<int> GetCountNumber()
        {
            throw new System.NotImplementedException();
        }

        public async Task<Pouzivatel> GetOriginItemAsync(decimal pouzivatelId)
        {
            return await _context.Users.Include(u => u.FotkaPouzivatel).SingleOrDefaultAsync(p => p.Id == pouzivatelId);
        }
    }
}