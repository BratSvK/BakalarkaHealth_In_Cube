using System;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// Update address for user.
    /// </summary>
    public class UserUpdateBydliskoDto
    {
        public string Ulica { get; set; }

        public bool Trvale { get; set; }

        public decimal IdMesto { get; set; }

    }
}
