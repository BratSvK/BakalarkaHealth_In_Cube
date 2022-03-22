using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Recept;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.Vysetrenie
{
    /// <summary>
    /// Result of the examination.
    /// </summary>
    public class VysetrenieVysledokDto : VysetrenieDto
    {
        /// <summary>
        /// Diagnotic illness from result.
        /// </summary>
        public ZapChorobaDto ZapChoroba { get; set; }

        /// <inheritdoc/>
        public PredpisanaLiecbaDto PredpisanaLiecba { get; set; }

        /// <inheritdoc/>
        public ReceptDto Recept { get; set; }
    }
}
