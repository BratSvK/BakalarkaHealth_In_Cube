using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.Entities;
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
        public ICollection<VykVysetrenium> VykVysetrenia { get; set; }

        /// <summary>
        /// All illnesses.
        /// </summary>
        public ICollection<ZapChoroby> ZapChorobies { get; set; }
    }
}
