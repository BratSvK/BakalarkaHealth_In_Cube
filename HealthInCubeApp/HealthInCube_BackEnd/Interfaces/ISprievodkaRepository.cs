using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers.Params;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ISprievodkaRepository : IRepository<Sprievodka, SprievodkaDto>
    {
        Task<IEnumerable<SprievodkaDto>> GetSprievodkyByWeek(SprievodkaParams sprievodkaParams);

        /// <summary>
        /// Get list of all appointments in selected day of the doctor.
        /// </summary>
        /// <param name="idLekar">Id of the doctor.</param>
        /// <param name="dayOfYear">Day of the sprievodky termin.</param>
        /// <returns></returns>
        Task<IList<Sprievodka>> GetListOfSprievodkaByDayAsync(decimal idLekar, int dayOfYear);

        Task<int> GetLastTerminCountInDayPerDoctorAsync(decimal idLekar, int dayOfYear);

        Task<bool> CheckIsAvailableTerminInDayOfYear(decimal idLekar, int dayOfYear);

        Task DeleteFromVystavenyTermin(SprievodkaDeleteDto sprievodkaDelete);

        Task<Sprievodka> DeactivateSprievodkaAsync(SprievodkaDeleteDto sprievodkaDelete);
    }
}