

namespace HealthInCubeModel
{
    using System;
    using System.Data.Entity.Infrastructure;
    using Microsoft.EntityFrameworkCore;
    using DbContext = Microsoft.EntityFrameworkCore.DbContext;

    public partial class HealthInCubeContext : DbContext
    {
        public HealthInCubeContext(DbContextOptions options) : base(options)
        {
        }
    
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // modelBuilder.Entity<LEKAR>().HasMany(lekar => lekar.ODDELENIEs)
            //                             .WithRequired().HasForeignKey(od => od.);


        }
    
        public DbSet<ATESTACIE_LEKAR> ATESTACIE_LEKAR { get; set; }
        public DbSet<BYDLISKO> BYDLISKO { get; set; }
        public DbSet<FOTKA_POUZIVATEL> FOTKA_POUZIVATEL { get; set; }
        public DbSet<CHOROBA> CHOROBA { get; set; }
        public DbSet<KRAJ> KRAJ { get; set; }
        public DbSet<L_BALENIE> L_BALENIE { get; set; }
        public DbSet<LEKAR> LEKAR { get; set; }
        public DbSet<LIEK> LIEK { get; set; }
        public DbSet<MESTO> MESTO { get; set; }
        public DbSet<NEMOCNICA> NEMOCNICA { get; set; }
        public DbSet<OBLAST_URCENIA> OBLAST_URCENIA { get; set; }
        public DbSet<ODDELENIE> ODDELENIE { get; set; }
        public DbSet<OKRES> OKRES { get; set; }
        public DbSet<PACIENT> PACIENT { get; set; }
        public DbSet<POISTOVNA> POISTOVNA { get; set; }
        public DbSet<POUZIVATEL> POUZIVATEL { get; set; }
        public DbSet<PREDP_LIECBA> PREDP_LIECBA { get; set; }
        public DbSet<RECEPT> RECEPT { get; set; }
        public DbSet<ROLA> ROLA { get; set; }
        public DbSet<TYP_LEKARA> TYP_LEKARA { get; set; }
        public DbSet<TYP_SYMPTOM> TYP_SYMPTOM { get; set; }
        public DbSet<UCINNA_LATKA> UCINNA_LATKA { get; set; }
        public DbSet<VYK_VYSETRENIA> VYK_VYSETRENIA { get; set; }
        public DbSet<ZAP_CHOROBY> ZAP_CHOROBY { get; set; }
        public DbSet<ZDRAV_KARTA_POVOLENIA> ZDRAV_KARTA_POVOLENIA { get; set; }
        public DbSet<ZDRAV_POISTENIE> ZDRAV_POISTENIE { get; set; }
        public DbSet<ZDRAVOTNA_KARTA> ZDRAVOTNA_KARTA { get; set; }
    }
}
