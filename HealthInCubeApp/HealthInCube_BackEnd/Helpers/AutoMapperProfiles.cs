using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Lekar;
using HealthInCube_BackEnd.DTOs.Lekar.LekarTyp;
using HealthInCube_BackEnd.DTOs.Lekar.PracovnaDoba;
using HealthInCube_BackEnd.DTOs.Nemocnica;
using HealthInCube_BackEnd.DTOs.Pacient;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.DTOs.Ziadanka;
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
            CreateMap<Pacient, PacientDto>();
            CreateMap<PacientDto, Pacient>();
            CreateMap<Pacient, PacientCardDto>()
                .ForMember(dest => dest.Fotka, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.FotkaPouzivatel.Fotka))
                .ForMember(dest => dest.BID, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.RodCislo))
                .ForMember(dest => dest.DatNarodenia, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.DatNarodenia.Value.Date))
                .ForMember(dest => dest.MestoNarodenia, opt => opt.MapFrom(src => src.ZdravotnaKartum.IdMestoNarodeniaNavigation.Nazov))
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(p => $"{p.IdPouzivatelNavigation.Meno} {p.IdPouzivatelNavigation.Priezvisko}"));
            CreateMap<Lekar, GeneralPractitionerDto>()
                .ForMember(dest => dest.Fotka, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.FotkaPouzivatel.Fotka))
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.Email))
                .ForMember(dest => dest.Mobil, opt => opt.MapFrom(src => src.IdPouzivatelNavigation.Mobil))
                .ForMember(dest => dest.Meno, opt => opt.MapFrom(p => $"{p.IdPouzivatelNavigation.Meno} {p.IdPouzivatelNavigation.Priezvisko}")); ;
            CreateMap<ZdravotnaKartum, ZdravotnaKartaDto>()
                .ForMember(
                    dest => dest.MiestoNarodenia,
                    opt => opt.MapFrom(src => src.IdMestoNarodeniaNavigation))
                .ForMember(
                    dest => dest.VseobecnyLekar,
                    opt => opt.MapFrom(src => src.IdPacientNavigation.IdVseobecnyLekarNavigation));
            CreateMap<ZdravPoistenie, ZdravotnePoistenieDto>();
            CreateMap<Pouzivatel, PouzivatelDto>()
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(p => $"{p.Meno} {p.Priezvisko}"));
            CreateMap<Ziadanka, ZiadankaBaseDto>()
                .ForMember(dest => dest.Pouzivatel, conf => conf.MapFrom(z => z.IdPouzivatelNavigation));
            CreateMap<Pouzivatel, PouzivatelDetailDto>();
            CreateMap<Sprievodka, SprievodkaDto>();
            CreateMap<SprievodkaDto, Sprievodka>();
            CreateMap<PracovnaDobaDto, PracovnaDoba>()
                .ForMember(dest => dest.PracDobaOd, opt => opt.MapFrom(src => src.PracDobaOd.ToLocalTime().TimeOfDay))
                .ForMember(dest => dest.PracDobaDo, opt => opt.MapFrom(src => src.PracDobaDo.ToLocalTime().TimeOfDay))
                .ForMember(dest => dest.ObedOd, opt => opt.MapFrom(src => src.ObedOd.ToLocalTime().TimeOfDay))
                .ForMember(dest => dest.ObedDo, opt => opt.MapFrom(src => src.ObedDo.ToLocalTime().TimeOfDay));
            CreateMap<PracovnaDoba, PracovnaDobaDto>();
            CreateMap<TypLekara, LekarTypeDto>()
                .ForMember(dest => dest.IdTyp, opt => opt.MapFrom(src => (int)src.IdTyp));
            CreateMap<Lekar, LekarSprievodkaDto>()
                .ForMember(
                    dest => dest.FullName, 
                    opt => opt.MapFrom(src => $"{src.IdPouzivatelNavigation.Meno} {src.IdPouzivatelNavigation.Priezvisko}"))
            .ForMember(
                    dest => dest.Pracovisko,
                    opt => opt.MapFrom(src => src.IdOddelNavigation.IdNemNavigation.IdMestoNavigation.Nazov));
            CreateMap<Sprievodka, SprievodkaPacientDto>();
            CreateMap<Sprievodka, SprievodkaLekarDto>();
            CreateMap<ZiadankaLekar, ZiadankaLekarDto>()
                .ForMember(dest => dest.Pouzivatel, conf => conf.MapFrom(z => z.PouzivatelNavigation));
            CreateMap<Ziadanka, ZiadankaPacientDto>()
                .ForMember(dest => dest.Pouzivatel, conf => conf.MapFrom(z => z.IdPouzivatelNavigation));
            CreateMap<AtestaciaLekarDto, AtestacieLekar>();
            CreateMap<ZoznamDen, ZoznamDenDto>();

            //CreateMap<DateTime, DateTime>().ConvertUsing(d => DateTime.SpecifyKind(d, DateTimeKind.Utc));
        }
    }
}
