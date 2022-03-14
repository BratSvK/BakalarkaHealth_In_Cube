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

        /// <summary>
        /// Check the access to health record.
        /// </summary>
        /// <param name="idDoctor">Doctor id.</param>
        /// <param name="idZdravotnaKarta">Id of the health record of patient.</param>
        /// <returns></returns>
        public Task<bool> IsAllowed(decimal idDoctor, decimal idZdravotnaKarta);

        /// <summary>
        /// Get the id of general practitioner of patient.
        /// <param name="idZdravotnaKarta">Id of the health record of patient.</param>
        /// </summary>
        public Task<decimal> GetGeneralPractitionerId(decimal idZdravotnaKarta);
    }
}
