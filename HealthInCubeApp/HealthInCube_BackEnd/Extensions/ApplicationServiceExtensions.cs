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
            
            services.AddScoped<ITokenService, TokenService>();
            
            services.AddScoped<INemocnicaRepistory, NemocnicaRepository>();
            services.AddScoped<IPouzivatelRepository, PouzivatelRepository>();
            services.AddScoped<IClenenieSlovenskaRepository, ClenenieSlovenskaRepository>();
            services.AddScoped<ILekarRepository, LekarRepository>();
            services.AddScoped<IFotoRepository, FotoRepository>();





            // this is container for DB context 
            services.AddAutoMapper(typeof(AutoMapperProfiles).Assembly);

            services.AddDbContext<HealthInCubeContext>(options => {
                options.UseOracle(config.GetConnectionString("OracleDbConnection"));
            });

            return services;
        }
        
    }
}