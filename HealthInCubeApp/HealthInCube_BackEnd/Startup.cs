using HealthInCube_BackEnd.Extensions;
using HealthInCube_BackEnd.Middleware;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;

namespace HealthInCube_BackEnd
{
    public class Startup
    {
        private readonly IConfiguration _configuration;

        /// <summary>
        /// Dependency injection to startup class.
        /// </summary>
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <summary>
        /// This method gets called by the runtime. Use this method to add services to the container.
        /// DI container for all application along.
        /// </summary>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddApplicationServices(_configuration);

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "HealthInCube_BackEnd", Version = "v1" });
            });
            services.AddIdentityService(_configuration);
        }

        /// <summary>
        /// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// </summary>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseMiddleware<ExceptionMiddleware>();

            app.UseHttpsRedirection();

            app.UseRouting();

            // there is right place where to put corses 
            // we need set a policy to our app x=> policy 
            app.UseCors(x => x.AllowAnyHeader().AllowAnyMethod().WithOrigins("https://localhost:4200"));

            // using middleware
            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                // map all controller with endPoints inside to our page 
                endpoints.MapControllers();
            });
        }
    }
}
