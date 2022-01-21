using System;

namespace HealthInCube_BackEnd.DTOs.Lekar.Sprievodka
{
    public class SprievodkaCreate : SprievodkaDto
    {
        public DateTime TerminDatum { get; set; }
        public byte DlzkaVysetrenia { get; set; }
    }
}
