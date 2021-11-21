using System.Collections.Generic;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IClenenieSlovenskaRepository
    {

        Task<IEnumerable<OkresDto>> GetAllDistricts();

        Task<IEnumerable<MestoDto>> GetAllCitysByDistrict(decimal districtId);

        Task<IEnumerable<MestoDto>> GetAllCities();
    }
}