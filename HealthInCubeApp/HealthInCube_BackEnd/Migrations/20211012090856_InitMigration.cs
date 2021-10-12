using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace HealthInCube_BackEnd.Migrations
{
    public partial class InitMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // migrationBuilder.CreateTable(
            //     name: "CHOROBA",
            //     columns: table => new
            //     {
            //         CIS_CHOROBA = table.Column<string>(type: "CHAR(4)", unicode: false, fixedLength: true, maxLength: 4, nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(255)", unicode: false, maxLength: 255, nullable: false),
            //         SK_OCHORENI = table.Column<string>(type: "VARCHAR2(150)", unicode: false, maxLength: 150, nullable: true),
            //         OBM_VEK_OD = table.Column<byte>(type: "NUMBER(2)", precision: 2, nullable: true),
            //         OBM_VEK_DO = table.Column<byte>(type: "NUMBER(2)", precision: 2, nullable: true),
            //         OBM_POHLAVIE = table.Column<string>(type: "CHAR(1)", unicode: false, fixedLength: true, maxLength: 1, nullable: true),
            //         VALID_OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         VALID_DO = table.Column<DateTime>(type: "DATE", nullable: true),
            //         DOPL_INFO_PATRI = table.Column<string>(type: "VARCHAR2(320)", unicode: false, maxLength: 320, nullable: true),
            //         DOPL_INFO_NEPATRI = table.Column<string>(type: "VARCHAR2(320)", unicode: false, maxLength: 320, nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_CHOROBA", x => x.CIS_CHOROBA);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "KRAJ",
            //     columns: table => new
            //     {
            //         ID_KRAJ = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(25)", unicode: false, maxLength: 25, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_KRAJ", x => x.ID_KRAJ);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "LIEK",
            //     columns: table => new
            //     {
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(255)", unicode: false, maxLength: 255, nullable: false),
            //         REZIM_VYDAJA = table.Column<string>(type: "CHAR(2)", unicode: false, fixedLength: true, maxLength: 2, nullable: false),
            //         LIEK_FORMA = table.Column<string>(type: "VARCHAR2(30)", unicode: false, maxLength: 30, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_LIEK", x => x.ID_LIEK);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "OBLAST_URCENIA",
            //     columns: table => new
            //     {
            //         ID_OBLAST = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(100)", unicode: false, maxLength: 100, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_OBLAST_URCENIA", x => x.ID_OBLAST);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "OKRES",
            //     columns: table => new
            //     {
            //         ID_OKRES = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_KRAJ = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(150)", unicode: false, maxLength: 150, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_OKRES", x => x.ID_OKRES);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "POISTOVNA",
            //     columns: table => new
            //     {
            //         ID_POISTOVNA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(50)", unicode: false, maxLength: 50, nullable: false),
            //         KONTAKT_MOBIL = table.Column<string>(type: "VARCHAR2(12)", unicode: false, maxLength: 12, nullable: false),
            //         LOGO_URL = table.Column<string>(type: "VARCHAR2(50)", unicode: false, maxLength: 50, nullable: false),
            //         ODKAZ_URL = table.Column<string>(type: "VARCHAR2(50)", unicode: false, maxLength: 50, nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_POISTOVNA", x => x.ID_POISTOVNA);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ROLA",
            //     columns: table => new
            //     {
            //         ID_TYP = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(40)", unicode: false, maxLength: 40, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ROLA", x => x.ID_TYP);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "TYP_LEKARA",
            //     columns: table => new
            //     {
            //         ID_TYP = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(40)", unicode: false, maxLength: 40, nullable: false),
            //         POPIS = table.Column<string>(type: "VARCHAR2(255)", unicode: false, maxLength: 255, nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_TYP_LEKARA", x => x.ID_TYP);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "TYP_SYMPTOM",
            //     columns: table => new
            //     {
            //         ID_SYMPTOM = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(100)", unicode: false, maxLength: 100, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_TYP_SYMPTOM", x => x.ID_SYMPTOM);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "UCINNA_LATKA",
            //     columns: table => new
            //     {
            //         ID_LATKA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         UCINNA_LATKA = table.Column<string>(type: "VARCHAR2(30)", unicode: false, maxLength: 30, nullable: false),
            //         UCINNA_LATKA_GRAMAZ = table.Column<int>(type: "NUMBER(6)", precision: 6, nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_UCINNA_LATKA", x => x.ID_LATKA);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "L_BALENIE",
            //     columns: table => new
            //     {
            //         KOD_BALENIA = table.Column<string>(type: "CHAR(5)", unicode: false, fixedLength: true, maxLength: 5, nullable: false),
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         SPOSOB_UHRADY = table.Column<string>(type: "CHAR(1)", unicode: false, fixedLength: true, maxLength: 1, nullable: false),
            //         CENA = table.Column<decimal>(type: "NUMBER(10,2)", nullable: false),
            //         DOPLATOK = table.Column<decimal>(type: "NUMBER(10,2)", nullable: false),
            //         POCET_KS = table.Column<byte>(type: "NUMBER(3)", precision: 3, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_L_BALENIE", x => x.KOD_BALENIA);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP72",
            //             column: x => x.ID_LIEK,
            //             principalTable: "LIEK",
            //             principalColumn: "ID_LIEK",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "LIEK_APLIKACIA",
            //     columns: table => new
            //     {
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_OBLAST = table.Column<decimal>(type: "NUMBER(38)", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_LIEK_APLIKACIA", x => new { x.ID_LIEK, x.ID_OBLAST });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP75",
            //             column: x => x.ID_LIEK,
            //             principalTable: "LIEK",
            //             principalColumn: "ID_LIEK",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP76",
            //             column: x => x.ID_OBLAST,
            //             principalTable: "OBLAST_URCENIA",
            //             principalColumn: "ID_OBLAST",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "MESTO",
            //     columns: table => new
            //     {
            //         ID_MESTO = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_OKRES = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(150)", unicode: false, maxLength: 150, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_MESTO", x => x.ID_MESTO);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP70",
            //             column: x => x.ID_OKRES,
            //             principalTable: "OKRES",
            //             principalColumn: "ID_OKRES",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "POUZIVATEL",
            //     columns: table => new
            //     {
            //         ID_POUZIVATEL = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_TYP = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         REGISTROVANY = table.Column<DateTime>(type: "DATE", nullable: false),
            //         MENO = table.Column<string>(type: "VARCHAR2(15)", unicode: false, maxLength: 15, nullable: false),
            //         PRIEZVISKO = table.Column<string>(type: "VARCHAR2(15)", unicode: false, maxLength: 15, nullable: false),
            //         ROD_PRIEZVISKO = table.Column<string>(type: "VARCHAR2(15)", unicode: false, maxLength: 15, nullable: true),
            //         ROD_CISLO = table.Column<string>(type: "CHAR(11)", unicode: false, fixedLength: true, maxLength: 11, nullable: true),
            //         DAT_NARODENIA = table.Column<DateTime>(type: "DATE", nullable: true),
            //         EMAIL = table.Column<string>(type: "VARCHAR2(255)", unicode: false, maxLength: 255, nullable: false),
            //         MOBIL = table.Column<string>(type: "VARCHAR2(12)", unicode: false, maxLength: 12, nullable: true),
            //         POSLEDNE_PRIHLASENIE = table.Column<DateTime>(type: "DATE", nullable: true),
            //         POHLAVIE = table.Column<string>(type: "CHAR(1)", unicode: false, fixedLength: true, maxLength: 1, nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_POUZIVATEL", x => x.ID_POUZIVATEL);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP52",
            //             column: x => x.ID_TYP,
            //             principalTable: "ROLA",
            //             principalColumn: "ID_TYP",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "LIEK_UCINNA_LATKA",
            //     columns: table => new
            //     {
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_LATKA = table.Column<decimal>(type: "NUMBER(38)", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_LIEK_UCINNA_LATKA", x => new { x.ID_LIEK, x.ID_LATKA });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP73",
            //             column: x => x.ID_LIEK,
            //             principalTable: "LIEK",
            //             principalColumn: "ID_LIEK",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP74",
            //             column: x => x.ID_LATKA,
            //             principalTable: "UCINNA_LATKA",
            //             principalColumn: "ID_LATKA",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "NEMOCNICA",
            //     columns: table => new
            //     {
            //         ID_NEM = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         NAZOV = table.Column<string>(type: "VARCHAR2(150)", unicode: false, maxLength: 150, nullable: false),
            //         MOBIL = table.Column<string>(type: "VARCHAR2(12)", unicode: false, maxLength: 12, nullable: false),
            //         ULICA = table.Column<string>(type: "VARCHAR2(50)", unicode: false, maxLength: 50, nullable: false, defaultValueSql: "100 "),
            //         URL_STRANKA = table.Column<string>(type: "VARCHAR2(300)", unicode: false, maxLength: 300, nullable: true),
            //         ID_MESTO = table.Column<decimal>(type: "NUMBER(38)", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_NEMOCNICA", x => x.ID_NEM);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP101",
            //             column: x => x.ID_MESTO,
            //             principalTable: "MESTO",
            //             principalColumn: "ID_MESTO",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "BYDLISKO",
            //     columns: table => new
            //     {
            //         ID_BYDLISKA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_POUZIVATEL = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         ULICA = table.Column<string>(type: "VARCHAR2(100)", unicode: false, maxLength: 100, nullable: false),
            //         ADRESA_OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         ADRESA_DO = table.Column<DateTime>(type: "DATE", nullable: true),
            //         TRVALE = table.Column<string>(type: "CHAR(1)", unicode: false, fixedLength: true, maxLength: 1, nullable: false),
            //         ID_MESTO = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         PSC_BYDLISKO = table.Column<string>(type: "CHAR(5)", unicode: false, fixedLength: true, maxLength: 5, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_BYDLISKO", x => x.ID_BYDLISKA);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP103",
            //             column: x => x.ID_MESTO,
            //             principalTable: "MESTO",
            //             principalColumn: "ID_MESTO",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP29",
            //             column: x => x.ID_POUZIVATEL,
            //             principalTable: "POUZIVATEL",
            //             principalColumn: "ID_POUZIVATEL",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "FOTKA_POUZIVATEL",
            //     columns: table => new
            //     {
            //         ID_POUZIVATEL = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         FOTKA = table.Column<byte[]>(type: "BLOB", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_FOTKA_POUZIVATEL", x => x.ID_POUZIVATEL);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP55",
            //             column: x => x.ID_POUZIVATEL,
            //             principalTable: "POUZIVATEL",
            //             principalColumn: "ID_POUZIVATEL",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ZAP_CHOROBY",
            //     columns: table => new
            //     {
            //         ID_ZDRAVOTNA_KARTA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         CIS_CHOROBA = table.Column<string>(type: "CHAR(4)", unicode: false, fixedLength: true, maxLength: 4, nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         ID_VYSETRENIE = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ZAP_CHOROBY", x => new { x.CIS_CHOROBA, x.OD, x.ID_ZDRAVOTNA_KARTA });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP8",
            //             column: x => x.CIS_CHOROBA,
            //             principalTable: "CHOROBA",
            //             principalColumn: "CIS_CHOROBA",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "PRIZNAKY",
            //     columns: table => new
            //     {
            //         CIS_CHOROBA = table.Column<string>(type: "CHAR(4)", unicode: false, fixedLength: true, maxLength: 4, nullable: false),
            //         ID_ZDRAVOTNA_KARTA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_SYMPTOM = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_PRIZNAKY", x => new { x.CIS_CHOROBA, x.OD, x.ID_ZDRAVOTNA_KARTA, x.ID_SYMPTOM });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP68",
            //             columns: x => new { x.CIS_CHOROBA, x.OD, x.ID_ZDRAVOTNA_KARTA },
            //             principalTable: "ZAP_CHOROBY",
            //             principalColumns: new[] { "CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA" },
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP69",
            //             column: x => x.ID_SYMPTOM,
            //             principalTable: "TYP_SYMPTOM",
            //             principalColumn: "ID_SYMPTOM",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ATESTACIE_LEKAR",
            //     columns: table => new
            //     {
            //         ID_LEKAR = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_TYP = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_ATESTACIA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ATESTACIA_OD = table.Column<DateTime>(type: "DATE", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ATESTACIE_LEKAR", x => new { x.ID_ATESTACIA, x.ID_LEKAR, x.ID_TYP });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP63",
            //             column: x => x.ID_TYP,
            //             principalTable: "TYP_LEKARA",
            //             principalColumn: "ID_TYP",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ODDELENIE",
            //     columns: table => new
            //     {
            //         ID_ODDEL = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_NEM = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_PRIMAR = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         NAZOV_ODD = table.Column<string>(type: "VARCHAR2(200)", unicode: false, maxLength: 200, nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ODDELENIE", x => x.ID_ODDEL);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP49",
            //             column: x => x.ID_NEM,
            //             principalTable: "NEMOCNICA",
            //             principalColumn: "ID_NEM",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "LEKAR",
            //     columns: table => new
            //     {
            //         ID_LEKAR = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_POUZIVATEL = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_ODDEL = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_LEKAR", x => x.ID_LEKAR);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP16",
            //             column: x => x.ID_POUZIVATEL,
            //             principalTable: "POUZIVATEL",
            //             principalColumn: "ID_POUZIVATEL",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP51",
            //             column: x => x.ID_ODDEL,
            //             principalTable: "ODDELENIE",
            //             principalColumn: "ID_ODDEL",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "PACIENT",
            //     columns: table => new
            //     {
            //         ID_PACIENT = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_POUZIVATEL = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_VSEOBECNY_LEKAR = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_PACIENT", x => x.ID_PACIENT);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP10",
            //             column: x => x.ID_POUZIVATEL,
            //             principalTable: "POUZIVATEL",
            //             principalColumn: "ID_POUZIVATEL",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP33",
            //             column: x => x.ID_VSEOBECNY_LEKAR,
            //             principalTable: "LEKAR",
            //             principalColumn: "ID_LEKAR",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ZDRAV_POISTENIE",
            //     columns: table => new
            //     {
            //         ID_POISTOVNA = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_PACIENT = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ZDRAV_POISTENIE", x => new { x.ID_POISTOVNA, x.ID_PACIENT, x.OD });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP64",
            //             column: x => x.ID_POISTOVNA,
            //             principalTable: "POISTOVNA",
            //             principalColumn: "ID_POISTOVNA",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP65",
            //             column: x => x.ID_PACIENT,
            //             principalTable: "PACIENT",
            //             principalColumn: "ID_PACIENT",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ZDRAVOTNA_KARTA",
            //     columns: table => new
            //     {
            //         ID_PACIENT = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         KRV_SKUPINA = table.Column<string>(type: "VARCHAR2(3)", unicode: false, maxLength: 3, nullable: false),
            //         ID_MESTO_NARODENIA = table.Column<decimal>(type: "NUMBER(38)", nullable: false)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ZDRAVOTNA_KARTA", x => x.ID_PACIENT);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP105",
            //             column: x => x.ID_MESTO_NARODENIA,
            //             principalTable: "MESTO",
            //             principalColumn: "ID_MESTO",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP42",
            //             column: x => x.ID_PACIENT,
            //             principalTable: "PACIENT",
            //             principalColumn: "ID_PACIENT",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "VYK_VYSETRENIA",
            //     columns: table => new
            //     {
            //         ID_VYSETRENIE = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_PACIENT = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         ID_LEKAR = table.Column<decimal>(type: "NUMBER(38)", nullable: true),
            //         DATUM_VYS = table.Column<DateTime>(type: "DATE", nullable: false),
            //         VYSLEDOK = table.Column<string>(type: "VARCHAR2(150)", unicode: false, maxLength: 150, nullable: false),
            //         PRILOHA = table.Column<byte[]>(type: "BLOB", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_VYK_VYSETRENIA", x => x.ID_VYSETRENIE);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP23",
            //             column: x => x.ID_LEKAR,
            //             principalTable: "LEKAR",
            //             principalColumn: "ID_LEKAR",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP36",
            //             column: x => x.ID_PACIENT,
            //             principalTable: "ZDRAVOTNA_KARTA",
            //             principalColumn: "ID_PACIENT",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "ZDRAV_KARTA_POVOLENIA",
            //     columns: table => new
            //     {
            //         ID_LEKAR = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_PACIENT = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_ZDRAV_KARTA_POVOLENIA", x => new { x.OD, x.ID_LEKAR, x.ID_PACIENT });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP53",
            //             column: x => x.ID_PACIENT,
            //             principalTable: "ZDRAVOTNA_KARTA",
            //             principalColumn: "ID_PACIENT",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP54",
            //             column: x => x.ID_LEKAR,
            //             principalTable: "LEKAR",
            //             principalColumn: "ID_LEKAR",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "PREDP_LIECBA",
            //     columns: table => new
            //     {
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_VYSETRENIE = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         OD = table.Column<DateTime>(type: "DATE", nullable: false),
            //         DAVKOVANIE_POCET = table.Column<byte>(type: "NUMBER(3)", precision: 3, nullable: false),
            //         DO = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_PREDP_LIECBA", x => new { x.ID_LIEK, x.OD, x.ID_VYSETRENIE });
            //         table.ForeignKey(
            //             name: "RELATIONSHIP39",
            //             column: x => x.ID_VYSETRENIE,
            //             principalTable: "VYK_VYSETRENIA",
            //             principalColumn: "ID_VYSETRENIE",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP6",
            //             column: x => x.ID_LIEK,
            //             principalTable: "LIEK",
            //             principalColumn: "ID_LIEK",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateTable(
            //     name: "RECEPT",
            //     columns: table => new
            //     {
            //         ID_RECEPT = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_VYSETRENIE = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         ID_LIEK = table.Column<decimal>(type: "NUMBER(38)", nullable: false),
            //         BALENIE_KS = table.Column<byte>(type: "NUMBER(2)", precision: 2, nullable: false),
            //         VYSTAVENIE = table.Column<DateTime>(type: "DATE", nullable: false),
            //         CENA = table.Column<decimal>(type: "NUMBER(10,2)", nullable: true),
            //         VYBRANIE = table.Column<DateTime>(type: "DATE", nullable: true)
            //     },
            //     constraints: table =>
            //     {
            //         table.PrimaryKey("PK_RECEPT", x => x.ID_RECEPT);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP35",
            //             column: x => x.ID_VYSETRENIE,
            //             principalTable: "VYK_VYSETRENIA",
            //             principalColumn: "ID_VYSETRENIE",
            //             onDelete: ReferentialAction.Restrict);
            //         table.ForeignKey(
            //             name: "RELATIONSHIP41",
            //             column: x => x.ID_LIEK,
            //             principalTable: "LIEK",
            //             principalColumn: "ID_LIEK",
            //             onDelete: ReferentialAction.Restrict);
            //     });

            // migrationBuilder.CreateIndex(
            //     name: "IX_ATESTACIE_LEKAR_ID_LEKAR",
            //     table: "ATESTACIE_LEKAR",
            //     column: "ID_LEKAR");

            // migrationBuilder.CreateIndex(
            //     name: "IX_ATESTACIE_LEKAR_ID_TYP",
            //     table: "ATESTACIE_LEKAR",
            //     column: "ID_TYP");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP102",
            //     table: "BYDLISKO",
            //     column: "ID_MESTO");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP29",
            //     table: "BYDLISKO",
            //     column: "ID_POUZIVATEL");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP72",
            //     table: "L_BALENIE",
            //     column: "ID_LIEK");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP16",
            //     table: "LEKAR",
            //     column: "ID_POUZIVATEL");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP51",
            //     table: "LEKAR",
            //     column: "ID_ODDEL");

            // migrationBuilder.CreateIndex(
            //     name: "IX_LIEK_APLIKACIA_ID_OBLAST",
            //     table: "LIEK_APLIKACIA",
            //     column: "ID_OBLAST");

            // migrationBuilder.CreateIndex(
            //     name: "IX_LIEK_UCINNA_LATKA_ID_LATKA",
            //     table: "LIEK_UCINNA_LATKA",
            //     column: "ID_LATKA");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP70",
            //     table: "MESTO",
            //     column: "ID_OKRES");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP100",
            //     table: "NEMOCNICA",
            //     column: "ID_MESTO");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP49",
            //     table: "ODDELENIE",
            //     column: "ID_NEM");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP61",
            //     table: "ODDELENIE",
            //     column: "ID_PRIMAR");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP1",
            //     table: "OKRES",
            //     column: "ID_KRAJ");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP10",
            //     table: "PACIENT",
            //     column: "ID_POUZIVATEL");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP33",
            //     table: "PACIENT",
            //     column: "ID_VSEOBECNY_LEKAR");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP52",
            //     table: "POUZIVATEL",
            //     column: "ID_TYP");

            // migrationBuilder.CreateIndex(
            //     name: "IX_PREDP_LIECBA_ID_VYSETRENIE",
            //     table: "PREDP_LIECBA",
            //     column: "ID_VYSETRENIE");

            // migrationBuilder.CreateIndex(
            //     name: "IX_PRIZNAKY_ID_SYMPTOM",
            //     table: "PRIZNAKY",
            //     column: "ID_SYMPTOM");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP35",
            //     table: "RECEPT",
            //     column: "ID_VYSETRENIE");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP41",
            //     table: "RECEPT",
            //     column: "ID_LIEK");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP23",
            //     table: "VYK_VYSETRENIA",
            //     column: "ID_LEKAR");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP36",
            //     table: "VYK_VYSETRENIA",
            //     column: "ID_PACIENT");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP32",
            //     table: "ZAP_CHOROBY",
            //     column: "ID_VYSETRENIE");

            // migrationBuilder.CreateIndex(
            //     name: "IX_ZAP_CHOROBY_ID_ZDRAVOTNA_KARTA",
            //     table: "ZAP_CHOROBY",
            //     column: "ID_ZDRAVOTNA_KARTA");

            // migrationBuilder.CreateIndex(
            //     name: "IX_ZDRAV_KARTA_POVOLENIA_ID_LEKAR",
            //     table: "ZDRAV_KARTA_POVOLENIA",
            //     column: "ID_LEKAR");

            // migrationBuilder.CreateIndex(
            //     name: "IX_ZDRAV_KARTA_POVOLENIA_ID_PACIENT",
            //     table: "ZDRAV_KARTA_POVOLENIA",
            //     column: "ID_PACIENT");

            // migrationBuilder.CreateIndex(
            //     name: "IX_ZDRAV_POISTENIE_ID_PACIENT",
            //     table: "ZDRAV_POISTENIE",
            //     column: "ID_PACIENT");

            // migrationBuilder.CreateIndex(
            //     name: "IX_RELATIONSHIP104",
            //     table: "ZDRAVOTNA_KARTA",
            //     column: "ID_MESTO_NARODENIA");

            // migrationBuilder.AddForeignKey(
            //     name: "RELATIONSHIP32",
            //     table: "ZAP_CHOROBY",
            //     column: "ID_VYSETRENIE",
            //     principalTable: "VYK_VYSETRENIA",
            //     principalColumn: "ID_VYSETRENIE",
            //     onDelete: ReferentialAction.Restrict);

            // migrationBuilder.AddForeignKey(
            //     name: "RELATIONSHIP7",
            //     table: "ZAP_CHOROBY",
            //     column: "ID_ZDRAVOTNA_KARTA",
            //     principalTable: "ZDRAVOTNA_KARTA",
            //     principalColumn: "ID_PACIENT",
            //     onDelete: ReferentialAction.Restrict);

            // migrationBuilder.AddForeignKey(
            //     name: "RELATIONSHIP62",
            //     table: "ATESTACIE_LEKAR",
            //     column: "ID_LEKAR",
            //     principalTable: "LEKAR",
            //     principalColumn: "ID_LEKAR",
            //     onDelete: ReferentialAction.Restrict);

            // migrationBuilder.AddForeignKey(
            //     name: "RELATIONSHIP61",
            //     table: "ODDELENIE",
            //     column: "ID_PRIMAR",
            //     principalTable: "LEKAR",
            //     principalColumn: "ID_LEKAR",
            //     onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "RELATIONSHIP61",
                table: "ODDELENIE");

            migrationBuilder.DropTable(
                name: "ATESTACIE_LEKAR");

            migrationBuilder.DropTable(
                name: "BYDLISKO");

            migrationBuilder.DropTable(
                name: "FOTKA_POUZIVATEL");

            migrationBuilder.DropTable(
                name: "KRAJ");

            migrationBuilder.DropTable(
                name: "L_BALENIE");

            migrationBuilder.DropTable(
                name: "LIEK_APLIKACIA");

            migrationBuilder.DropTable(
                name: "LIEK_UCINNA_LATKA");

            migrationBuilder.DropTable(
                name: "PREDP_LIECBA");

            migrationBuilder.DropTable(
                name: "PRIZNAKY");

            migrationBuilder.DropTable(
                name: "RECEPT");

            migrationBuilder.DropTable(
                name: "ZDRAV_KARTA_POVOLENIA");

            migrationBuilder.DropTable(
                name: "ZDRAV_POISTENIE");

            migrationBuilder.DropTable(
                name: "TYP_LEKARA");

            migrationBuilder.DropTable(
                name: "OBLAST_URCENIA");

            migrationBuilder.DropTable(
                name: "UCINNA_LATKA");

            migrationBuilder.DropTable(
                name: "ZAP_CHOROBY");

            migrationBuilder.DropTable(
                name: "TYP_SYMPTOM");

            migrationBuilder.DropTable(
                name: "LIEK");

            migrationBuilder.DropTable(
                name: "POISTOVNA");

            migrationBuilder.DropTable(
                name: "VYK_VYSETRENIA");

            migrationBuilder.DropTable(
                name: "CHOROBA");

            migrationBuilder.DropTable(
                name: "ZDRAVOTNA_KARTA");

            migrationBuilder.DropTable(
                name: "PACIENT");

            migrationBuilder.DropTable(
                name: "LEKAR");

            migrationBuilder.DropTable(
                name: "POUZIVATEL");

            migrationBuilder.DropTable(
                name: "ODDELENIE");

            migrationBuilder.DropTable(
                name: "ROLA");

            migrationBuilder.DropTable(
                name: "NEMOCNICA");

            migrationBuilder.DropTable(
                name: "MESTO");

            migrationBuilder.DropTable(
                name: "OKRES");
        }
    }
}
