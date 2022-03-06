using System;

namespace HealthInCube_BackEnd.DTOs.Sprievodka
{
    /// <summary>
    /// Sprievodka model to lookup in db during delete action.
    /// Contains composite primary key.
    /// </summary>
    public class SprievodkaDeleteDto
    {
        /// <summary>
        /// Id of the patient.
        /// </summary>
        public decimal IdPacient { get; set; }

        /// <summary>
        /// Id of the doctor.
        /// </summary>
        public decimal IdLekar { get; set; }

        /// <summary>
        /// Start of the appointment.
        /// </summary>
        public DateTime TerminOd { get; set; }

        /// <summary>
        /// Deny message from patient to doctor.
        /// </summary
        public string ZrusenieDovod { get; set; }
    }
}
