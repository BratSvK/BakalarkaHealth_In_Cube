using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
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
        public void DeleteItem(Lekar itemId)
        {
            throw new System.NotImplementedException();
        }

        public async Task<LekarDto> GetItemAsync(decimal itemId)
        {
            var lekar =  _context.Lekar
                                .Include(l => l.IdPouzivatelNavigation)
                                .ThenInclude(us => us.FotkaPouzivatel)
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
                                    AtestacieId = l.AtestacieLekars.Select(a => a.IdTyp).ToList(),
                                    Fotka = l.IdPouzivatelNavigation.FotkaPouzivatel.Fotka
                                })
                                .AsNoTracking().AsQueryable();
                                

            return await lekar.SingleOrDefaultAsync();
        }

        public Task<IEnumerable<LekarDto>> GetItemsAsync()
        {
            throw new System.NotImplementedException();
        }

        public async Task<Lekar> GetLekarEntity(decimal lekarId)
        {
            return await _context.Lekar.FindAsync(lekarId);
        }

        public async Task<LekarDto> GetLekarEntityByUserId(decimal userId)
        {
            var lekar = _context.Lekar
                .Include(l => l.IdPouzivatelNavigation)
                .ThenInclude(us => us.FotkaPouzivatel)
                .Include(l => l.AtestacieLekars)
                .Include(l => l.Oddelenies)
                .ThenInclude(od => od.IdNemNavigation)
                .Where(l => l.IdPouzivatel == userId)
                .Select(l => new LekarDto
                {
                    IdLekar = l.IdLekar,
                    Meno = l.IdPouzivatelNavigation.Meno,
                    Priezvisko = l.IdPouzivatelNavigation.Priezvisko,
                    Mobil = l.IdPouzivatelNavigation.Mobil,
                    Email = l.IdPouzivatelNavigation.Email,
                    Nemocnica = l.IdOddelNavigation.IdNemNavigation.Nazov,
                    OddelenieNazov = l.IdOddelNavigation.NazovOdd,
                    AtestacieId = l.AtestacieLekars.Select(a => a.IdTyp).ToList(),
                    Fotka = l.IdPouzivatelNavigation.FotkaPouzivatel.Fotka
                })
                .AsNoTracking().AsQueryable();


            return await lekar.SingleOrDefaultAsync();

        }

        public async Task<IEnumerable<ZiadankaDto>> GetAllRequetsByDoctorId(decimal lekarId)
        {
            var requests =  await _context.Ziadanka
                .Include(z => z.IdPouzivatelNavigation)
                .Where(z => z.IdLekar == lekarId && z.AcceptedAt == null)
                .OrderBy(z => z.CreatedAt)
                .ToListAsync();



            return _mapper.Map<List<Ziadanka>, IEnumerable<ZiadankaDto>>(requests);
        }

        

        public void InsertItem(Lekar item)
        {
            throw new System.NotImplementedException();
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Lekar item)
        {
            throw new System.NotImplementedException();
        }
    }
}