using HealthInCube_BackEnd.Entities;
using System;

namespace HealthInCube_BackEnd.DTOs.Lekar.Sprievodka
{
    /// <summary>
    /// Data transfer object.
    /// </summary>
    public class SprievodkaDto
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
        public DateTime TerminDo { get; set; }

    }
}
