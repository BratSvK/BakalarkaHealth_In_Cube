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
    public class LekarRepository : ILekarRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public LekarRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }

        // pozriet sa na triggre 
        public Task<bool> DeleteItem(decimal itemId)
        {
            throw new System.NotImplementedException();
        }

        public async Task<LekarDto> GetItemAsync(decimal itemId)
        {
            var lekar =  _context.Lekar
                                .Include(l => l.IdPouzivatelNavigation)
                                .Include(l => l.AtestacieLekars)
                                .Include(l => l.Oddelenies)
                                .ThenInclude(od => od.IdNemNavigation)
                                .Where(l => l.IdLekar == itemId)
                                .Select(l => new LekarDto {
                                    IdLekar = l.IdLekar,
                                    Meno = l.IdPouzivatelNavigation.Meno,
                                    Priezvisko = l.IdPouzivatelNavigation.Priezvisko,
                                    Mobil = l.IdPouzivatelNavigation.Mobil,
                                    Email = l.IdPouzivatelNavigation.Email,
                                    Nemocnica = l.IdOddelNavigation.IdNemNavigation.Nazov,
                                    OddelenieNazov = l.IdOddelNavigation.NazovOdd,
                                    Atestacie = l.AtestacieLekars
                                })
                                .AsNoTracking().AsQueryable();
                                

            return await lekar.SingleOrDefaultAsync();
        }

        public Task<IEnumerable<LekarDto>> GetItemsAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task<Lekar> InsertItem(Lekar item)
        {
            throw new System.NotImplementedException();
        }

        public Task<bool> SaveAllAsync()
        {
            throw new System.NotImplementedException();
        }

        public void UpdateItem(Lekar item)
        {
            throw new System.NotImplementedException();
        }
    }
}