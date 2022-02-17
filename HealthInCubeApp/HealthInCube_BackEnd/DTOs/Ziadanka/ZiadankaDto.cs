using System;

namespace HealthInCube_BackEnd.DTOs.Ziadanka
{
    /// <summary>
    /// Domain base model of requests from db.
    /// </summary>
    public abstract class ZiadankaBaseDto
    {
        public decimal IdUser { get; set; }

        public DateTime? AcceptedAt { get; set; }

        public DateTime CreatedAt { get; set; }

        public PouzivatelDto Pouzivatel { get; set; }
    }
}
