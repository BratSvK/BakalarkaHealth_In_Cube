using System;

namespace HealthInCube_BackEnd.Helpers.Params
{
    /// <summary>
    /// Params from lekar.
    /// </summary>
    public class SprievodkaParams
    {
        public int IdLekar { get; set; }
        public int IdPacient { get; set; }
        /// <summary>
        /// Patient age from.
        /// Default value is 21.
        /// </summary>
        public DateTime StartWeekBy { get; set; }
    }
}
