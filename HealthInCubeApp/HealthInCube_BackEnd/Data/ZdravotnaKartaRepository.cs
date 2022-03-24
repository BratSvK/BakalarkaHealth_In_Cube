using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.Vysetrenie;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Data
{
    public class ZdravotnaKartaRepository : IZdravotnaKartaRepository
    {

        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public ZdravotnaKartaRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }
        public void DeleteItem(ZdravotnaKartum item)
        {
            _context.ZdravotnaKarta.Remove(item);
        }

        /// <summary>
        /// Order of composit PK e.Od, e.IdLekar, e.IdPacient.
        /// </summary>
        public async Task DeleteZdravotnaKartaPovolenieByPatient(SprievodkaDeleteDto sprievodkaDelete)
        {
            ZdravKartaPovolenium kartaPovolenium = 
                await _context.ZdravKartaPovolenia
                .FindAsync(new object[] { sprievodkaDelete.TerminOd, sprievodkaDelete.IdLekar, sprievodkaDelete.IdPacient });

            _context.ZdravKartaPovolenia.Remove(kartaPovolenium);
        }

        public Task<bool> EntityExists(decimal itemId)
        {
            throw new NotImplementedException();
        }

        public Task<int> GetCountAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<decimal> GetGeneralPractitionerId(decimal idZdravotnaKarta)
        => await _context.ZdravotnaKarta
            .Include(z => z.IdPacientNavigation)
            .ThenInclude(p => p.IdVseobecnyLekarNavigation)
            .Where(z => z.IdPacient == idZdravotnaKarta)
            .Select(z => z.IdPacientNavigation.IdVseobecnyLekarNavigation.IdLekar)
            .FirstOrDefaultAsync();
            

        /// <summary>
        /// Get health record per patient.
        /// </summary>
        /// <param name="patientId">The patient id.</param>
        /// <returns>The health record.</returns>
        public async Task<ZdravotnaKartaDto> GetItemAsync(decimal patientId)
        => await _context.ZdravotnaKarta
                .Include(z => z.VykVysetrenia)
                .Include(z => z.ZapChorobies)
                .Include(z => z.IdMestoNarodeniaNavigation)
                .Include(z => z.IdPacientNavigation)
                .ThenInclude(p => p.IdVseobecnyLekarNavigation)
                .ThenInclude(l => l.IdPouzivatelNavigation)
                .Where(z => z.IdPacient == patientId)
                .ProjectTo<ZdravotnaKartaDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync();

        public Task<IEnumerable<ZdravotnaKartaDto>> GetItemsAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<ZdravotnaKartum> GetOriginItemAsync(decimal itemId)
        => await _context.ZdravotnaKarta.FindAsync(itemId);

        public void InsertItem(ZdravotnaKartum item)
        {
            _context.ZdravotnaKarta.Add(item);
        }

        /// <inheritdoc/>
        public async Task<bool> IsAllowed(decimal idDoctor, decimal idZdravotnaKarta)
        {
            var generalPractitionerId = await GetGeneralPractitionerId(idZdravotnaKarta);
            if (generalPractitionerId == idDoctor)
            {
                return true;
            }

            return CheckValidDateWithSharedHealthRecordOfAppointment(idDoctor, idZdravotnaKarta);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(ZdravotnaKartum item)
        {
            _context.Entry(item).State = EntityState.Modified;
        }

        /// <inheritdoc/>
        public async Task<bool> WriteResultToHealthRecord(VysetrenieVysledokDto vysetrenieVysledok)
        {
            using var transaction = _context.Database.BeginTransaction();
            try
            {
                // 1. vytvorenie vysetrenia
                VykVysetrenium vysetrenieToAdd = _mapper.Map<VykVysetrenium>(vysetrenieVysledok);
                _context.VykVysetrenia.Add(vysetrenieToAdd);
                _context.SaveChanges();
                // 2. zapisat chorobu a priznaky 
                VykVysetrenium vysetrenie = await _context.VykVysetrenia
                    .OrderByDescending(vys => vys.IdVysetrenie)
                    .FirstOrDefaultAsync();
                vysetrenie.ZapChorobies.Add(_mapper.Map<ZapChoroby>(vysetrenieVysledok.ZapChoroba));
                _context.SaveChanges();
                // 3. predpisat liecbu a recept
                vysetrenie.PredpLiecbas.Add(_mapper.Map<PredpLiecba>(vysetrenieVysledok.PredpisanaLiecba));
                _context.SaveChanges();
                vysetrenie.Recepts.Add(_mapper.Map<Recept>(vysetrenieVysledok.Recept));
                _context.SaveChanges();

                transaction.Commit();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Add validation in one hour before to check health record by patient.
        /// </summary>
        private bool CheckValidDateWithSharedHealthRecordOfAppointment(decimal idDoctor, decimal idZdravotnaKarta)
        =>  _context.ZdravKartaPovolenia.Any(
            z => z.IdLekar == idDoctor && 
                 z.IdPacient == idZdravotnaKarta &&
                 (DateTime.Now.AddHours(1) >= z.Od && DateTime.Now <= z.Do));
        
    }
}
