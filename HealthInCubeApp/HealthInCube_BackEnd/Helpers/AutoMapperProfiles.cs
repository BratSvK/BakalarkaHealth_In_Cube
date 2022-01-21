using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.DTOs.Lekar.Sprievodka;
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
            CreateMap<Nemocnica, NemocnicaDto>();
            CreateMap<Pouzivatel, RegisterPouzivatelDto>();
            CreateMap<RegisterPouzivatelDto, Pouzivatel>().ForMember(dest => dest.RodPriezvisko, opt => opt.MapFrom(src => string.IsNullOrWhiteSpace(src.RodPriezvisko) ? src.Priezvisko : src.RodPriezvisko));
            CreateMap<Lekar, LekarDto>();
            CreateMap<Okres, OkresDto>();
            CreateMap<Mesto, MestoDto>();
            CreateMap<BydliskoDto, Bydlisko>()
                .ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale ? "Y" : "N"));
            CreateMap<Bydlisko, BydliskoDto>().ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale == "Y" ? true : false));
            CreateMap<UserUpdateBydliskoDto, Bydlisko>().ForMember(dest => dest.Trvale, opt => opt.MapFrom(src => src.Trvale ? "Y" : "N"));
            CreateMap<Oddelenie, OddelenieDto>();
            CreateMap<FotkaPouzivatel, FotkaDto>();
            CreateMap<FotkaDto, FotkaPouzivatel>();
            //CreateMap<DateTime, DateTime>().ConstructUsing(d => DateTime.SpecifyKind(d, DateTimeKind.Utc));
            CreateMap<Pacient, PacientDto>();
            CreateMap<PacientDto, Pacient>();
            CreateMap<Pacient, PacientCardDto>()
                .ForMember(dest => dest.Fotka, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.FotkaPouzivatel.Fotka))
                .ForMember(dest => dest.BID, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.RodCislo))
                .ForMember(dest => dest.DatNarodenia, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.DatNarodenia.Value.Date))
                .ForMember(dest => dest.MestoNarodenia, opt => opt.MapFrom(src => src.ZdravotnaKartum.IdMestoNarodeniaNavigation.Nazov))
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(p => $"{p.IdPouzivatelNavigation.Meno} {p.IdPouzivatelNavigation.Priezvisko}"));
            CreateMap<ZdravotnaKartum, ZdratovnaKartaDto>();
            CreateMap<ZdravPoistenie, ZdravotnePoistenieDto>();
            CreateMap<Ziadanka, ZiadankaDto>();
            CreateMap<Pouzivatel, PouzivatelDto>().ForMember(dest => dest.FullName, opt => opt.MapFrom(p => $"{p.Meno} {p.Priezvisko}"));
            CreateMap<Ziadanka, ZiadankaDto>()
                .ForMember(dest => dest.Pouzivatel, conf => conf.MapFrom(z => z.IdPouzivatelNavigation));
            CreateMap<Pouzivatel, PouzivatelDetailDto>();
            CreateMap<Sprievodka, SprievodkaDto>();
            CreateMap<SprievodkaDto, Sprievodka>();

            CreateMap<PracovnaDobaDto, PracovnaDoba>()
                .ForMember(dest => dest.PracDobaOd, opt => opt.MapFrom(src => TimeSpan.Parse(src.PracDobaOd)))
                .ForMember(dest => dest.PracDobaDo, opt => opt.MapFrom(src => TimeSpan.Parse(src.PracDobaDo)))
                .ForMember(dest => dest.ObedOd, opt => opt.MapFrom(src => TimeSpan.Parse(src.ObedOd)))
                .ForMember(dest => dest.ObedDo, opt => opt.MapFrom(src => TimeSpan.Parse(src.ObedDo)));

            CreateMap<PracovnaDoba, PracovnaDobaDto>();


        }
    }
}
