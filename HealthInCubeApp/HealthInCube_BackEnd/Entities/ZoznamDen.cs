using System.Collections.Generic;

namespace HealthInCube_BackEnd.Entities
{
    public class ZoznamDen
    {
        public int IdDen { get; set; }
        public string Nazov { get; set; }

        /// <summary>
        /// Relation on the pracovna doba.
        /// </summary>
        public virtual ICollection<PracovnaDoba> PracovnaDobas { get; set; }
    }
}
