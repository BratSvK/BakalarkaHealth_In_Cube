using System.Runtime.InteropServices;
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

        public PouzivatelRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }



        public void DeleteItem(Pouzivatel pouzivatel)
        {
            _context.Users.Remove(pouzivatel);
        }

        public async Task<IEnumerable<BydliskoDto>> GetBydliskaAsync()
        {
           var query = _context.Bydlisko.AsQueryable();

           return await query.ProjectTo<BydliskoDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        // public async Task<IEnumerable<RolaDTO>> GetAllRoles()
        // {
        //     var query =  _context.Rola.AsQueryable();

        //     return await query.ProjectTo<RolaDTO>(_mapper.ConfigurationProvider).ToListAsync();
        // }

        public async Task<RegisterPouzivatelDto> GetItemAsync(decimal itemId)
        {
            var uzivatel = await _context.Users.FindAsync(itemId);
            var uzivatelToSend = _mapper.Map<RegisterPouzivatelDto>(uzivatel);
            
            return uzivatelToSend; 
        }

        public async Task<IEnumerable<RegisterPouzivatelDto>> GetItemsAsync()
        {
            var query = _context.Users.Include(x => x.Bydliskos).AsQueryable();

            return await query.ProjectTo<RegisterPouzivatelDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public async Task<Pouzivatel> GetPouzivatelEntity(decimal pouzivatelId)
        {
            return  await _context.Users.FindAsync(pouzivatelId);
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
    }
}