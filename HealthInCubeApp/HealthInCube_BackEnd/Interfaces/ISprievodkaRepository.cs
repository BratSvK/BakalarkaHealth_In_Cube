using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers.Params;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ISprievodkaRepository : IRepository<Sprievodka, SprievodkaDto>
    {
        /// <summary>
        /// Get sprievodka by week.
        /// Client select in calendar current week.
        /// </summary>
        /// <param name="sprievodkaParams">Client params.</param>
        Task<IEnumerable<SprievodkaDto>> GetSprievodkyByWeek(SprievodkaParams sprievodkaParams);

        /// <summary>
        /// Get list of all appointments in selected day of the doctor.
        /// </summary>
        /// <param name="idLekar">Id of the doctor.</param>
        /// <param name="dayOfYear">Day of the sprievodky termin.</param>
        /// <returns></returns>
        Task<IList<Sprievodka>> GetListOfSprievodkaByDayAsync(decimal idLekar, int dayOfYear);

        /// <summary>
        /// Get number of last termin in paricular day.
        /// </summary>
        /// <param name="idLekar">Doctor id.</param>
        /// <param name="dayOfYear">Day of year.</param>
        Task<int> GetLastTerminCountInDayPerDoctorAsync(decimal idLekar, int dayOfYear);

        /// <summary>
        /// Check for availability in particular day.
        /// </summary>
        /// <param name="idLekar">Doctor id.</param>
        /// <param name="dayOfYear">Day of year.</param>
        /// <returns>true/false</returns>
        Task<bool> CheckIsAvailableTerminInDayOfYear(decimal idLekar, int dayOfYear);

        /// <summary>
        /// Delete n appointments exlcuded is deactivated.
        /// </summary>
        /// <param name="sprievodkas">The original list of appointments to delete.</param>
        void DeleteSprievodky(IEnumerable<Sprievodka> sprievodkas);

        /// <summary>
        /// Insert sprievodky in range(bulk).
        /// </summary>
        /// <param name="sprievodkas">Appointments to insert.</param>
        Task InsertSprievodkyAsync(IEnumerable<Sprievodka> sprievodkas);

        /// <summary>
        /// Delete vystaveny termin from db.
        /// </summary>
        /// <param name="sprievodkaDelete">Selected appointment to delete.</param>
        Task DeleteFromVystavenyTermin(SprievodkaDeleteDto sprievodkaDelete);

        /// <summary>
        /// Delete complex transaction with prievodka.
        /// </summary>
        /// <param name="sprievodkaDelete">The model for deleted appointment.</param>
        Task<IEnumerable<Sprievodka>> DeleteSprievodkaAsync(SprievodkaDeleteDto sprievodkaDelete);

        /// <summary>
        /// Deactivation of sprievodka
        /// Actions:
        /// - removed from vystaveny termin
        /// - removed from zdravotna karta povolenie
        /// - is deactivated set to 1
        /// </summary>
        /// <param name="sprievodkaDelete">Model for delete operation.</param>
        Task<Sprievodka> DeactivateSprievodkaAsync(SprievodkaDeleteDto sprievodkaDelete);
    }
}