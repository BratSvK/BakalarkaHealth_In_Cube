using HealthInCube_BackEnd.Entities;
using System;

namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Helper builder for scheduler.
    /// </summary>
    public class SchedulerBuilderModel
    {
        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="idLekar"></param>
        /// <param name="dayOfYearAppointment"></param>
        /// <param name="averrageTimePerPatient"></param>
        /// <param name="pracovnaDobaLekar"></param>
        public SchedulerBuilderModel(decimal idLekar, DateTime dayOfYearAppointment, int averrageTimePerPatient, PracovnaDoba pracovnaDobaLekar)
        {
            IdLekar = idLekar;
            DayOfYearAppointment = dayOfYearAppointment.DayOfYear;
            AverrageTimePerPatient = averrageTimePerPatient;
            PracovnaDobaLekar = pracovnaDobaLekar;
        }

        public decimal IdLekar { get; set; }
        
        public int DayOfYearAppointment { get; set; }

        public int AverrageTimePerPatient { get; set; }

        public PracovnaDoba PracovnaDobaLekar { get; set; }
    }
}
