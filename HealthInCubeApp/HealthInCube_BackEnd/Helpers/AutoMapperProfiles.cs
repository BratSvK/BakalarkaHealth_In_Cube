using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using System;

namespace HealthInCube_BackEnd.Helpers
{
    /// <summary>
    /// Auto mapper profiles.
    /// </summary>
    public class AutoMapperProfiles : Profile
    {
        /// <summary>
        /// Ctor.
        /// </summary>
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

            CreateMap<UserUpdateBydliskoDto, Bydlisko>().ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale ? "Y" : "N"));
            
            CreateMap<Oddelenie,OddelenieDto>();

            CreateMap<FotkaPouzivatel,FotkaDto>();
            CreateMap<FotkaDto, FotkaPouzivatel>();

            // Datetime with utc helper -> if it's utc or local time.  
            // Create z on the end.
            CreateMap<DateTime, DateTime>().ConstructUsing(d => DateTime.SpecifyKind(d, DateTimeKind.Utc));

            CreateMap<Pacient, PacientDto>();

            CreateMap<PacientDto, Pacient>();

            CreateMap<ZdravotnaKartum, ZdratovnaKartaDto>();

            CreateMap<ZdravPoistenie, ZdravotnePoistenieDto>();

            CreateMap<Ziadanka, ZiadankaDto>();

            CreateMap<Pouzivatel, PouzivatelDto>().ForMember(dest => dest.FullName, opt => opt.MapFrom(p => $"{p.Meno} {p.Priezvisko}"));
            CreateMap<Ziadanka, ZiadankaDto>()
                .ForMember(dest => dest.Pouzivatel, conf => conf.MapFrom(z => z.IdPouzivatelNavigation));

            CreateMap<Pouzivatel, PouzivatelDetailDto>();

        }
    }
}
