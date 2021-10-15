using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Entities
{
    public class Ziadanka
    {
        public decimal IdPacient { get; set; }
        public decimal IdLekar { get; set; }

        public DateTime? AcceptedAt { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public virtual Lekar IdLekarNavigation {get; set;}

        public virtual Pacient IdPacientNavigation {get; set;}
        

    }
}