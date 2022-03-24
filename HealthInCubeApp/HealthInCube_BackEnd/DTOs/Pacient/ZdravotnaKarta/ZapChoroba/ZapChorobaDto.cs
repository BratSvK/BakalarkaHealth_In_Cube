using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Priznak;
using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba
{
    /// <summary>
    /// Model to represent illness in health record.
    /// </summary>
    public class ZapChorobaDto
    {
        /// <summary>
        /// The id of the health record.
        /// </summary>
        public decimal IdZdravotnaKarta { get; set; }

        /// <summary>
        /// No. of illness from illnesses records.
        /// </summary>
        public string CisChoroba { get; set; }

        /// <summary>
        /// Appointment result reference id.
        /// </summary>
        public decimal IdVysetrenie { get; set; }

        /// <summary>
        /// The date of discovery of the illness.
        /// </summary>
        public DateTime Od { get; set; } = DateTime.UtcNow;

        /// <summary>
        /// The date of successfully recovering from illness.
        /// </summary>
        public DateTime? Do { get; set; }

        /// <summary>
        /// Symptoms.
        /// </summary>
        public ICollection<PriznakDto> Priznakies { get; set; }
    }
}
