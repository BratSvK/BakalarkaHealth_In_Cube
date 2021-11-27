using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Patient DTO.
    /// </summary>
    public class PacientDto
    {
        /// <summary>
        /// Id of patient.
        /// </summary>
        public decimal IdPacient { get; set; }

        /// <summary>
        /// id of user.
        /// </summary>
        public decimal IdPouzivatel { get; set; }

        /// <summary>
        /// General doctor for patient.
        /// </summary>
        public decimal IdVseobecnyLekar { get; set; }

        /// <summary>
        /// Date from when is patient.
        /// </summary>
        public DateTime Od { get; set; }

        /// <summary>
        /// Date when discard patient account.
        /// </summary>
        public DateTime? Do { get; set; }

        /// <summary>
        /// Health record of patient.
        /// </summary>
        public ZdratovnaKartaDto ZdravotnaKartum { get; set; }

        /// <summary>
        /// All insurance of patient
        /// </summary>
        public ICollection<ZdravotnePoistenieDto> ZdravPoistenies { get; set; }

        /// <summary>
        /// Data about user.
        /// </summary>
        public PouzivatelDto IdPouzivatelNavigation { get; set; }
    }
}
