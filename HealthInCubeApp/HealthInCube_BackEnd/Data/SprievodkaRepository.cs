using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers.Params;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Services.Models;
using Microsoft.EntityFrameworkCore;


namespace HealthInCube_BackEnd.Data
{
    /// <summary>
    /// Repo for sprievodky.
    /// </summary>
    public class SprievodkaRepository : ISprievodkaRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;
        private readonly IAppointmentSchedulerService _appointmentSchedulerService;
        private readonly IZdravotnaKartaRepository _zdravotnaKartaRepository;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public SprievodkaRepository(
            HealthInCubeContext context, 
            IMapper mapper, 
            IAppointmentSchedulerService appointmentSchedulerService,
            IZdravotnaKartaRepository zdravotnaKartaRepository)
        {
            _mapper = mapper;
            _appointmentSchedulerService = appointmentSchedulerService;
            _zdravotnaKartaRepository = zdravotnaKartaRepository;
            _context = context;
        }

        public void DeleteItem(Sprievodka sprievodka)
        {
            _context.Sprievodkas.Remove(sprievodka);
        }

        public Task<SprievodkaDto> GetItemAsync(decimal itemId)
        {
            return null;
        }

        public async Task<bool> EntityExists(decimal itemId)
        {
            return await _context.Sprievodkas.AnyAsync(l => l.IdLekar == itemId);
        }

        public async Task<IEnumerable<SprievodkaDto>> GetItemsAsync()
        {
            return await _context.Sprievodkas
                                .ProjectTo<SprievodkaDto>(_mapper.ConfigurationProvider)
                                .ToListAsync();
        }

        public void InsertItem(Sprievodka item)
        {
            _context.Sprievodkas.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Sprievodka item)
        {
            // nothing to change only mark entity that has been modifity 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Sprievodkas.CountAsync();
        }

        public async Task<Sprievodka> GetOriginItemAsync(decimal userId)
        {
            return await Task.FromResult<Sprievodka>(null);
        }

        /// <summary>
        /// Get sprievodka by week.
        /// Client select in calendar current week.
        /// </summary>
        /// <param name="sprievodkaParams">Client params.</param>
        /// 
        /// <returns></returns>
        public async Task<IEnumerable<SprievodkaDto>> GetSprievodkyByWeek(SprievodkaParams sprievodkaParams)
        {
            var query = _context.Sprievodkas
                .AsQueryable();

            var selectedWeekNumber = sprievodkaParams.StartWeekBy.Date.GetWeekNumber();
            query = query.Where(s => _context.GetWeekNumberFromDb(s.TerminOd) == selectedWeekNumber && s.IsDeactivated == false);

            if (sprievodkaParams.IdLekar > 0)
            {
                query = query
                    .Include(s => s.IdPacientNavigation)
                    .ThenInclude(p => p.IdPouzivatelNavigation)
                    .Include(s => s.IdPacientNavigation.ZdravotnaKartum)
                    .ThenInclude(z => z.IdMestoNarodeniaNavigation)
                    .Where(p => p.IdLekar == sprievodkaParams.IdLekar);

                return await query.ProjectTo<SprievodkaLekarDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
            }
            else
            {

                query = query
                    .Include(s => s.IdTypLekarNavigation)
                    .Include(s => s.IdLekarNavigation)
                    .ThenInclude(l => l.IdPouzivatelNavigation)
                    .Where(p => p.IdPacient == sprievodkaParams.IdPacient);

                return await query.ProjectTo<SprievodkaPacientDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
            }
        }

        /// <summary>
        /// Get number of last termin in paricular day.
        /// </summary>
        /// <param name="idLekar">Doctor id.</param>
        /// <param name="dayOfYear">Day of year.</param>
        /// <returns></returns>
        public async Task<int> GetLastTerminCountInDayPerDoctorAsync(decimal idLekar, int dayOfYear)
        {
            return await _context.VystavenyTermins.CountAsync(t => t.IdLekar == idLekar && t.DayOfYear == dayOfYear);
        }

        /// <summary>
        /// Check for availability in particular day.
        /// </summary>
        /// <param name="idLekar">Doctor id.</param>
        /// <param name="dayOfYear">Day of year.</param>
        /// <returns>true/false</returns>
        public async Task<bool> CheckIsAvailableTerminInDayOfYear(decimal idLekar, int dayOfYear)
        {
            var maxPocet = _appointmentSchedulerService.GetMaxNumberOfAppointmentsPerDay();
            var pocetVDni = await GetLastTerminCountInDayPerDoctorAsync(idLekar, dayOfYear);
            return (maxPocet - pocetVDni) > 0;
        }

