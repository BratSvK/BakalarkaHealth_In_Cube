using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Pouzivatel;
using HealthInCube_BackEnd.Entities;
using System.Collections.Generic;


namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Health record DTO.
    /// </summary>
    public class ZdravotnaKartaDto
    {
        /// <summary>
        /// Patient of health records
        /// </summary>
        public decimal IdPacient { get; set; }

        #nullable enable
        /// <summary>
        /// Blood group.
        /// </summary>
        public string? KrvSkupina { get; set; }
#nullable disable

        /// <inheritdoc/>
        public PouzivatelZdravotnaKartaDto Pouzivatel { get; set; }

        /// <summary>
        /// Place of birth.
        /// </summary>
        public MestoDto MiestoNarodenia { get; set; }

        /// <summary>
        /// General practitioner by patient.
        /// </summary>
        public GeneralPractitionerDto VseobecnyLekar { get; set; }

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
