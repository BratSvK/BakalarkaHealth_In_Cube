using System;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Patient DTO.
    /// </summary>
    public class PacientCardDto
    {
        /// <summary>
        /// Id of patient.
        /// </summary>
        public decimal IdPacient { get; set; }

        /// <summary>
        /// Date of birth.
        /// </summary>
        public DateTime? DatNarodenia { get; set; }

        /// <summary>
        /// Photo for card list.
        /// </summary>
        public byte[] Fotka { get; set; }

        /// <summary>
        /// Full name to display on card.
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// City of birth.
        /// </summary>
        public string MestoNarodenia { get; set; }
    }
}
