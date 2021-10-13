using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface INemocnicaRepistory : IRepository<Nemocnica,NemocnicaDto>
    {


        Task<IEnumerable<LekarDto>> GetAllPractitionersByCityAsync(decimal cityID);


        // Task<bool> AddDoctorToNemocnica(Lekar)

    }
}