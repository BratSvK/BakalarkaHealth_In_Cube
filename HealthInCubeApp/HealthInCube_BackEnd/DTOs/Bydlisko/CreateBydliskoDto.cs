using HealthInCube_BackEnd.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs.Bydlisko
{
    public class CreateBydliskoDto
    {
        public string Ulica { get; set; }
        public string TrvalaAddresa { get; set; } = "Y";
        public DateTime AddresaOd { get; set; } = DateTime.Now;
        public Mesto IdMestoNavigation { get; set; }
    }
}
