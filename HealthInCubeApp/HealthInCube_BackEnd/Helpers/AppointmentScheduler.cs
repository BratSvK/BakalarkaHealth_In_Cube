using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka.Termin;
using HealthInCube_BackEnd.Entities;
using System;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Helpers
{
    public static class AppointmentScheduler
    {
        public static IList<TerminSprievodka> GetAppointmentScheduler(PracovnaDoba pracovnaDoba, int averageTimeAtPacient)
        {
            IList<TerminSprievodka> terminy = new List<TerminSprievodka>();
            var lastResultedTimeinMinutes = pracovnaDoba.PracDobaOd.TotalMinutes;

            while (lastResultedTimeinMinutes < pracovnaDoba.PracDobaDo.TotalMinutes)
            {
                var resultOfnextTermin = lastResultedTimeinMinutes + averageTimeAtPacient;
                if (resultOfnextTermin > pracovnaDoba.ObedOd.TotalMinutes && resultOfnextTermin <= pracovnaDoba.ObedDo.TotalMinutes)
                {
                    lastResultedTimeinMinutes = resultOfnextTermin;
                    continue;
                } 
                else
                {
                    terminy.Add(
                    new TerminSprievodka
                    {
                        TerminOdInHour = TimeSpan.FromMinutes(lastResultedTimeinMinutes),
                        TerminDoInHour = TimeSpan.FromMinutes(resultOfnextTermin)
                    });
                    lastResultedTimeinMinutes = resultOfnextTermin;
                }
            }
            return terminy;
        }
    }
}
