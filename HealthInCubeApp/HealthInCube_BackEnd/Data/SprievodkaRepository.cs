using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
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

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public SprievodkaRepository(HealthInCubeContext context, IMapper mapper, IAppointmentSchedulerService appointmentSchedulerService)
        {
            _mapper = mapper;
            _appointmentSchedulerService = appointmentSchedulerService;
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
           return  await Task.FromResult<Sprievodka>(null);
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
            var query = _context.Sprievodkas.AsQueryable();

            if (sprievodkaParams.IdLekar > 0)
            {
                query = query.Where(p => p.IdLekar == sprievodkaParams.IdLekar);
            }
            else
            {
                query = query.Where(p => p.IdPacient == sprievodkaParams.IdPacient);
            }

            var selectedWeekNumber = sprievodkaParams.StartWeekBy.Date.GetWeekNumber();

            query = query.Where(s => _context.GetWeekNumberFromDb(s.TerminOd) == selectedWeekNumber);

            return await query.ProjectTo<SprievodkaDto>(_mapper.ConfigurationProvider).AsNoTracking().ToListAsync();
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
    }
}