using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;

namespace HealthInCube_BackEnd.Data
{
    public class PouzivatelRepository : IPouzivatelRepository
    {

        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public PouzivatelRepository(HealthInCubeContext context, IMapper mapper)
        {
            this._mapper = mapper;
            this._context = context;

        }



        public Task<bool> DeleteItem(decimal itemId)
        {
            throw new System.NotImplementedException();
        }

        public async Task<RegisterPouzivatelDto> GetItemAsync(decimal itemId)
        {
            var uzivatel = await _context.Pouzivatel.FindAsync(itemId);
            var uzivatelToSend = _mapper.Map<RegisterPouzivatelDto>(uzivatel);
            
            return uzivatelToSend; 
        }

        public Task<IEnumerable<RegisterPouzivatelDto>> GetItemsAsync()
        {
            throw new System.NotImplementedException();
        }

        public async Task<Pouzivatel> InsertItem(Pouzivatel item)
        {
            await _context.Pouzivatel.AddAsync(item);
            return item;
        }

        public async Task<bool> SaveAllAsync()
        {
            return  await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Pouzivatel item)
        {
            throw new System.NotImplementedException();
        }
    }
}