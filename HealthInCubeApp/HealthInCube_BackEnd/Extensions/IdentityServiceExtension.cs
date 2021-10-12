using System.Text;
using HealthInCube_BackEnd.Data;
using HealthInCube_BackEnd.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;

namespace HealthInCube_BackEnd.Extensions
{
    public static  class IdentityServiceExtension
    {
        public static IServiceCollection AddIdentityService(this IServiceCollection services, IConfiguration config)
        {

             
            // this is signle page application not MVC 
            services.AddIdentityCore<Pouzivatel>(opt =>{
                opt.Password.RequireNonAlphanumeric = false;
            })
                .AddRoles<AppRola>()
                .AddRoleManager<RoleManager<AppRola>>()
                .AddSignInManager<SignInManager<Pouzivatel>>()
                .AddRoleValidator<RoleValidator<AppRola>>()
                .AddEntityFrameworkStores<HealthInCubeContext>();           // set up our database with .net indetity tables 




             // service for authentification
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options => {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"])),
                        ValidateIssuer = false,          // server 
                        ValidateAudience = false            // angular app 
                    };
                });


                return services;
        }
    }
}