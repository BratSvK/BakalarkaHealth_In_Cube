using HealthInCube_BackEnd.Entities;
using System;
using System.Globalization;

namespace HealthInCube_BackEnd.Extensions
{
    public static class DatesExtension
    {
        public static int GetWeekNumber(this DateTime date)
        {
            CultureInfo ci = CultureInfo.CurrentCulture;
            int weekNum = ci.Calendar.GetWeekOfYear(date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            return weekNum;
        }

        /// <summary>
        /// Only 48 hours before is allowed to deny.
        /// </summary>
        /// <param name="dateToCompare">Date of appointment.</param>
        /// <returns></returns>
        public static bool IsAllowedToDenyAppointment(this DateTime dateToCompare)
        => DateTime.Now <= dateToCompare.AddHours(-48);

        /// <summary>
        /// To get available due date to appointment.
        /// Cannot be today or later.
        /// </summary>
        /// <param name="dateToCompare">Date of appointment.</param>
        /// <returns>true if its today or later.</returns>
        public static bool IsTodayOrLater(this DateTime dateToCompare)
        => DateTime.Now.Date >= dateToCompare.Date;
    }
}