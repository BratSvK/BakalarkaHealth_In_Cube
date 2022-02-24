using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs.Nemocnica
{
    public class NemocnicaDto
    {
        public decimal IdNem { get; set; }
        public string Nazov{ get; set; }
        public string Mobil { get; set; }
        public string Ulica { get; set; }
        public string UrlStranka { get; set; }
        public decimal IdMesto { get; set; }
        public ICollection<OddelenieDto> Oddelenies { get; set; }
    }
}