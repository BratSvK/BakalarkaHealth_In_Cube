using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface ILekarRepository : IRepository<Lekar, LekarDto>
    {
        Task<Lekar> GetLekarEntity(decimal lekarId);

        Task<LekarDto> GetLekarEntityByUserId(decimal userId);

        Task<decimal?> GetLekarIdByUser(decimal userId);


        Task<IEnumerable<ZiadankaDto>> GetAllRequetsByDoctorIdAsync(decimal lekarId);

        Task<PagedList<PacientCardDto>> GetAllPatientsByDoctorIdAsync(decimal lekarId, LekarParams userParams);
    }
}
