using System;
using HealthInCube_BackEnd.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace HealthInCube_BackEnd.Data
{
    public partial class HealthInCubeContext : IdentityDbContext<Pouzivatel, AppRola, decimal
        , IdentityUserClaim<decimal>, AppPouzivatelRola, IdentityUserLogin<decimal>, IdentityRoleClaim<decimal>, IdentityUserToken<decimal>>
    {
        public HealthInCubeContext(DbContextOptions options) : base(options)
        {
        }

        #region Infrastructure DB
        public virtual DbSet<AtestacieLekar> AtestacieLekar { get; set; }
        public virtual DbSet<Bydlisko> Bydlisko { get; set; }
        public virtual DbSet<Choroba> Choroba { get; set; }
        public virtual DbSet<FotkaPouzivatel> FotkaPouzivatel { get; set; }
        public virtual DbSet<Kraj> Kraj { get; set; }
        public virtual DbSet<LBalenie> LBalenie { get; set; }
        public virtual DbSet<Lekar> Lekar { get; set; }
        public virtual DbSet<Liek> Liek { get; set; }
        public virtual DbSet<LiekAplikacium> LiekAplikacia { get; set; }
        public virtual DbSet<LiekUcinnaLatka> LiekUcinnaLatka { get; set; }
        public virtual DbSet<Mesto> Mesto { get; set; }

        public virtual DbSet<Nemocnica> Nemocnica { get; set; }
        public virtual DbSet<OblastUrcenia> OblastUrcenia { get; set; }
        public virtual DbSet<Oddelenie> Oddelenie { get; set; }
        public virtual DbSet<Okres> Okres { get; set; }
        public virtual DbSet<Pacient> Pacient { get; set; }
        public virtual DbSet<Poistovna> Poistovna { get; set; }
        // public virtual DbSet<Pouzivatel> Pouzivatel { get; set; }
        public virtual DbSet<PredpLiecba> PredpLiecba { get; set; }
        public virtual DbSet<Priznaky> Priznakie { get; set; }
        public virtual DbSet<Recept> Recept { get; set; }
        public virtual DbSet<TypLekara> TypLekara { get; set; }
        public virtual DbSet<TypSymptom> TypSymptom { get; set; }
        public virtual DbSet<UcinnaLatka> UcinnaLatka { get; set; }
        public virtual DbSet<VykVysetrenium> VykVysetrenia { get; set; }
        public virtual DbSet<ZapChoroby> ZapChorobie { get; set; }
        public virtual DbSet<ZdravKartaPovolenium> ZdravKartaPovolenia { get; set; }
        public virtual DbSet<ZdravPoistenie> ZdravPoistenie { get; set; }
        public virtual DbSet<ZdravotnaKartum> ZdravotnaKarta { get; set; }
        public virtual DbSet<Ziadanka> Ziadanka { get; set; }
        public virtual DbSet<ZoznamDen> ZoznamDen { get; set; }
        public virtual DbSet<VystavenyTermin> VystavenyTermins { get; set; }
        public virtual DbSet<Sprievodka> Sprievodkas { get; set; }
        public virtual DbSet<PracovnaDoba> PracovnaDobas { get; set; }
        public virtual DbSet<ZiadankaLekar> ZiadankaLekars { get; set; }
        #endregion


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // user defined functions
            modelBuilder.HasDbFunction(typeof(HealthInCubeContext).GetMethod(nameof(GetWeekNumberFromDb), new[] { typeof(DateTime) }))
                .HasName("GETWEEKNUMBER");

            #region Entities mapping

            modelBuilder.HasAnnotation("Relational:Collation", "USING_NLS_COMP");

            modelBuilder.Entity<Pouzivatel>()
                .HasMany(p => p.PouzivatelRole)
                .WithOne(r => r.Pouzivatel)
                .HasForeignKey(r => r.UserId)
                .IsRequired();

            modelBuilder.Entity<AppRola>()
                 .HasMany(r => r.PouzivatelRole)
                 .WithOne(u => u.PouzivatelRola)
                 .HasForeignKey(r => r.RoleId)
                 .IsRequired();

            modelBuilder.Entity<AppPouzivatelRola>(entity =>
            {
                entity.HasKey(r => new { r.RoleId, r.UserId });
            });

            modelBuilder.Entity<IdentityUserLogin<decimal>>(entity =>
            {
                entity.HasKey(r => r.UserId);
            });

            modelBuilder.Entity<IdentityUserToken<decimal>>(entity =>
            {
                entity.HasKey(r => r.UserId);
            });

            modelBuilder.Entity<Ziadanka>(entity =>
            {
                entity.HasKey(z => new { z.IdUser, z.IdLekar, z.CreatedAt });
                entity.ToTable("ZIADANKA");

                entity.Property(e => e.IdUser)
                   .HasColumnType("NUMBER(38)")
                   .HasColumnName("ID_PACIENT");

                entity.Property(e => e.IdLekar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LEKAR");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("DATE")
                    .HasColumnName("VYTVORENA");

                entity.Property(e => e.AcceptedAt)
                    .HasColumnType("DATE")
                    .HasColumnName("AKCEPTOVANA");


                entity.HasOne(d => d.IdLekarNavigation)
                        .WithMany(p => p.Ziadanky)
                        .HasForeignKey(d => d.IdLekar)
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("RELATIONSHIP200");

                entity.HasOne(d => d.IdPouzivatelNavigation)
                       .WithMany(p => p.Ziadanky)
                       .HasForeignKey(d => d.IdUser)
                       .OnDelete(DeleteBehavior.ClientSetNull)
                       .HasConstraintName("RELATIONSHIP201");
            });

            modelBuilder.Entity<AtestacieLekar>(entity =>
              {
                  entity.HasKey(e => new { e.IdAtestacia, e.IdLekar, e.IdTyp });

                  entity.ToTable("ATESTACIE_LEKAR");

                  entity.Property(e => e.IdAtestacia)
                      .HasColumnType("NUMBER(38)")
                      .HasColumnName("ID_ATESTACIA");

                  entity.Property(e => e.IdLekar)
                      .HasColumnType("NUMBER(38)")
                      .HasColumnName("ID_LEKAR");

                  entity.Property(e => e.IdTyp)
                      .HasColumnType("NUMBER(38)")
                      .HasColumnName("ID_TYP");

                  entity.Property(e => e.AtestaciaOd)
                      .HasColumnType("DATE")
                      .HasColumnName("ATESTACIA_OD");

                  entity.HasOne(d => d.IdLekarNavigation)
                      .WithMany(p => p.AtestacieLekars)
                      .HasForeignKey(d => d.IdLekar)
                      .OnDelete(DeleteBehavior.ClientSetNull)
                      .HasConstraintName("RELATIONSHIP62");

                  entity.HasOne(d => d.IdTypNavigation)
                      .WithMany(p => p.AtestacieLekars)
                      .HasForeignKey(d => d.IdTyp)
                      .OnDelete(DeleteBehavior.ClientSetNull)
                      .HasConstraintName("RELATIONSHIP63");
              });

            modelBuilder.Entity<Bydlisko>(entity =>
            {
                entity.HasKey(e => e.IdBydliska);

                entity.ToTable("BYDLISKO");

                entity.HasIndex(e => e.IdMesto, "IX_RELATIONSHIP102");

                entity.HasIndex(e => e.IdPouzivatel, "IX_RELATIONSHIP29");

                entity.Property(e => e.IdBydliska)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_BYDLISKA");

                entity.Property(e => e.AdresaDo)
                    .HasColumnType("DATE")
                    .HasColumnName("ADRESA_DO");

                entity.Property(e => e.AdresaOd)
                    .HasColumnType("DATE")
                    .HasColumnName("ADRESA_OD");

                entity.Property(e => e.IdMesto)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_MESTO");

                entity.Property(e => e.IdPouzivatel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POUZIVATEL");

                entity.Property(e => e.Trvale)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("TRVALE")
                    .IsFixedLength(true);

                entity.Property(e => e.Ulica)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("ULICA");

                entity.HasOne(d => d.IdMestoNavigation)
                    .WithMany(p => p.Bydliskos)
                    .HasForeignKey(d => d.IdMesto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP103");
                entity.HasOne(d => d.IdPouzivatelNavigation)
                    .WithMany(p => p.Bydliskos)
                    .HasForeignKey(d => d.IdPouzivatel)
                    .HasConstraintName("RELATIONSHIP29");
            });

            modelBuilder.Entity<Choroba>(entity =>
            {
                entity.HasKey(e => e.CisChoroba);

                entity.ToTable("CHOROBA");

                entity.Property(e => e.CisChoroba)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .HasColumnName("CIS_CHOROBA")
                    .IsFixedLength(true);

                entity.Property(e => e.DoplInfoNepatri)
                    .HasMaxLength(320)
                    .IsUnicode(false)
                    .HasColumnName("DOPL_INFO_NEPATRI");

                entity.Property(e => e.DoplInfoPatri)
                    .HasMaxLength(320)
                    .IsUnicode(false)
                    .HasColumnName("DOPL_INFO_PATRI");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.Property(e => e.ObmPohlavie)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("OBM_POHLAVIE")
                    .IsFixedLength(true);

                entity.Property(e => e.ObmVekDo)
                    .HasPrecision(2)
                    .HasColumnName("OBM_VEK_DO");

                entity.Property(e => e.ObmVekOd)
                    .HasPrecision(2)
                    .HasColumnName("OBM_VEK_OD");

                entity.Property(e => e.SkOchoreni)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("SK_OCHORENI");

                entity.Property(e => e.ValidDo)
                    .HasColumnType("DATE")
                    .HasColumnName("VALID_DO");

                entity.Property(e => e.ValidOd)
                    .HasColumnType("DATE")
                    .HasColumnName("VALID_OD");
            });

            modelBuilder.Entity<FotkaPouzivatel>(entity =>
            {
                entity.HasKey(e => e.IdPouzivatel);

                entity.ToTable("FOTKA_POUZIVATEL");

                entity.Property(e => e.IdPouzivatel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POUZIVATEL");

                entity.Property(e => e.Fotka)
                    .IsRequired()
                    .HasColumnType("BLOB")
                    .HasColumnName("FOTKA");

                entity.HasOne(d => d.IdPouzivatelNavigation)
                    .WithOne(p => p.FotkaPouzivatel)
                    .HasForeignKey<FotkaPouzivatel>(d => d.IdPouzivatel)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP55");
            });

            modelBuilder.Entity<Kraj>(entity =>
            {
                entity.HasKey(e => e.IdKraj);

                entity.ToTable("KRAJ");

                entity.Property(e => e.IdKraj)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_KRAJ");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(25)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");
            });

            modelBuilder.Entity<LBalenie>(entity =>
            {
                entity.HasKey(e => e.KodBalenia);

                entity.ToTable("L_BALENIE");

                entity.HasIndex(e => e.IdLiek, "IX_RELATIONSHIP72");

                entity.Property(e => e.KodBalenia)
                    .HasMaxLength(5)
                    .IsUnicode(false)
                    .HasColumnName("KOD_BALENIA")
                    .IsFixedLength(true);

                entity.Property(e => e.Cena)
                    .HasColumnType("NUMBER(10,2)")
                    .HasColumnName("CENA");

                entity.Property(e => e.Doplatok)
                    .HasColumnType("NUMBER(10,2)")
                    .HasColumnName("DOPLATOK");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.PocetKs)
                    .HasPrecision(3)
                    .HasColumnName("POCET_KS");

                entity.Property(e => e.SposobUhrady)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("SPOSOB_UHRADY")
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdLiekNavigation)
                    .WithMany(p => p.LBalenies)
                    .HasForeignKey(d => d.IdLiek)
                    .HasConstraintName("RELATIONSHIP72");
            });

            modelBuilder.Entity<Lekar>(entity =>
            {
                entity.HasKey(e => e.IdLekar);

                entity.ToTable("LEKAR");

                entity.HasIndex(e => e.IdPouzivatel, "IX_RELATIONSHIP16");

                entity.HasIndex(e => e.IdOddel, "IX_RELATIONSHIP51");

                entity.Property(e => e.IdLekar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LEKAR");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.Property(e => e.IdOddel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_ODDEL");

                entity.Property(e => e.IdPouzivatel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POUZIVATEL");

                entity.HasOne(d => d.IdOddelNavigation)
                    .WithMany(p => p.Lekars)
                    .HasForeignKey(d => d.IdOddel)
                    .HasConstraintName("RELATIONSHIP51");

                entity.HasOne(d => d.IdPouzivatelNavigation)
                    .WithMany(p => p.Lekars)
                    .HasForeignKey(d => d.IdPouzivatel)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP16");
            });

            modelBuilder.Entity<Liek>(entity =>
            {
                entity.HasKey(e => e.IdLiek);

                entity.ToTable("LIEK");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.LiekForma)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("LIEK_FORMA");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.Property(e => e.RezimVydaja)
                    .IsRequired()
                    .HasMaxLength(2)
                    .IsUnicode(false)
                    .HasColumnName("REZIM_VYDAJA")
                    .IsFixedLength(true);
            });

            modelBuilder.Entity<LiekAplikacium>(entity =>
            {
                entity.HasKey(e => new { e.IdLiek, e.IdOblast });

                entity.ToTable("LIEK_APLIKACIA");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.IdOblast)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_OBLAST");

                entity.HasOne(d => d.IdLiekNavigation)
                    .WithMany(p => p.LiekAplikacia)
                    .HasForeignKey(d => d.IdLiek)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP75");

                entity.HasOne(d => d.IdOblastNavigation)
                    .WithMany(p => p.LiekAplikacia)
                    .HasForeignKey(d => d.IdOblast)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP76");
            });

            modelBuilder.Entity<LiekUcinnaLatka>(entity =>
            {
                entity.HasKey(e => new { e.IdLiek, e.IdLatka });

                entity.ToTable("LIEK_UCINNA_LATKA");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.IdLatka)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LATKA");

                entity.HasOne(d => d.IdLatkaNavigation)
                    .WithMany(p => p.LiekUcinnaLatkas)
                    .HasForeignKey(d => d.IdLatka)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP74");

                entity.HasOne(d => d.IdLiekNavigation)
                    .WithMany(p => p.LiekUcinnaLatkas)
                    .HasForeignKey(d => d.IdLiek)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP73");
            });

            modelBuilder.Entity<Mesto>(entity =>
            {
                entity.HasKey(e => e.IdMesto);

                entity.ToTable("MESTO");

                entity.HasIndex(e => e.IdOkres, "IX_RELATIONSHIP70");

                entity.Property(e => e.IdMesto)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_MESTO");

                entity.Property(e => e.IdOkres)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_OKRES");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.HasOne(d => d.IdOkresNavigation)
                    .WithMany(p => p.Mestos)
                    .HasForeignKey(d => d.IdOkres)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP70");
            });

            modelBuilder.Entity<Nemocnica>(entity =>
            {
                entity.HasKey(e => e.IdNem);

                entity.ToTable("NEMOCNICA");

                entity.HasIndex(e => e.IdMesto, "IX_RELATIONSHIP100");

                entity.Property(e => e.IdNem)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_NEM");

                entity.Property(e => e.IdMesto)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_MESTO");

                entity.Property(e => e.Mobil)
                    .IsRequired()
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("MOBIL");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.Property(e => e.Ulica)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("ULICA")
                    .HasDefaultValueSql("100 ");

                entity.Property(e => e.UrlStranka)
                    .HasMaxLength(300)
                    .IsUnicode(false)
                    .HasColumnName("URL_STRANKA");

                entity.HasOne(d => d.IdMestoNavigation)
                    .WithMany(p => p.Nemocnicas)
                    .HasForeignKey(d => d.IdMesto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP101");
            });

            modelBuilder.Entity<OblastUrcenia>(entity =>
            {
                entity.HasKey(e => e.IdOblast);

                entity.ToTable("OBLAST_URCENIA");

                entity.Property(e => e.IdOblast)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_OBLAST");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");
            });

            modelBuilder.Entity<Oddelenie>(entity =>
            {
                entity.HasKey(e => e.IdOddel);

                entity.ToTable("ODDELENIE");

                entity.HasIndex(e => e.IdNem, "IX_RELATIONSHIP49");

                entity.HasIndex(e => e.IdPrimar, "IX_RELATIONSHIP61");

                entity.Property(e => e.IdOddel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_ODDEL");

                entity.Property(e => e.IdNem)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_NEM");

                entity.Property(e => e.IdPrimar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PRIMAR");

                entity.Property(e => e.NazovOdd)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV_ODD");

                entity.HasOne(d => d.IdNemNavigation)
                    .WithMany(p => p.Oddelenies)
                    .HasForeignKey(d => d.IdNem)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP49");

                entity.HasOne(d => d.IdPrimarNavigation)
                    .WithMany(p => p.Oddelenies)
                    .HasForeignKey(d => d.IdPrimar)
                    .HasConstraintName("RELATIONSHIP61");
            });

            modelBuilder.Entity<Okres>(entity =>
            {
                entity.HasKey(e => e.IdOkres);

                entity.ToTable("OKRES");

                entity.HasIndex(e => e.IdKraj, "IX_RELATIONSHIP1");

                entity.Property(e => e.IdOkres)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_OKRES");

                entity.Property(e => e.IdKraj)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_KRAJ");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");
            });

            modelBuilder.Entity<Pacient>(entity =>
            {
                entity.HasKey(e => e.IdPacient);

                entity.ToTable("PACIENT");

                entity.HasIndex(e => e.IdPouzivatel, "IX_RELATIONSHIP10");

                entity.HasIndex(e => e.IdVseobecnyLekar, "IX_RELATIONSHIP33");

                entity.Property(e => e.IdPacient)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PACIENT");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.Property(e => e.IdPouzivatel)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POUZIVATEL");

                entity.Property(e => e.IdVseobecnyLekar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_VSEOBECNY_LEKAR");

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.HasOne(d => d.IdPouzivatelNavigation)
                    .WithMany(p => p.Pacients)
                    .HasForeignKey(d => d.IdPouzivatel)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP10");

                entity.HasOne(d => d.IdVseobecnyLekarNavigation)
                    .WithMany(p => p.Pacients)
                    .HasForeignKey(d => d.IdVseobecnyLekar)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP33");
            });

            modelBuilder.Entity<Poistovna>(entity =>
            {
                entity.HasKey(e => e.IdPoistovna);

                entity.ToTable("POISTOVNA");

                entity.Property(e => e.IdPoistovna)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POISTOVNA");

                entity.Property(e => e.KontaktMobil)
                    .IsRequired()
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("KONTAKT_MOBIL");

                entity.Property(e => e.LogoUrl)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("LOGO_URL");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.Property(e => e.OdkazUrl)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("ODKAZ_URL");
            });

            // modelBuilder.Entity<Pouzivatel>(entity =>
            // {
            //     entity.HasKey(e => e.IdPouzivatel);

            //     entity.ToTable("POUZIVATEL");


            //     entity.Property(e => e.IdPouzivatel)
            //         .HasColumnType("NUMBER(38)")
            //         .HasColumnName("ID_POUZIVATEL");

            //     entity.Property(e => e.DatNarodenia)
            //         .HasColumnType("DATE")
            //         .HasColumnName("DAT_NARODENIA");

            //     entity.Property(e => e.Email)
            //         .IsRequired()
            //         .HasMaxLength(255)
            //         .IsUnicode(false)
            //         .HasColumnName("EMAIL");


            //     entity.Property(e => e.Meno)
            //         .IsRequired()
            //         .HasMaxLength(15)
            //         .IsUnicode(false)
            //         .HasColumnName("MENO");

            //     entity.Property(e => e.Mobil)
            //         .HasMaxLength(12)
            //         .IsUnicode(false)
            //         .HasColumnName("MOBIL");

            //     entity.Property(e => e.Pohlavie)
            //         .HasMaxLength(1)
            //         .IsUnicode(false)
            //         .HasColumnName("POHLAVIE")
            //         .IsFixedLength(true);

            //     entity.Property(e => e.PoslednePrihlasenie)
            //         .HasColumnType("DATE")
            //         .HasColumnName("POSLEDNE_PRIHLASENIE");

            //     entity.Property(e => e.Priezvisko)
            //         .IsRequired()
            //         .HasMaxLength(15)
            //         .IsUnicode(false)
            //         .HasColumnName("PRIEZVISKO");

            //     entity.Property(e => e.Registrovany)
            //         .HasColumnType("DATE")
            //         .HasColumnName("REGISTROVANY");

            //     entity.Property(e => e.RodCislo)
            //         .HasMaxLength(11)
            //         .IsUnicode(false)
            //         .HasColumnName("ROD_CISLO")
            //         .IsFixedLength(true);

            //     entity.Property(e => e.RodPriezvisko)
            //         .HasMaxLength(15)
            //         .IsUnicode(false)
            //         .HasColumnName("ROD_PRIEZVISKO");
            // });

            modelBuilder.Entity<PredpLiecba>(entity =>
            {
                entity.HasKey(e => new { e.IdLiek, e.Od, e.IdVysetrenie });

                entity.ToTable("PREDP_LIECBA");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.Property(e => e.IdVysetrenie)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_VYSETRENIE");

                entity.Property(e => e.DavkovaniePocet)
                    .HasPrecision(3)
                    .HasColumnName("DAVKOVANIE_POCET");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.HasOne(d => d.IdLiekNavigation)
                    .WithMany(p => p.PredpLiecbas)
                    .HasForeignKey(d => d.IdLiek)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP6");

                entity.HasOne(d => d.IdVysetrenieNavigation)
                    .WithMany(p => p.PredpLiecbas)
                    .HasForeignKey(d => d.IdVysetrenie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP39");
            });

            modelBuilder.Entity<Priznaky>(entity =>
            {
                entity.HasKey(e => new { e.CisChoroba, e.Od, e.IdZdravotnaKarta, e.IdSymptom });

                entity.ToTable("PRIZNAKY");

                entity.Property(e => e.CisChoroba)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .HasColumnName("CIS_CHOROBA")
                    .IsFixedLength(true);

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.Property(e => e.IdZdravotnaKarta)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_ZDRAVOTNA_KARTA");

                entity.Property(e => e.IdSymptom)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_SYMPTOM");

                entity.HasOne(d => d.IdSymptomNavigation)
                    .WithMany(p => p.Priznakies)
                    .HasForeignKey(d => d.IdSymptom)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP69");

                entity.HasOne(d => d.ZapChoroby)
                    .WithMany(p => p.Priznakies)
                    .HasForeignKey(d => new { d.CisChoroba, d.Od, d.IdZdravotnaKarta })
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP68");
            });

            modelBuilder.Entity<Recept>(entity =>
            {
                entity.HasKey(e => e.IdRecept);

                entity.ToTable("RECEPT");

                entity.HasIndex(e => e.IdVysetrenie, "IX_RELATIONSHIP35");

                entity.HasIndex(e => e.IdLiek, "IX_RELATIONSHIP41");

                entity.Property(e => e.IdRecept)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_RECEPT");

                entity.Property(e => e.BalenieKs)
                    .HasPrecision(2)
                    .HasColumnName("BALENIE_KS");

                entity.Property(e => e.Cena)
                    .HasColumnType("NUMBER(10,2)")
                    .HasColumnName("CENA");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.IdVysetrenie)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_VYSETRENIE");

                entity.Property(e => e.Vybranie)
                    .HasColumnType("DATE")
                    .HasColumnName("VYBRANIE");

                entity.Property(e => e.Vystavenie)
                    .HasColumnType("DATE")
                    .HasColumnName("VYSTAVENIE");

                entity.Property(e => e.IdBalenie)
                    .HasMaxLength(5)
                    .IsUnicode(false)
                    .HasColumnName("KOD_BALENIA")
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdLiekNavigation)
                    .WithMany(p => p.Recepts)
                    .HasForeignKey(d => d.IdLiek)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP41");

                entity.HasOne(d => d.IdVysetrenieNavigation)
                    .WithMany(p => p.Recepts)
                    .HasForeignKey(d => d.IdVysetrenie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP35");

                entity.HasOne(d => d.IdBalenenieNavigation)
                    .WithMany(p => p.Recepts)
                    .HasForeignKey(d => d.IdBalenie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIPBALENIEFK");
            });



            modelBuilder.Entity<TypLekara>(entity =>
            {
                entity.HasKey(e => e.IdTyp);

                entity.ToTable("TYP_LEKARA");

                entity.Property(e => e.IdTyp)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_TYP");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(40)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");

                entity.Property(e => e.Popis)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("POPIS");
            });

            modelBuilder.Entity<TypSymptom>(entity =>
            {
                entity.HasKey(e => e.IdSymptom);

                entity.ToTable("TYP_SYMPTOM");

                entity.Property(e => e.IdSymptom)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_SYMPTOM");

                entity.Property(e => e.Nazov)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("NAZOV");
            });

            modelBuilder.Entity<UcinnaLatka>(entity =>
            {
                entity.HasKey(e => e.IdLatka);

                entity.ToTable("UCINNA_LATKA");

                entity.Property(e => e.IdLatka)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LATKA");

                entity.Property(e => e.IdLiek)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LIEK");

                entity.Property(e => e.UcinnaLatka1)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("UCINNA_LATKA");

                entity.Property(e => e.UcinnaLatkaGramaz)
                    .HasPrecision(6)
                    .HasColumnName("UCINNA_LATKA_GRAMAZ");
            });

            modelBuilder.Entity<VykVysetrenium>(entity =>
            {
                entity.HasKey(e => e.IdVysetrenie);

                entity.ToTable("VYK_VYSETRENIA");

                entity.HasIndex(e => e.IdLekar, "IX_RELATIONSHIP23");

                entity.HasIndex(e => e.IdTypVysetrenia, "IX_RELATIONSHIP_IdTypVysetrenie");

                entity.HasIndex(e => e.IdPacient, "IX_RELATIONSHIP36");

                entity.Property(e => e.IdVysetrenie)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_VYSETRENIE");

                entity.Property(e => e.DatumVys)
                    .HasColumnType("TIMESTAMP WITH TIME ZONE")
                    .HasColumnName("DATUM_VYS");

                entity.Property(e => e.IdLekar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LEKAR");

                entity.Property(e => e.IdPacient)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PACIENT");

                entity.Property(e => e.IdTypVysetrenia)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_TYP");

                entity.Property(e => e.Priloha)
                    .HasColumnType("BLOB")
                    .HasColumnName("PRILOHA");

                entity.Property(e => e.Vysledok)
                    .IsRequired()
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("VYSLEDOK");

                entity.HasOne(d => d.IdLekarNavigation)
                    .WithMany(p => p.VykVysetrenia)
                    .HasForeignKey(d => d.IdLekar)
                    .HasConstraintName("RELATIONSHIP23");

                entity.HasOne(d => d.IdPacientNavigation)
                    .WithMany(p => p.VykVysetrenia)
                    .HasForeignKey(d => d.IdPacient)
                    .HasConstraintName("RELATIONSHIP36");

                entity.HasOne(s => s.IdTypLekarNavigation)
                    .WithMany(p => p.VykVysetrenia)
                    .HasForeignKey(s => s.IdTypVysetrenia);
            });

            modelBuilder.Entity<ZapChoroby>(entity =>
            {
                entity.HasKey(e => new { e.CisChoroba, e.Od, e.IdZdravotnaKarta });

                entity.ToTable("ZAP_CHOROBY");

                entity.HasIndex(e => e.IdVysetrenie, "IX_RELATIONSHIP32");

                entity.Property(e => e.CisChoroba)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .HasColumnName("CIS_CHOROBA")
                    .IsFixedLength(true);

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.Property(e => e.IdZdravotnaKarta)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_ZDRAVOTNA_KARTA");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.Property(e => e.IdVysetrenie)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_VYSETRENIE");

                entity.HasOne(d => d.CisChorobaNavigation)
                    .WithMany(p => p.ZapChorobies)
                    .HasForeignKey(d => d.CisChoroba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP8");

                entity.HasOne(d => d.IdVysetrenieNavigation)
                    .WithMany(p => p.ZapChorobies)
                    .HasForeignKey(d => d.IdVysetrenie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP32");

                entity.HasOne(d => d.IdZdravotnaKartaNavigation)
                    .WithMany(p => p.ZapChorobies)
                    .HasForeignKey(d => d.IdZdravotnaKarta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP7");
            });

            modelBuilder.Entity<ZdravKartaPovolenium>(entity =>
            {
                entity.HasKey(e => new { e.Od, e.IdLekar, e.IdPacient });

                entity.ToTable("ZDRAV_KARTA_POVOLENIA");

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.Property(e => e.IdLekar)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_LEKAR");

                entity.Property(e => e.IdPacient)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PACIENT");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.HasOne(d => d.IdLekarNavigation)
                    .WithMany(p => p.ZdravKartaPovolenia)
                    .HasForeignKey(d => d.IdLekar)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP54");

                entity.HasOne(d => d.IdPacientNavigation)
                    .WithMany(p => p.ZdravKartaPovolenia)
                    .HasForeignKey(d => d.IdPacient)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP53");
            });

            modelBuilder.Entity<ZdravPoistenie>(entity =>
            {
                entity.HasKey(e => new { e.IdPoistovna, e.IdPacient, e.Od });

                entity.ToTable("ZDRAV_POISTENIE");

                entity.Property(e => e.IdPoistovna)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_POISTOVNA");

                entity.Property(e => e.IdPacient)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PACIENT");

                entity.Property(e => e.Od)
                    .HasColumnType("DATE")
                    .HasColumnName("OD");

                entity.Property(e => e.Do)
                    .HasColumnType("DATE")
                    .HasColumnName("DO");

                entity.HasOne(d => d.IdPacientNavigation)
                    .WithMany(p => p.ZdravPoistenies)
                    .HasForeignKey(d => d.IdPacient)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP65");

                entity.HasOne(d => d.IdPoistovnaNavigation)
                    .WithMany(p => p.ZdravPoistenies)
                    .HasForeignKey(d => d.IdPoistovna)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP64");
            });

            modelBuilder.Entity<ZdravotnaKartum>(entity =>
            {
                entity.HasKey(e => e.IdPacient);

                entity.ToTable("ZDRAVOTNA_KARTA");

                entity.HasIndex(e => e.IdMestoNarodenia, "IX_RELATIONSHIP104");

                entity.Property(e => e.IdPacient)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_PACIENT");

                entity.Property(e => e.IdMestoNarodenia)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_MESTO_NARODENIA");

                entity.Property(e => e.KrvSkupina)
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("KRV_SKUPINA");

                entity.HasOne(d => d.IdMestoNarodeniaNavigation)
                    .WithMany(p => p.ZdravotnaKarta)
                    .HasForeignKey(d => d.IdMestoNarodenia)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("RELATIONSHIP105");

                entity.HasOne(d => d.IdPacientNavigation)
                    .WithOne(p => p.ZdravotnaKartum)
                    .HasForeignKey<ZdravotnaKartum>(d => d.IdPacient)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("RELATIONSHIP42");
            });

            modelBuilder.Entity<ZoznamDen>(entity =>
            {
                entity.HasKey(d => d.IdDen);

                entity.ToTable("ZOZNAM_DEN");

                entity.Property(e => e.IdDen)
                  .HasColumnName("ID_DEN");

                entity.Property(e => e.Nazov)
                  .HasColumnName("NAZOV");
            });
              

            modelBuilder.Entity<PracovnaDoba>(entity =>
            {
                entity.HasKey(p => new { p.IdLekar, p.IdDen });

                entity.ToTable("PRAC_DOBA");

                entity.HasOne(zd => zd.IdLekarNavigation)
                    .WithMany(l => l.PracovnaDobas)
                    .OnDelete(DeleteBehavior.ClientSetNull);
                    
                entity.HasOne(zd => zd.IdZoznamNavigation)
                    .WithMany(d => d.PracovnaDobas)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Sprievodka>(entity =>
            {
                entity.HasKey(s => new { s.IdLekar, s.IdPacient, s.TerminOd });

                entity.ToTable("SPRIEVODKA");

                entity.HasOne(s => s.IdLekarNavigation)
                    .WithMany(l => l.Sprievodkas);

                entity.HasOne(s => s.IdPacientNavigation)
                    .WithMany(p => p.Sprievodkas);

                entity.HasOne(s => s.IdTypLekarNavigation)
                    .WithMany(p => p.Sprievodkas)
                    .HasForeignKey(s => s.IdTypVysetrenia);
            });

            modelBuilder.Entity<VystavenyTermin>()
                   .ToTable("VYSTAVENY_TERMIN");

            modelBuilder.Entity<ZiadankaLekar>(entity =>
            {
                entity.HasKey(z => new { z.IdUser, z.IdNemocnica, z.CreatedAt });
                entity.ToTable("ZIADANKA_LEKAR");

                entity.Property(e => e.IdUser)
                   .HasColumnType("NUMBER(38)")
                   .HasColumnName("ID_USER");

                entity.Property(e => e.IdNemocnica)
                    .HasColumnType("NUMBER(38)")
                    .HasColumnName("ID_NEMOCNICA");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("DATE")
                    .HasColumnName("VYTVORENA");

                entity.Property(e => e.AcceptedAt)
                    .HasColumnType("DATE")
                    .HasColumnName("AKCEPTOVANA");

                entity.HasOne(d => d.PouzivatelNavigation)
                       .WithMany(p => p.ZiadankaLekars)
                       .HasForeignKey(d => d.IdUser)
                       .OnDelete(DeleteBehavior.ClientSetNull)
                       .HasConstraintName("RELATIONSHIP_ZIADANKA_LEKAR_FK");
            });


            #endregion

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        /// <summary>
        /// Method inside sql.
        /// For mapping purpose.
        /// Date in YYYY-MM-DD format.
        /// </summary>
        /// <param name="date">YYYY-MM-DD format.</param>
        /// <returns></returns>
        public int GetWeekNumberFromDb(DateTime p_start_week_of) => throw new NotSupportedException("Mapping issue for GetWeekNumber function");
    }
}
