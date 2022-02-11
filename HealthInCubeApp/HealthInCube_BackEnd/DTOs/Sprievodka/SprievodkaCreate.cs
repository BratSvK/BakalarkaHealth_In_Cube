using System;

namespace HealthInCube_BackEnd.DTOs.Sprievodka
{
    /// <summary>
    /// Model for sprievodka creation.
    /// </summary>
    public class SprievodkaCreate : SprievodkaDto
    {
        public decimal IdPacient { get; set; }
        
        public decimal IdLekar { get; set; }
        
        public decimal idTypVysetrenia { get; set; }
        
        public DateTime TerminDatum { get; set; }
    }
}
