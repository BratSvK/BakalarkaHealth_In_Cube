using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// Request.
    /// Compount PK with id user and id lekar.
    /// </summary>
    public class Ziadanka
    {
        /// <summary>
        /// This is origin of id user.
        /// </summary>
        [Column("IdPacient")]
        public decimal IdUser { get; set; }

        public decimal IdLekar { get; set; }

        public DateTime? AcceptedAt { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public virtual Lekar IdLekarNavigation {get; set;}

        public virtual Pouzivatel IdPouzivatelNavigation {get; set;}
        

    }
}