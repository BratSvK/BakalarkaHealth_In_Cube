using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IZiadankaRepository : IRepository<Ziadanka, ZiadankaDto>
    {

        Task<Ziadanka> GetZiadankaByPatientId(int id);
        Task<Ziadanka> GetZiadankaByDoctorId(int id);

         
    }
}