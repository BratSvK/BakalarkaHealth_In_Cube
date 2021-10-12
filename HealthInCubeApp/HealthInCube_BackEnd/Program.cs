using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HealthInCube_BackEnd.Data;
using HealthInCube_BackEnd.Entities;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace HealthInCube_BackEnd
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();
            // get service and pass it to seed method 
            using var scope = host.Services.CreateScope();

            var services  = scope.ServiceProvider;
            try
            {
                var context = services.GetRequiredService<HealthInCubeContext>();
                var userManager = services.GetRequiredService<UserManager<Pouzivatel>>();
                var roleManager = services.GetRequiredService<RoleManager<AppRola>>();
                await context.Database.MigrateAsync();


                // await Seed.SeedUsers(userManager, roleManager);
                
            }
            catch (Exception ex) 
            {
                
                var logger = services.GetRequiredService<ILogger<Program>>();
                logger.LogError(ex, "An error occured during migration");
            }
            await host.RunAsync();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
