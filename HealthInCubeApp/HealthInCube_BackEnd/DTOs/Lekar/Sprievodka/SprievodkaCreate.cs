using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs.Lekar.Sprievodka
{
    public class SprievodkaCreate : SprievodkaDto
    {
        public DateTime TerminDatum { get; set; }
        public byte DlzkaVysetrenia { get; set; }
    }
}
