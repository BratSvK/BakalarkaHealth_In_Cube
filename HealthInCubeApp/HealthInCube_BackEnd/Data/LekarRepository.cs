using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using HealthInCube_BackEnd.DTOs.Ziadanka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HealthInCube_BackEnd.Data
{
    /// <summary>
    /// Lekar repositrory.
    /// </summary>
    public class LekarRepository : ILekarRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public LekarRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }

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

        public async Task<bool> EntityExists(decimal itemId)
        {
          return await  _context.Lekar.AnyAsync(l => l.IdLekar == itemId);
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

        public async Task<IEnumerable<ZiadankaPacientDto>> GetAllRequetsByDoctorIdAsync(decimal lekarId)
        {
            return await _context.Ziadanka
                .Include(z => z.IdPouzivatelNavigation)
                .Where(z => z.IdLekar == lekarId && z.AcceptedAt == null)
                .ProjectTo<ZiadankaPacientDto>(_mapper.ConfigurationProvider)
                .OrderBy(z => z.CreatedAt)
                .ToListAsync();
        }

        public void InsertItem(Lekar item)
        {
            _context.Lekar.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Lekar item)
        {
            throw new System.NotImplementedException();
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Lekar.CountAsync();
        }

        public async Task<Lekar> GetOriginItemAsync(decimal lekarId)
        {
            return await _context.Lekar
                                 .Include(l => l.IdPouzivatelNavigation)
                                 .ThenInclude(us => us.FotkaPouzivatel)
                                 .Include(l => l.AtestacieLekars)
                                 .Include(l => l.Oddelenies)
                                 .ThenInclude(od => od.IdNemNavigation)
                                 .Where(l => l.IdLekar == lekarId)
                                 .SingleOrDefaultAsync();
        }

        public async Task<decimal?> GetLekarIdByUser(decimal userId)
        {
            return await _context.Lekar.Where(l => l.IdPouzivatel == userId).Select(l => l.IdLekar).SingleOrDefaultAsync();
        }

        public async Task<PagedList<PacientCardDto>> GetAllPatientsByDoctorIdAsync(decimal lekarId, LekarParams userParams)
        {
            // only ready only query
            var query = _context.Pacient
                .Include(p => p.IdPouzivatelNavigation)
                .ThenInclude(p => p.FotkaPouzivatel)
                .Include(p => p.ZdravotnaKartum)
                .ThenInclude(m => m.IdMestoNarodeniaNavigation)
                .AsQueryable();

            // -1 getting accurate year 
            var dateOfBirthMin = DateTime.Today.AddYears(-userParams.AgeTo - 1);
            var dateOfBirthMax = DateTime.Today.AddYears(-userParams.AgeFrom);

            query = query.Where(p => p.IdVseobecnyLekar == lekarId);

            query = query.Where(p => p.IdPouzivatelNavigation.DatNarodenia >= dateOfBirthMin 
                                  && p.IdPouzivatelNavigation.DatNarodenia <= dateOfBirthMax);

            if (userParams.LastName != null)
            {
                query = query.Where(p => p.IdPouzivatelNavigation.Priezvisko == userParams.LastName);
            }

            if (userParams.BID != null)
            {
                query = query.Where(p => p.IdPouzivatelNavigation.RodCislo == userParams.BID);
            }

            // pasing queriy to pageList class.
            return await PagedList<PacientCardDto>.CreateAsync(
                query.ProjectTo<PacientCardDto>(_mapper.ConfigurationProvider).AsNoTracking(), 
                userParams.PageNumber, 
                userParams.PageSize);
        }

        public async Task<IEnumerable<LekarTypeDto>> GetLekarTypesAsync()
        {
            return await _context.TypLekara
                .ProjectTo<LekarTypeDto>(_mapper.ConfigurationProvider)
                .OrderBy(t => t.Nazov)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<IEnumerable<LekarSprievodkaDto>> GetLekarsByType(decimal idTyp)
        {
            return await _context.Lekar
                .Include(l => l.AtestacieLekars)
                .Include(l => l.IdPouzivatelNavigation)
                .Include(l => l.Oddelenies)
                .ThenInclude(od => od.IdNemNavigation)
                .ThenInclude(n => n.IdMestoNavigation)
                .Where(l => l.AtestacieLekars.Any(at => at.IdTyp == idTyp))
                .OrderBy(l => l.IdOddelNavigation.IdNemNavigation.IdMestoNavigation.Nazov)
                .AsNoTracking()
                .ProjectTo<LekarSprievodkaDto>(_mapper.ConfigurationProvider)
                .ToListAsync();
        }

        public async Task<int> GetAverageTimePerPatientAsync(decimal lekarId)
        {
            return await _context.Lekar
                .Where(l => l.IdLekar == lekarId)
                .Select(l => l.DlzkaVysetrenia)
                .FirstOrDefaultAsync();
        }
    }
}
