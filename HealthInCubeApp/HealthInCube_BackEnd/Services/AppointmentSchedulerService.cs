using HealthInCube_BackEnd.DTOs.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Services.Models;
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

        /// <inheritdoc/>
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

        /// <inheritdoc/>
        public IList<Sprievodka> RecaulculateOldListOfSprievodkaByDay(AppointmentRecalculateModel recalculateModel)
        {

            IList<Sprievodka> terminSprievodkasNew = recalculateModel.SprievodkyZoznam;
            Sprievodka sprievodkaToDelete = terminSprievodkasNew[recalculateModel.IndexOfRemovedSprievodka];
            terminSprievodkasNew.Remove(sprievodkaToDelete);

            for (int i = recalculateModel.IndexOfRemovedSprievodka; i < terminSprievodkasNew.Count; i++)
            {
                Sprievodka sprievodkaToRecalculate = terminSprievodkasNew[i];
                sprievodkaToRecalculate.TerminOd = sprievodkaToDelete.TerminOd;
                sprievodkaToRecalculate.TerminDo = sprievodkaToDelete.TerminDo;

                sprievodkaToDelete = sprievodkaToRecalculate;
            }

            return terminSprievodkasNew;
        }

        /// <inheritdoc/>
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
