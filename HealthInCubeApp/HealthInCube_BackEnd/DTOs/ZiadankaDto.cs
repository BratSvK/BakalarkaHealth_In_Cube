using System;

namespace HealthInCube_BackEnd.DTOs
{
    public class ZiadankaDto
    {
        public decimal IdPacient { get; set; }
        public decimal IdLekar { get; set; }

        public DateTime? AcceptedAt { get; set; }

        public DateTime CreatedAt { get; set; }

    }
}