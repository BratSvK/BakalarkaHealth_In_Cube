using System;

namespace HealthInCube_BackEnd.DTOs
{
    /// <summary>
    /// User data transfer object.
    /// </summary>
    public class PouzivatelDto
    {
        public decimal Id { get; set; }

        public string Email { get; set; }

        public string Token { get; set; }

        public byte[] Fotka { get; set; }

        public string FullName { get; set; }

        public DateTime ExpirationDateToken {get; set;} = DateTime.Now.AddHours(1);
    }
}