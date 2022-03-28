using System;

namespace HealthInCube_BackEnd.DTOs.Lekar
{
    /// <summary>
    /// Model represented of type atestation of doctor.
    /// </summary>
    public class AtestaciaLekarDto
    {
        /// <summary>
        /// Id of the doctor.
        /// </summary>
        public decimal IdLekar { get; set; }

        /// <summary>
        /// Id of the type doctor.
        /// </summary>
        public decimal IdTyp { get; set; }

        /// <summary>
        /// Start date to be atestated in role.
        /// </summary>
        public DateTime AtestaciaOd { get; set; } = DateTime.Now;

        /// <summary>
        /// Name of the atestation.
        /// </summary>
        public string Nazov { get; set; }
    }
}
