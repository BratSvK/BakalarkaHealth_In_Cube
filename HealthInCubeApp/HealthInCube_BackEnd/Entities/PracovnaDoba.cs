using System;

namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// Working day in general for doctor.
    /// Similar to opening hours.
    /// </summary>
    public class PracovnaDoba
    {
        public decimal IdLekar { get; set; }
        public int IdDen { get; set; }

        /// <summary>
        /// Working time start.
        /// etc. 07:30:00.
        /// </summary>
        public TimeSpan PracDobaOd { get; set; }

        /// <summary>
        /// Working time end.
        /// etc. 16:00:00.
        /// </summary>
        public TimeSpan PracDobaDo { get; set; }
        public TimeSpan ObedOd { get; set; }

        /// <summary>
        /// This property will be set automaticly + 30 min.
        /// ObedOd.Add(TimeSpan.FromMinutes(Constants.Constants.ObednaPrestavka));
        /// </summary>
        public TimeSpan ObedDo { get; set; }

        public virtual Lekar IdLekarNavigation { get; set; }
        public virtual ZoznamDen IdZoznamNavigation { get; set; }
    }
}
