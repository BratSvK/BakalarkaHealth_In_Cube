using System.Collections.Generic;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.DTOs
{
    public class LekarDto
    {

        public decimal IdLekar { get; set; }
        public ICollection<AtestacieLekar> AtestacieLekars { get; set; }
        public PouzivatelLekarDto IdPouzivatelNavigation {get; set;}

        
        
    }
}