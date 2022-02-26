using EmailService.Models;
using EmailService.Services;
using HealthInCube_BackEnd.Data;
using HealthInCube_BackEnd.Helpers;
using HealthInCube_BackEnd.Interfaces;
using HealthInCube_BackEnd.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace HealthInCube_BackEnd.Extensions
{
    /// <summary>
    /// Application extensions.
    /// </summary>
    public static class ApplicationServiceExtensions
    {
        /// <summary>
        /// Extendeted app services.
        /// </summary>
        /// <param name="services"></param>
        /// <param name="config"></param>
        /// <returns></returns>
        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
        {
            #region Email service 
            var emailConfig = config
                .GetSection("EmailConfiguration")
                .Get<EmailConfig>();
            services.AddSingleton(emailConfig);

            services.AddScoped<IEmailSender, EmailSender>();
            #endregion

            services.AddScoped<ITokenService, TokenService>();
            services.AddScoped<IEmailGeneratorService, EmailGeneratorService>();
            services.AddSignalR();

            #region Repositories DI
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

            services.AddSingleton<IAppointmentSchedulerService, AppointmentSchedulerService>();
            services.AddAutoMapper(typeof(AutoMapperProfiles).Assembly);
            services.AddDbContext<HealthInCubeContext>(options => {
                options.UseOracle(config.GetConnectionString("OracleDbConnection"));
            });
            return services;
        }
        
    }
}