using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.DTOs
{
    public class CreatePatientAccountDto
    {
        public decimal IdUser { get; set; }

        public decimal IdMiestoNarodenia { get; set; }
    }
}
