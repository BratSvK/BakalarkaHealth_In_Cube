using HealthInCube_BackEnd.Entities;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Health record DTO.
    /// </summary>
    public class ZdratovnaKartaDto
    {
        /// <summary>
        /// Patient of health records
        /// </summary>
        public decimal IdPacient { get; set; }
        /// <summary>
        /// Blood group.
        /// </summary>
        public string KrvSkupina { get; set; }
        /// <summary>
        /// Place of birth.
        /// </summary>
        public MestoDto MiestoNarodenia { get; set; }

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
