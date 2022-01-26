using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IPacientRepository : IRepository<Pacient, PacientDto>
    {
        Task<bool> IsActivated(decimal userId);

        Task<Pacient> GetPacientById(decimal patientId);
        
        Task<PacientSearchDto> GetPacientByBidAsync(string patentBid);
    }
}
