using System;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IPracovnaDobaRepository : IRepository<PracovnaDoba, PracovnaDobaDto>
    {
        Task<PracovnaDoba> GetPracovnaDobaToDateAsync(decimal idLekar, DayOfWeek den);
    }
}