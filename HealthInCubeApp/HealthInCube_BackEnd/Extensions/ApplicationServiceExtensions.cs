using AutoMapper;
using HealthInCube_BackEnd.Data;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace HealthInCube_BackEnd.Extensions
{
    public static class ApplicationServiceExtensions
    {


        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
        {
            #region Repositories DI
            services.AddScoped<ITokenService, TokenService>();
            
            services.AddScoped<INemocnicaRepistory, NemocnicaRepository>();
            services.AddScoped<IPouzivatelRepository, PouzivatelRepository>();
            services.AddScoped<IClenenieSlovenskaRepository, ClenenieSlovenskaRepository>();
            services.AddScoped<ILekarRepository, LekarRepository>();
            services.AddScoped<IFotoRepository, FotoRepository>();
            services.AddScoped<IZiadankaRepository, ZiadankaRepository>();
            services.AddScoped<IPacientRepository, PacientRepository>();
            services.AddScoped<IBydliskoRepository, BydliskoRepository>();
            services.AddScoped<ISprievodkaRepository, SprievodkaRepository>();
            services.AddScoped<IPracovnaDobaRepository, PracovnaDobaRepository>();

            #endregion


            // this is container for DB context 
            services.AddAutoMapper(typeof(AutoMapperProfiles).Assembly);

            services.AddDbContext<HealthInCubeContext>(options => {
                options.UseOracle(config.GetConnectionString("OracleDbConnection"));
            });

            return services;
        }
        
    }
}