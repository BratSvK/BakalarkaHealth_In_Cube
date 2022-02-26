using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.DTOs.Lekar
{
    public class LekarRegisterDto : RegisterPouzivatelDto
    {
        public decimal IdNemocnica { get; set; }
        public decimal IdOddelenie { get; set; }
        public byte DlzkaVysetrenia { get; set; }
        public ICollection<PracovnaDobaDto> PracovnaDobas { get; set; }
        public ICollection<AtestaciaLekarDto> AtestacieLekars { get; set; }
    }
}
