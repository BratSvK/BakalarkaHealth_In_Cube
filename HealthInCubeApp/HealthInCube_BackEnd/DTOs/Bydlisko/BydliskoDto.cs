using System;

namespace HealthInCube_BackEnd.DTOs
{
    public class BydliskoDto
    {
        public decimal IdBydliska { get; set; }
        public decimal? IdPouzivatel { get; set; }
        public string Ulica { get; set; }
        public DateTime AdresaOd { get; set; } = DateTime.Now;
        public DateTime? AdresaDo { get; set; }
        public bool Trvale { get; set; }
        public decimal IdMesto { get; set; }
        public MestoDto IdMestoNavigation { get; set; }
    }
}