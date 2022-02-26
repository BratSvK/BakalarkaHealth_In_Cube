using System;

namespace HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba
{
    public class PracovnaDobaDto
    {
        public DayOfWeek IdDen { get; set; }
        public DateTimeOffset PracDobaOd { get; set; }
        public DateTimeOffset PracDobaDo { get; set; }
        public DateTimeOffset ObedOd { get; set; }
        public DateTimeOffset ObedDo => ObedOd.AddMinutes(30);
    }
}
