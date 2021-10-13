using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;

namespace HealthInCube_BackEnd.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<Nemocnica,NemocnicaDto>();
            CreateMap<Pouzivatel,RegisterPouzivatelDto>();

            CreateMap<Pouzivatel,PouzivatelLekarDto>();

            CreateMap<RegisterPouzivatelDto,Pouzivatel>();

            CreateMap<Lekar,LekarDto>();



            CreateMap<Okres,OkresDto>();

            CreateMap<Mesto,MestoDto>();





            
        }
        
    }
}