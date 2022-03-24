using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.Vysetrenie;
using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba;
using System.Collections.Generic;


namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Health record DTO.
    /// </summary>
    public class ZdravotnaKartaDto
    {
    
        /// <inheritdoc/>
        public PacientZdravotnaKartaDetailDto PacientDetail { get; set; }

        /// <summary>
        /// All treatments.
        /// </summary>
        public ICollection<VysetrenieDto> VykVysetrenia { get; set; }

        /// <summary>
        /// All illnesses.
        /// </summary>
        public ICollection<ZapChorobaDto> ZapChorobies { get; set; }
    }
}
