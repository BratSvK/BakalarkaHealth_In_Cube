using System;

namespace HealthInCube_BackEnd.Entities
{
    /// <summary>
    /// Request for creation of the doctor account model.
    /// </summary>
    public class ZiadankaLekar
    {
        /// <summary>
        /// User id.
        /// </summary>
        public decimal IdUser { get; set; }

        /// <summary>
        /// Hospital id.
        /// </summary>
        public decimal IdNemocnica { get; set; }

        /// <summary>
        /// Date of the acceptation.
        /// </summary>
        public DateTime? AcceptedAt { get; set; }

        /// <summary>
        /// Date of the creation.
        /// </summary>
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public virtual Pouzivatel PouzivatelNavigation { get; set; }
    }
}
