using HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba.Liek;
using System;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.PredpisanaLiecba
{
    /// <summary>
    /// Result of the medical threatment.
    /// </summary>
    public class PredpisanaLiecbaDto
    {
        /// <summary>
        /// Id of the examination.
        /// </summary>
        public decimal IdVysetrenie { get; set; }

        /// <summary>
        /// Start of the threatment.
        /// </summary>
        public DateTime Od { get; set; } = DateTime.UtcNow;

        /// <summary>
        /// Number of dosages per day.
        /// </summary>
        public byte DavkovaniePocet { get; set; }

        /// <summary>
        /// End of the threatment.
        /// </summary>
        public DateTime? Do { get; set; }

        /// <inheritdoc/>
        public LiekDto IdLiekNavigation { get; set; }
    }
}
