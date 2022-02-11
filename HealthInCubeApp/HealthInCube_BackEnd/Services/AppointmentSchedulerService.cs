using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Services
{
    /// <summary>
    /// Cache for appointment scheduler.
    /// </summary>
    public class AppointmentSchedulerService : IAppointmentSchedulerService
    {
        private IList<TerminSprievodkaDto> _terminy;
        private IDictionary<decimal, int> _lastMemberedDoctorCache;

        /// <summary>
        /// Ctor.
        /// </summary>
        public AppointmentSchedulerService()
        {
            _terminy = new List<TerminSprievodkaDto>();
            _lastMemberedDoctorCache = new Dictionary<decimal, int>();
        }

        /// <summary>
        /// Create appointment scheduler for day.
        /// </summary>
        /// <param name="schedulerModel">model composted of lekar and working info.</param>
        /// <returns>Calendar of appointments.</returns>
        public IList<TerminSprievodkaDto> CreateAppointmentSchedulerByDay(SchedulerBuilderModel schedulerModel)
        {
            int dayFromCache;
            // check if we have the same request to the same doctor
            if (_lastMemberedDoctorCache.TryGetValue(schedulerModel.IdLekar, out dayFromCache) && dayFromCache == schedulerModel.DayOfYearAppointment)
            {
                return _terminy;
            } 
            else
            {
                if (_lastMemberedDoctorCache.ContainsKey(schedulerModel.IdLekar))
                {
                    _lastMemberedDoctorCache[schedulerModel.IdLekar] = schedulerModel.DayOfYearAppointment;
                }
                else
                {
                    _lastMemberedDoctorCache.Add(schedulerModel.IdLekar, schedulerModel.DayOfYearAppointment);
                }
                return PrepareTerminyByDay(schedulerModel.PracovnaDobaLekar, schedulerModel.AverrageTimePerPatient);
            }
        }

        /// <summary>
        /// Get maximum number per termins.
        /// </summary>
        /// <returns>total size</returns>
        public int GetMaxNumberOfAppointmentsPerDay()
        {
            return _terminy.Count;
        }

        private IList<TerminSprievodkaDto> PrepareTerminyByDay(PracovnaDoba pracovnaDoba, int averageTimePerPatient)
        {
            IList<TerminSprievodkaDto> terminSprievodkas = new List<TerminSprievodkaDto>();
            var lastResultedTimeinMinutes = pracovnaDoba.PracDobaOd.TotalMinutes;

            while (lastResultedTimeinMinutes < pracovnaDoba.PracDobaDo.TotalMinutes)
            {
                var resultOfnextTermin = lastResultedTimeinMinutes + averageTimePerPatient;
                if (resultOfnextTermin > pracovnaDoba.ObedOd.TotalMinutes && resultOfnextTermin <= pracovnaDoba.ObedDo.TotalMinutes)
                {
                    lastResultedTimeinMinutes = resultOfnextTermin;
                    continue;
                }
                else
                {
                    terminSprievodkas.Add(
                    new TerminSprievodkaDto
                    {
                        TerminOdInHour = TimeSpan.FromMinutes(lastResultedTimeinMinutes),
                        TerminDoInHour = TimeSpan.FromMinutes(resultOfnextTermin)
                    });
                    lastResultedTimeinMinutes = resultOfnextTermin;
                }
            }
            _terminy = terminSprievodkas;
            return _terminy;
        }
    }
}
