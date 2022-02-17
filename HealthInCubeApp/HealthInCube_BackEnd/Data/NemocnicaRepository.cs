using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

using System.Linq;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.DTOs.Nemocnica;

namespace HealthInCube_BackEnd.Data
{
    public class NemocnicaRepository : INemocnicaRepistory
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;
        private readonly ILekarRepository _lekarRepository;
        private readonly IFotoRepository _fotoRepository;

        public NemocnicaRepository(HealthInCubeContext context, IMapper mapper, ILekarRepository lekarRepository, IFotoRepository fotoRepository)
        {
            _fotoRepository = fotoRepository;
            _lekarRepository = lekarRepository;
            _mapper = mapper;
            _context = context;
        }

        public async Task<IEnumerable<LekarDto>> GetAllPractitionersByCityAsync(decimal cityID)
        {
            
            var nemocnica = await _context.Nemocnica.Where(n => n.IdMesto == cityID)
                                            .Include(n => n.Oddelenies.Where(o => o.NazovOdd == "Všeobecný lekár"))
                                            .ThenInclude(od => od.Lekars)
                                            .ThenInclude(l => l.AtestacieLekars).AsNoTracking().SingleOrDefaultAsync();

            var lekari = new List<LekarDto>();

            if (nemocnica == null) return lekari;

            foreach (var oddelenie in nemocnica.Oddelenies)
            {
                foreach (var lekar in oddelenie.Lekars)
                {
                    var lekarDto = await _lekarRepository.GetItemAsync(lekar.IdLekar);
                    lekari.Add(lekarDto);
                }
            }

            return lekari;
        }

        public void DeleteItem(Nemocnica nemocnica)
        {
            _context.Nemocnica.Remove(nemocnica);
        }

        public async Task<NemocnicaDto> GetItemAsync(decimal itemId)
        {
            var nemocnica = await _context.Nemocnica.ProjectTo<NemocnicaDto>(_mapper.ConfigurationProvider).FirstOrDefaultAsync(n => n.IdNem == itemId);
            return nemocnica;
        }

        public async Task<bool> EntityExists(decimal itemId)
        {
            return await _context.Nemocnica.AnyAsync(l => l.IdNem == itemId);
        }

        public async Task<IEnumerable<NemocnicaDto>> GetItemsAsync()
        {
            var query = _context.Nemocnica.Include(x => x.Oddelenies).AsQueryable();

            return await query.ProjectTo<NemocnicaDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public void InsertItem(Nemocnica item)
        {
             _context.Nemocnica.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Nemocnica item)
        {
            // only mark it for update to db 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<IEnumerable<LekarDto>> GetAllPractitionersByOkresAsync(decimal cityID)
        {
            // potrebujem si ziskat okresID 

            var query = await _context.Okres
                 .Join(
                         _context.Mesto,
                         okres => okres.IdOkres,
                         mesto => mesto.IdOkres,
                         (okres, mesto) => new
                         {
                             IdMesto = mesto.IdMesto,
                             IdOkres = okres.IdOkres
                         })
                 .Where(x => x.IdMesto == cityID)
                 .FirstOrDefaultAsync();

            var nemocnica = await _context.Nemocnica
                                            .Include(n => n.IdMestoNavigation)
                                            .Include(n => n.Oddelenies.Where(o => o.NazovOdd == "Všeobecný lekár"))
                                            .ThenInclude(od => od.Lekars).ThenInclude(lekar => lekar.IdPouzivatelNavigation)
                                            .ThenInclude(od => od.Lekars).ThenInclude(lekar => lekar.AtestacieLekars)
                                            .Where(n => n.IdMestoNavigation.IdOkres == query.IdOkres)
                                            .SingleOrDefaultAsync();

            var lekari = new List<LekarDto>();

            if (nemocnica == null) return lekari;
            // pozor na lazy loading 
            var oddelenia = nemocnica.Oddelenies.ToList();
            lekari = oddelenia.SelectMany(od => od.Lekars, (od, lek) => new LekarDto
            {
                IdLekar = lek.IdLekar,
                Meno = lek.IdPouzivatelNavigation.Meno,
                Priezvisko = lek.IdPouzivatelNavigation.Priezvisko,
                Mobil = lek.IdPouzivatelNavigation.Mobil,
                Email = lek.IdPouzivatelNavigation.Email,
                Nemocnica = nemocnica.Nazov,
                OddelenieNazov = od.NazovOdd,
                AtestacieId = lek.AtestacieLekars.Select(a => a.IdTyp).ToList(),
                Fotka = _fotoRepository.GetItemAsync(lek.IdPouzivatelNavigation.Id).Result.Fotka
            }).ToList();

            return lekari;
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Nemocnica.CountAsync();
        }

        public async Task<Nemocnica> GetOriginItemAsync(decimal itemId)
        {
            return await _context.Nemocnica.FindAsync(itemId);
        }
    }
}
