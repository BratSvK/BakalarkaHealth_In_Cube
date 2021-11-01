using System;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Domain model from db.
    /// </summary>
    public class ZiadankaDto
    {
        public decimal IdUser { get; set; }

        public decimal IdLekar { get; set; }

        public DateTime? AcceptedAt { get; set; }

        public DateTime CreatedAt { get; set; }

        public PouzivatelDto Pouzivatel { get; set; }
    }
}
