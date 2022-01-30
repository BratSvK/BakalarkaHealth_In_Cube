using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka.Termin;
using HealthInCube_BackEnd.Helpers;
using System.Collections.Generic;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IAppointmentSchedulerService
    {
        IList<TerminSprievodkaDto> CreateAppointmentSchedulerByDay(SchedulerBuilderModel schedulerModel);

        int GetMaxNumberOfAppointmentsPerDay();
    }
}
