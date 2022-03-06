using HealthInCube_BackEnd.Entities;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Services.Models
{
    /// <summary>
    /// Model for recalculation of appointments.
    /// </summary>
    public class AppointmentRecalculateModel
    {
        /// <summary>
        /// Sprievodky list of selected day.
        /// </summary>
        public IList<Sprievodka> SprievodkyZoznam { get; set; }

        /// <summary>
        /// Which sprievodka we removed from the list.
        /// </summary>
        public int IndexOfRemovedSprievodka { get; set; }
    }
}
