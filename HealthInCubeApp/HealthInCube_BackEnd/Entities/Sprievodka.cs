using System;

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
        public decimal IdTypVysetrenia { get; set; }

        public DateTime TerminOd { get; set; }

        /// <summary>
        /// Added by specific time of doctor duration of one patient.
        /// </summary>
        public DateTime TerminDo { get; set; }

        /// <summary>
        /// Deny message from patient to doctor.
        /// </summary>
        public string ZrusenieDovod { get; set; }

        /// <summary>
        /// Is deactivated flag.
        /// </summary>
        public bool IsDeactivated { get; set; } = false;

        public virtual  Lekar IdLekarNavigation { get; set; }

        public virtual TypLekara IdTypLekarNavigation { get; set; }

        public virtual Pacient IdPacientNavigation { get; set; }
    }
}
