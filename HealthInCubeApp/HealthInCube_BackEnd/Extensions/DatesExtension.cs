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
    }
}