using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Priznak;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces.CiselnikHelper
{
    /// <summary>
    /// Helper interface for choroba table.
    /// </summary>
    public interface ITypSymptomService
    {
        Task<IEnumerable<TypPriznakDto>> GetAllSymptomsAsync();
    }
}
