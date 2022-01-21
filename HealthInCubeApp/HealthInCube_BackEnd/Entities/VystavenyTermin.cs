using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// Suportive entity to get know how many appointments have.
    /// </summary>
    public class VystavenyTermin
    {
        public int Id { get; set; }
        public decimal IdPacient { get; set; }
        public decimal IdLekar { get; set; }
        /// <summary>
        /// How many appointments have in day for doctor.
        /// DateTime.DayOfYear
        /// </summary>
        public int DayOfYear { get; set; }
    }
}
