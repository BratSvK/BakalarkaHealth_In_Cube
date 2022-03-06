using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using System;

namespace HealthInCube_BackEnd.DTOs.Sprievodka
{
    /// <summary>
    /// Data transfer object.
    /// </summary>
    public class SprievodkaDto
    {

        /// <summary>
        /// What type of revision.
        /// 44 => Oftamológ - očný lekár(info)
        /// </summary>
        public LekarTypeDto IdTypLekarNavigation { get; set; }

        public DateTime TerminOd { get; set; }
        
        public DateTime TerminDo { get; set; }
        public bool IsDeactivated { get; set; }
    }
}
