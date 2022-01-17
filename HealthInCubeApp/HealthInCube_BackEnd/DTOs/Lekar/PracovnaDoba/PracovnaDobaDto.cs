using System;

namespace HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba
{
    public class PracovnaDobaDto
    {
        public DayOfWeek IdDen { get; set; }
        public string PracDobaOd { get; set; }
        public string PracDobaDo { get; set; }
        public string ObedOd { get; set; }
        public string ObedDo { get; set; }
    }
}
