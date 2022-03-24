using System;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Insurance  DTO.
    /// </summary>
    public class ZdravotnePoistenieDto
    {
        /// <summary>
        /// Insurance id.
        /// </summary>
        public decimal IdPoistovna { get; set; }

        /// <summary>
        /// Id of patient.
        /// </summary>
        public decimal IdPacient { get; set; }

        /// <summary>
        /// Date from when i've started to cover
        /// </summary>
        public DateTime Od { get; set; }

        /// <summary>
        /// Date when i changed insurance.
        /// </summary>
        public DateTime? Do { get; set; }
    }
}
