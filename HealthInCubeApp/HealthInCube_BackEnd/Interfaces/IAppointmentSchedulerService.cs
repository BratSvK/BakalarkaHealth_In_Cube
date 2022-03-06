using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Services.Models;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IAppointmentSchedulerService
    {
        /// <summary>
        /// Create appointment scheduler for day.
        /// </summary>
        /// <param name="schedulerModel">model composted of lekar and working info.</param>
        /// <returns>Calendar of appointments.</returns>
        IList<TerminSprievodkaDto> CreateAppointmentSchedulerByDay(SchedulerBuilderModel schedulerModel);

        /// <summary>
        /// Recalculation after removed old sprievodka.
        /// </summary>
        /// <param name="recalculateModel">Old list of sprievodky and index of removed sprievodka.</param>
        /// <returns></returns>
        IList<Sprievodka> RecaulculateOldListOfSprievodkaByDay(AppointmentRecalculateModel recalculateModel);

        /// <summary>
        /// Get maximum number per termins.
        /// </summary>
        /// <returns>total size</returns>
        int GetMaxNumberOfAppointmentsPerDay();
    }
}
