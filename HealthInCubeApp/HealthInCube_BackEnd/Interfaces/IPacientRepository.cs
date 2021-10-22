using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Interfaces
{
    public interface IPacientRepository : IRepository<Pacient, PacientDto>
    {
        Task<bool> IsActivated(decimal userId);
    }
}
