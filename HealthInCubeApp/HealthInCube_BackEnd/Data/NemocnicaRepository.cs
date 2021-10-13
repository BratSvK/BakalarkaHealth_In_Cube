using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;

using System.Linq;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Data
{
    public class NemocnicaRepository : INemocnicaRepistory
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;
        private readonly ILekarRepository _lekarRepository;

        public NemocnicaRepository(HealthInCubeContext context, IMapper mapper, ILekarRepository lekarRepository)
        {
            _lekarRepository = lekarRepository;
            _mapper = mapper;
            _context = context;
        }




        public async Task<IEnumerable<LekarDto>> GetAllPractitionersByCityAsync(decimal cityID)
        {
            var nemocnica = await _context.Nemocnica.Where(n => n.IdMesto == cityID)
                                            .Include(n => n.Oddelenies.Where(o => o.NazovOdd == "Všeobecný lekár"))
                                            .ThenInclude(od => od.Lekars)
                                            .ThenInclude(l => l.AtestacieLekars).SingleOrDefaultAsync();

            
            var lekari = new List<LekarDto>();

            if (nemocnica == null) return lekari;

            foreach (var oddelenie in nemocnica.Oddelenies)
            {
                foreach (var lekar in oddelenie.Lekars)
                {
                    var lekarDto =  await _lekarRepository.GetItemAsync(lekar.IdLekar);
                    lekari.Add(lekarDto);
                }
            }

            return lekari;
        }


        public async Task<bool> DeleteItem(decimal itemId)
        {
            var nemocnica = await _context.Nemocnica.FindAsync(itemId);
            if (nemocnica == null) return false;

            _context.Nemocnica.Remove(nemocnica);
            return true;
        }



        public async Task<NemocnicaDto> GetItemAsync(decimal itemId)
        {
            var nemocnica = await _context.Nemocnica.ProjectTo<NemocnicaDto>(_mapper.ConfigurationProvider).FirstOrDefaultAsync(n => n.Id_nem == itemId);
            return nemocnica;
        }

        public async Task<IEnumerable<NemocnicaDto>> GetItemsAsync()
        {
            var query = _context.Nemocnica.Include(x => x.Oddelenies).AsQueryable();

            return await query.ProjectTo<NemocnicaDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
        }

        public async Task<Nemocnica> InsertItem(Nemocnica item)
        {
            await _context.Nemocnica.AddAsync(item);
            return item;
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


    }
}