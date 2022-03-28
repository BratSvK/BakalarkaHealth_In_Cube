using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek.Davkovanie;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces.CiselnikHelper
{
    /// <summary>
    /// Helper interface for liek table.
    /// </summary>
    public interface ILiekService<T,B>
    {
        /// <summary>
        /// Search medimaments by name.
        /// </summary>
        /// <param name="name">Key word in name of medicament.</param>
        Task<IEnumerable<T>> SearchLiekByNameAsync(string name);

        /// <summary>
        /// Get packages for medicament.
        /// </summary>
        /// <param name="idLiek">The medicament id.</param>
        Task<IEnumerable<B>> GetBaleniaForLiekAsync(decimal idLiek);

        /// <summary>
        /// Number of dosages per day of medicament.
        /// </summary>
        /// <param name="idLiek">The medicament id.<</param>
        Task<LiekDavkovanieDto> GetDavkovanieForMedicament(decimal idLiek);
    }
}
