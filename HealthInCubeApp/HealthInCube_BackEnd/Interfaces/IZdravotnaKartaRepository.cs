using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    /// <summary>
    /// Interface for health record for patient.
    /// </summary>
    public interface IZdravotnaKartaRepository :  IRepository<ZdravotnaKartum, ZdravotnaKartaDto>
    {
        /// <summary>
        /// Delete from health records time allowment.
        /// </summary>
        /// <returns></returns>
        public Task DeleteZdravotnaKartaPovolenieByPatient(SprievodkaDeleteDto sprievodkaDelete);
    }
}
