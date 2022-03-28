using System;

namespace HealthInCube_BackEnd.DTOs.Pacient.ZdravotnaKarta.ZapChoroba.Priznak
{
    /// <summary>
    /// The model represented symptom of the illness.
    /// </summary>
    public class PriznakDto
    {
        /// <summary>
        /// The number of the illness.
        /// </summary>
        public string CisChoroba { get; set; }

        /// <summary>
        /// The id of health record.
        /// </summary>
        public decimal IdZdravotnaKarta { get; set; }

        /// <summary>
        /// The id of symptom from symptoms records.
        /// </summary>
        public decimal? IdSymptom { get; set; }

        /// <summary>
        /// Name of the symptom.
        /// </summary>
        public string Nazov { get; set; }

        /// <summary>
        /// Start by symptom.
        /// </summary>
        public DateTime Od { get; set; } = DateTime.UtcNow;
    }
}
