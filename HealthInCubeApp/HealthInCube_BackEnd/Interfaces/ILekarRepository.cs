using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ILekarRepository : IRepository<Lekar, LekarDto>
    {

        Task<Lekar> GetLekarEntity(decimal lekarId);

        Task<IEnumerable<ZiadankaDto>> GetAllRequetsByDoctorId(decimal lekarId);


    }
}