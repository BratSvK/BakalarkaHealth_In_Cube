using System;

namespace HealthInCube_BackEnd.DTOs.Sprievodka.Termin
{
    public class TerminSprievodkaDto
    {
        /// <summary>
        /// Start of appointment Etc. 8:00:00.
        /// </summary>
        public TimeSpan TerminOdInHour { get; set; }

        /// <summary>
        /// End of appointment Etc. 8:30:00.
        /// </summary>
        public TimeSpan TerminDoInHour { get; set; }
    }
}
