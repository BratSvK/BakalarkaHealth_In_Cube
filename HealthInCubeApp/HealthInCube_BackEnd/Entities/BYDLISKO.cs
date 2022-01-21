using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace HealthInCube_BackEnd.Entities
{
    public partial class Bydlisko
    {
        public decimal? IdBydliska { get; set; }
        public decimal? IdPouzivatel { get; set; }
        public string Ulica { get; set; }
        public DateTime AdresaOd { get; set; } = DateTime.Now;
        public DateTime? AdresaDo { get; set; }
        public string Trvale { get; set; }
        public decimal IdMesto { get; set; }

        public virtual Mesto IdMestoNavigation { get; set; }
        public virtual Pouzivatel IdPouzivatelNavigation { get; set; }
    }
}
