using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// General invitation to doctor.
    /// </summary>
    public class Sprievodka
    {
        /// <summary>
        /// For who is invitation
        /// </summary>
        public decimal IdPacient { get; set; }

        /// <summary>
        /// Where is patient going.
        /// </summary>
        public decimal IdLekar { get; set; }
        /// <summary>
        /// What type of revision.
        /// 44 => Oftamológ - očný lekár(info)
        /// </summary>
        public TypyLekara IdTypVysetrenia { get; set; }

        public DateTime TerminOd { get; set; }

        /// <summary>
        /// Added by specific time of doctor duration of one patient.
        /// </summary>
        public DateTime TerminDo { get; set; }

        public virtual  Lekar IdLekarNavigation { get; set; }
        public virtual Pacient IdPacientNavigation { get; set; }
    }
}
