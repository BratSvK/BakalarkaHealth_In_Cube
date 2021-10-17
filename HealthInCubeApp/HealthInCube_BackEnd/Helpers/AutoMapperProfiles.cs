using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using System;

namespace HealthInCube_BackEnd.Helpers
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<Nemocnica,NemocnicaDto>();
            CreateMap<Pouzivatel,RegisterPouzivatelDto>();

            CreateMap<RegisterPouzivatelDto, Pouzivatel>().ForMember(dest => dest.RodPriezvisko, opt => opt.MapFrom(src => string.IsNullOrWhiteSpace(src.RodPriezvisko) ? src.Priezvisko : src.RodPriezvisko));
            CreateMap<Lekar,LekarDto>();

            CreateMap<Okres,OkresDto>();

            CreateMap<Mesto,MestoDto>();

            CreateMap<BydliskoDto,Bydlisko>().ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale ? "Y" : "N"));
            CreateMap<Bydlisko,BydliskoDto>().ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale == "Y" ? true : false));;




            CreateMap<Oddelenie,OddelenieDto>();

            CreateMap<FotkaPouzivatel,FotkaDto>();







            
        }
        
    }
}