        public async Task DeleteFromVystavenyTermin(SprievodkaDeleteDto sprievodkaDelete)
        {
            VystavenyTermin vystavenyTerminToDelete = await _context.VystavenyTermins
                .Where(v => v.IdPacient == sprievodkaDelete.IdPacient &&
                        v.IdLekar == sprievodkaDelete.IdLekar &&
                        v.DayOfYear == sprievodkaDelete.TerminOd.DayOfYear)
                .FirstOrDefaultAsync();

            _context.VystavenyTermins.Remove(vystavenyTerminToDelete);
        }

        /// <inheritdoc/>
        public async Task<Sprievodka> DeactivateSprievodkaAsync(SprievodkaDeleteDto sprievodkaDelete)
        {
            var sprievodkaToDeactivate = await _context.Sprievodkas
                .FindAsync(new object[] { sprievodkaDelete.IdLekar, sprievodkaDelete.IdPacient, sprievodkaDelete.TerminOd });

            DeactivateAndSetDenyMessage(sprievodkaDelete, sprievodkaToDeactivate);
            _context.Sprievodkas.Update(sprievodkaToDeactivate);

            await DeleteFromVystavenyTermin(sprievodkaDelete);
            await _zdravotnaKartaRepository.DeleteZdravotnaKartaPovolenieByPatient(sprievodkaDelete);

            return sprievodkaToDeactivate;
        }

        /// <inheritdoc/>
        public async Task<IList<Sprievodka>> GetListOfSprievodkaByDayAsync(decimal idLekar, int dayOfYear)
        => await _context.Sprievodkas
                .Where(s => s.IdLekar == idLekar && s.TerminOd.DayOfYear == dayOfYear)
                .OrderBy(s => s.TerminOd)
                .ToListAsync();

        private static void DeactivateAndSetDenyMessage(SprievodkaDeleteDto sprievodkaDelete, Sprievodka sprievodkaToDeactivate)
        {
            sprievodkaToDeactivate.IsDeactivated = true;
            sprievodkaToDeactivate.ZrusenieDovod = sprievodkaDelete.ZrusenieDovod;
        }

        /// <inheritdoc/>
        public void DeleteSprievodky(IEnumerable<Sprievodka> sprievodkas)
        {
           _context.Sprievodkas.RemoveRange(sprievodkas.Where(s => s.IsDeactivated != true));
           _context.SaveChanges();
        }

        public async Task InsertSprievodkyAsync(IEnumerable<Sprievodka> sprievodkas)
        {
            await _context.Sprievodkas.AddRangeAsync(sprievodkas);
        }

        /// <inheritdoc/>
        public async Task<IEnumerable<Sprievodka>> DeleteSprievodkaAsync(SprievodkaDeleteDto sprievodkaDelete)
        {

            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    IList<Sprievodka> sprievodkaZoznam =
                        await GetListOfSprievodkaByDayAsync(sprievodkaDelete.IdLekar, sprievodkaDelete.TerminOd.DayOfYear);

                    Sprievodka deletedSprievodka = await DeactivateSprievodkaAsync(sprievodkaDelete);

                    if (sprievodkaZoznam.Count < 2)
                    {
                        _context.SaveChanges();
                        transaction.Commit();
                        return sprievodkaZoznam.Where(s => s.IsDeactivated);
                    }

                    DeleteSprievodky(sprievodkaZoznam);

                    IList<Sprievodka> spriedkaListNewAfterRecalculation =
                        _appointmentSchedulerService.RecaulculateOldListOfSprievodkaByDay(
                            new AppointmentRecalculateModel
                            {
                                SprievodkyZoznam = sprievodkaZoznam,
                                IndexOfRemovedSprievodka = sprievodkaZoznam.IndexOf(deletedSprievodka)
                            });

                    await InsertSprievodkyAsync(spriedkaListNewAfterRecalculation);

                    _context.SaveChanges();
                    transaction.Commit();
                    return spriedkaListNewAfterRecalculation;
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    return null;
                }
            }
        }
     }
}