using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ISprievodkaRepository : IRepository<Sprievodka, SprievodkaDto>
    {
        Task<IEnumerable<SprievodkaDto>> GetSprievodkyByWeek(SprievodkaParams sprievodkaParams);
        
        Task<int> GetLastTerminCountInDayPerDoctorAsync(decimal idLekar, int dayOfYear);

        Task<bool> CheckIsAvailableTerminInDayOfYear(decimal idLekar, int dayOfYear);
    }
}