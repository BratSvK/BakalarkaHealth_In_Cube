using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs.Ziadanka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Helpers.Params;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IZiadankaRepository : IRepository<Ziadanka, ZiadankaBaseDto>
    {
        Task<Ziadanka> GetZiadankaByPatientId(int id);
        Task<Ziadanka> GetZiadankaByDoctorId(int id);
        Task<PagedList<ZiadankaLekarDto>> GetZiadankyByHospitalId(SpravcaParams spravcaParams);

        void InsertDoctorRequests(ZiadankaLekar ziadankaLekar);
    }
}