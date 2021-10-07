using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Interfaces;
using HealthInCubeModel;
using Microsoft.EntityFrameworkCore;

using System.Linq;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;

namespace HealthInCube_BackEnd.Data
{
    public class NemocnicaRepository : INemocnicaRepistory
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public NemocnicaRepository(HealthInCubeContext context, IMapper mapper)
        {
            this._mapper = mapper;
            this._context = context;
        }


        public Task<bool> DeleteItem(int itemId)
        {
            throw new System.NotImplementedException();
        }

        public Task<NemocnicaDto> GetItemAsync(int itemId)
        {
            throw new System.NotImplementedException();
        }

        public async Task<IEnumerable<NemocnicaDto>> GetItemsAsync()
        {
            var query = _context.NEMOCNICA.Include(x => x.ODDELENIA).AsQueryable();

            return await query.ProjectTo<NemocnicaDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public Task<NEMOCNICA> InsertItem(NEMOCNICA item)
        {
            throw new System.NotImplementedException();
        }

        public Task<bool> SaveAllAsync()
        {
            throw new System.NotImplementedException();
        }

        public void UpdateItem(NEMOCNICA item)
        {
            throw new System.NotImplementedException();
        }

       
    }
}