using System;

namespace HealthInCube_BackEnd.DTOs.Lekar
{
    public class AtestaciaLekarDto
    {
        public decimal IdLekar { get; set; }
        public decimal IdTyp { get; set; }
        public DateTime AtestaciaOd { get; set; } = DateTime.Now;
    }
}
