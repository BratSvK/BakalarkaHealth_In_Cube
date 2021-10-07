using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCubeModel;

namespace HealthInCube_BackEnd.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<NEMOCNICA,NemocnicaDto>();
            
        }
        
    }
}