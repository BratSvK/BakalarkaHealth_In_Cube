--------------------------------------------------------
--  File created - Streda-okt�bra-20-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table __EFMigrationsHistory
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."__EFMigrationsHistory" 
   (	"MigrationId" NVARCHAR2(150), 
	"ProductVersion" NVARCHAR2(32)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ATESTACIE_LEKAR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ATESTACIE_LEKAR" 
   (	"ID_LEKAR" NUMBER(*,0), 
	"ID_TYP" NUMBER(*,0), 
	"ID_ATESTACIA" NUMBER(*,0), 
	"ATESTACIA_OD" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BYDLISKO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BYDLISKO" 
   (	"ID_BYDLISKA" NUMBER(*,0), 
	"ID_POUZIVATEL" NUMBER(*,0), 
	"ULICA" VARCHAR2(100 BYTE), 
	"ADRESA_OD" DATE, 
	"ADRESA_DO" DATE, 
	"TRVALE" CHAR(1 BYTE), 
	"ID_MESTO" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."BYDLISKO"."TRVALE" IS 'T-true 
F-false';
--------------------------------------------------------
--  DDL for Table FOTKA_POUZIVATEL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."FOTKA_POUZIVATEL" 
   (	"ID_POUZIVATEL" NUMBER(*,0), 
	"FOTKA" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("FOTKA") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table CHOROBA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CHOROBA" 
   (	"CIS_CHOROBA" CHAR(4 BYTE), 
	"NAZOV" VARCHAR2(255 BYTE), 
	"SK_OCHORENI" VARCHAR2(150 BYTE), 
	"OBM_VEK_OD" NUMBER(2,0), 
	"OBM_VEK_DO" NUMBER(2,0), 
	"OBM_POHLAVIE" CHAR(1 BYTE), 
	"VALID_OD" DATE, 
	"VALID_DO" DATE, 
	"DOPL_INFO_PATRI" VARCHAR2(320 BYTE), 
	"DOPL_INFO_NEPATRI" VARCHAR2(320 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."CHOROBA"."CIS_CHOROBA" IS 'A00-B99
Infek�n� a parazitov� choroby
A00- Cholera ';
--------------------------------------------------------
--  DDL for Table KRAJ
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KRAJ" 
   (	"ID_KRAJ" NUMBER(*,0), 
	"NAZOV" VARCHAR2(25 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table L_BALENIE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."L_BALENIE" 
   (	"KOD_BALENIA" CHAR(5 BYTE), 
	"ID_LIEK" NUMBER(*,0), 
	"SPOSOB_UHRADY" CHAR(1 BYTE), 
	"CENA" NUMBER(10,2), 
	"DOPLATOK" NUMBER(10,2), 
	"POCET_KS" NUMBER(3,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."L_BALENIE"."KOD_BALENIA" IS '00643';
--------------------------------------------------------
--  DDL for Table LEKAR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LEKAR" 
   (	"ID_LEKAR" NUMBER(*,0), 
	"ID_POUZIVATEL" NUMBER(*,0), 
	"ID_ODDEL" NUMBER(*,0), 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LIEK
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LIEK" 
   (	"ID_LIEK" NUMBER(*,0), 
	"NAZOV" VARCHAR2(255 BYTE), 
	"REZIM_VYDAJA" CHAR(2 BYTE), 
	"LIEK_FORMA" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LIEK_APLIKACIA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LIEK_APLIKACIA" 
   (	"ID_LIEK" NUMBER(*,0), 
	"ID_OBLAST" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LIEK_UCINNA_LATKA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LIEK_UCINNA_LATKA" 
   (	"ID_LIEK" NUMBER(*,0), 
	"ID_LATKA" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MESTO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MESTO" 
   (	"ID_OKRES" NUMBER(*,0), 
	"NAZOV" VARCHAR2(150 BYTE), 
	"ID_MESTO" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NEMOCNICA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."NEMOCNICA" 
   (	"ID_NEM" NUMBER(*,0), 
	"NAZOV" VARCHAR2(150 BYTE), 
	"MOBIL" VARCHAR2(12 BYTE), 
	"ULICA" VARCHAR2(50 BYTE) DEFAULT 100, 
	"URL_STRANKA" VARCHAR2(300 BYTE), 
	"ID_MESTO" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table OBLAST_URCENIA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."OBLAST_URCENIA" 
   (	"ID_OBLAST" NUMBER(*,0), 
	"NAZOV" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ODDELENIE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ODDELENIE" 
   (	"ID_ODDEL" NUMBER(*,0), 
	"ID_NEM" NUMBER(*,0), 
	"ID_PRIMAR" NUMBER(*,0), 
	"NAZOV_ODD" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table OKRES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."OKRES" 
   (	"ID_OKRES" NUMBER(*,0), 
	"ID_KRAJ" NUMBER(*,0), 
	"NAZOV" VARCHAR2(150 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PACIENT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PACIENT" 
   (	"ID_PACIENT" NUMBER(*,0), 
	"ID_POUZIVATEL" NUMBER(*,0), 
	"ID_VSEOBECNY_LEKAR" NUMBER(*,0), 
	"OD" DATE, 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POISTOVNA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."POISTOVNA" 
   (	"ID_POISTOVNA" NUMBER(*,0), 
	"NAZOV" VARCHAR2(50 BYTE), 
	"KONTAKT_MOBIL" VARCHAR2(12 BYTE), 
	"LOGO_URL" VARCHAR2(50 BYTE), 
	"ODKAZ_URL" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PREDP_LIECBA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PREDP_LIECBA" 
   (	"ID_LIEK" NUMBER(*,0), 
	"ID_VYSETRENIE" NUMBER(*,0), 
	"OD" DATE, 
	"DAVKOVANIE_POCET" NUMBER(3,0), 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."PREDP_LIECBA"."DAVKOVANIE_POCET" IS '101
rano,poobede,vecer ';
--------------------------------------------------------
--  DDL for Table PRIZNAKY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PRIZNAKY" 
   (	"CIS_CHOROBA" CHAR(4 BYTE), 
	"ID_ZDRAVOTNA_KARTA" NUMBER(*,0), 
	"ID_SYMPTOM" NUMBER(*,0), 
	"OD" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RECEPT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."RECEPT" 
   (	"ID_RECEPT" NUMBER(*,0), 
	"ID_VYSETRENIE" NUMBER(*,0), 
	"ID_LIEK" NUMBER(*,0), 
	"BALENIE_KS" NUMBER(2,0), 
	"VYSTAVENIE" DATE, 
	"CENA" NUMBER(10,2), 
	"VYBRANIE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RoleClaims
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."RoleClaims" 
   (	"Id" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"RoleId" NUMBER(38,0), 
	"ClaimType" NVARCHAR2(2000), 
	"ClaimValue" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table Roles
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."Roles" 
   (	"Id" NUMBER(38,0), 
	"Name" NVARCHAR2(2000), 
	"NormalizedName" NVARCHAR2(2000), 
	"ConcurrencyStamp" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SQLPLUS_PRODUCT_PROFILE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SQLPLUS_PRODUCT_PROFILE" SHARING=METADATA 
   (	"PRODUCT" VARCHAR2(30 BYTE), 
	"USERID" VARCHAR2(128 BYTE), 
	"ATTRIBUTE" VARCHAR2(240 BYTE), 
	"SCOPE" VARCHAR2(240 BYTE), 
	"NUMERIC_VALUE" NUMBER(15,2), 
	"CHAR_VALUE" VARCHAR2(240 BYTE), 
	"DATE_VALUE" DATE, 
	"LONG_VALUE" LONG
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TYP_LEKARA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TYP_LEKARA" 
   (	"ID_TYP" NUMBER(*,0), 
	"NAZOV" VARCHAR2(40 BYTE), 
	"POPIS" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TYP_SYMPTOM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TYP_SYMPTOM" 
   (	"ID_SYMPTOM" NUMBER(*,0), 
	"NAZOV" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UCINNA_LATKA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."UCINNA_LATKA" 
   (	"ID_LATKA" NUMBER(*,0), 
	"ID_LIEK" NUMBER(*,0), 
	"UCINNA_LATKA" VARCHAR2(30 BYTE), 
	"UCINNA_LATKA_GRAMAZ" NUMBER(6,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."UCINNA_LATKA"."UCINNA_LATKA_GRAMAZ" IS 'vsetko bude v mg';
--------------------------------------------------------
--  DDL for Table UserClaims
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."UserClaims" 
   (	"Id" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"UserId" NUMBER(38,0), 
	"ClaimType" NVARCHAR2(2000), 
	"ClaimValue" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UserLogins
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."UserLogins" 
   (	"UserId" NUMBER(38,0), 
	"LoginProvider" NVARCHAR2(2000), 
	"ProviderKey" NVARCHAR2(2000), 
	"ProviderDisplayName" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UserRoles
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."UserRoles" 
   (	"UserId" NUMBER(38,0), 
	"RoleId" NUMBER(38,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table Users
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."Users" 
   (	"Registrovany" TIMESTAMP (7), 
	"Meno" VARCHAR2(15 BYTE), 
	"Priezvisko" VARCHAR2(15 BYTE), 
	"RodPriezvisko" VARCHAR2(15 BYTE), 
	"RodCislo" CHAR(11 BYTE), 
	"DatNarodenia" DATE, 
	"Email" VARCHAR2(255 BYTE), 
	"Mobil" VARCHAR2(12 BYTE), 
	"PoslednePrihlasenie" TIMESTAMP (7), 
	"Pohlavie" CHAR(1 BYTE), 
	"Id" NUMBER(38,0) DEFAULT 0.0, 
	"AccessFailedCount" NUMBER(10,0) DEFAULT 0, 
	"ConcurrencyStamp" NVARCHAR2(2000), 
	"EmailConfirmed" NUMBER(1,0) DEFAULT 0, 
	"LockoutEnabled" NUMBER(1,0) DEFAULT 0, 
	"LockoutEnd" TIMESTAMP (7) WITH TIME ZONE, 
	"NormalizedEmail" NVARCHAR2(2000), 
	"NormalizedUserName" NVARCHAR2(2000), 
	"PhoneNumber" NVARCHAR2(2000), 
	"PhoneNumberConfirmed" NUMBER(1,0) DEFAULT 0, 
	"SecurityStamp" NVARCHAR2(2000), 
	"TwoFactorEnabled" NUMBER(1,0) DEFAULT 0, 
	"UserName" NVARCHAR2(100), 
	"PasswordHash" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."Users"."Pohlavie" IS 'M-muz
Z-zena';
--------------------------------------------------------
--  DDL for Table UserTokens
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."UserTokens" 
   (	"UserId" NUMBER(38,0), 
	"LoginProvider" NVARCHAR2(2000), 
	"Name" NVARCHAR2(2000), 
	"Value" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VYK_VYSETRENIA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."VYK_VYSETRENIA" 
   (	"ID_VYSETRENIE" NUMBER(*,0), 
	"ID_PACIENT" NUMBER(*,0), 
	"ID_LEKAR" NUMBER(*,0), 
	"DATUM_VYS" DATE, 
	"VYSLEDOK" VARCHAR2(150 BYTE), 
	"PRILOHA" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PRILOHA") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table ZAP_CHOROBY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZAP_CHOROBY" 
   (	"ID_ZDRAVOTNA_KARTA" NUMBER(*,0), 
	"CIS_CHOROBA" CHAR(4 BYTE), 
	"OD" DATE, 
	"ID_VYSETRENIE" NUMBER(*,0), 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ZDRAV_KARTA_POVOLENIA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" 
   (	"ID_LEKAR" NUMBER(*,0), 
	"ID_PACIENT" NUMBER(*,0), 
	"OD" DATE, 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."ZDRAV_KARTA_POVOLENIA"."DO" IS 'Vseobecny lekar -> pacientov lekar -> neobmedzeny pristup ku karte 
ostatni sa musi nastavit -> podla vybrania uzivatela ';
--------------------------------------------------------
--  DDL for Table ZDRAV_POISTENIE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZDRAV_POISTENIE" 
   (	"ID_POISTOVNA" NUMBER(*,0), 
	"ID_PACIENT" NUMBER(*,0), 
	"OD" DATE, 
	"DO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ZDRAVOTNA_KARTA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZDRAVOTNA_KARTA" 
   (	"ID_PACIENT" NUMBER(*,0), 
	"KRV_SKUPINA" VARCHAR2(3 BYTE), 
	"ID_MESTO_NARODENIA" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ZIADANKA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZIADANKA" 
   (	"ID_PACIENT" NUMBER(38,0), 
	"ID_LEKAR" NUMBER(38,0), 
	"VYTVORENA" DATE, 
	"AKCEPTOVANA" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM."__EFMigrationsHistory"
SET DEFINE OFF;
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211012101709_IdentityAdded','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211012090856_InitMigration','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211012091347_AlterTable','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211015095808_vitualCode','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211015122939_Ziadanka','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211017083027_REMOVE_PSC_BYDLISKO_from_BYDLISKO','5.0.10');
Insert into SYSTEM."__EFMigrationsHistory" ("MigrationId","ProductVersion") values ('20211017113839_addZiadankyToUser','5.0.10');
REM INSERTING into SYSTEM.ATESTACIE_LEKAR
SET DEFINE OFF;
Insert into SYSTEM.ATESTACIE_LEKAR (ID_LEKAR,ID_TYP,ID_ATESTACIA,ATESTACIA_OD) values ('1','66','1',to_date('13.10.21','DD.MM.RR'));
REM INSERTING into SYSTEM.BYDLISKO
SET DEFINE OFF;
Insert into SYSTEM.BYDLISKO (ID_BYDLISKA,ID_POUZIVATEL,ULICA,ADRESA_OD,ADRESA_DO,TRVALE,ID_MESTO) values ('1','3','Rado�a 631',to_date('17.10.21','DD.MM.RR'),null,'Y','2083');
REM INSERTING into SYSTEM.FOTKA_POUZIVATEL
SET DEFINE OFF;
Insert into SYSTEM.FOTKA_POUZIVATEL (ID_POUZIVATEL) values ('2');
REM INSERTING into SYSTEM.CHOROBA
SET DEFINE OFF;
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C520','Zhubn� n�dor po�vy','In� zhubn� n�dory �ensk�ch pohlavn�ch org�nov',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C530','Zhubn� n�dor kr�ka maternice','Zhubn� n�dory kr�ka maternice',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C540','Zhubn� n�dor tela maternice','Zhubn� n�dory in�ch a bli��ie neur�en�ch �ast� maternice',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C550','Zhubn� n�dor bli��ie neur�enej �asti maternice','Zhubn� n�dory in�ch a bli��ie neur�en�ch �ast� maternice',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C560','Zhubn� n�dor vaje�n�ka','In� zhubn� n�dory �ensk�ch pohlavn�ch org�nov',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C570','Zhubn� n�dor in�ch a bli��ie neur�en�ch �ensk�ch pohlavn�ch org�nov','In� zhubn� n�dory �ensk�ch pohlavn�ch org�nov',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C580','Zhubn� n�dor placenty','In� zhubn� n�dory �ensk�ch pohlavn�ch org�nov','12','55','Z',to_date('01.01.94','DD.MM.RR'),null,'Chorioepiteli�m, bli��ie neur�en�','De�truuj�ci chorioaden�m (D39.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C600','Zhubn� n�dor penisu','In� zhubn� n�dory mu�sk�ch pohlavn�ch org�nov',null,null,'M',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C610','Zhubn� n�dor prostaty','Zhubn� n�dory predstojnice (prostaty)','24','30','M',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C620','Zhubn� n�dor semenn�ka','In� zhubn� n�dory mu�sk�ch pohlavn�ch org�nov',null,null,'M',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C630','Zhubn� n�dor in�ch a bli��ie neur�en�ch mu�sk�ch pohlavn�ch org�nov','In� zhubn� n�dory mu�sk�ch pohlavn�ch org�nov',null,null,'M',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C640','Zhubn� n�dor obli�ky okrem obli�kovej panvi�ky','In� zhubn� n�dory mo�ov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor obli�kovej panvi�ky (C65), Zhubn� n�dor kalichov obli�kovej panvi�ky (C65)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C650','Zhubn� n�dor obli�kovej panvi�ky','In� zhubn� n�dory mo�ov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor spojenia obli�kovej panvi�ky a mo�ovodu',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C660','Zhubn� n�dor mo�ovodu','In� zhubn� n�dory mo�ov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor �stia mo�ovodu (C67.6)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C670','Zhubn� n�dor mo�ov�ho mech�ra','Zhubn� n�dory mo�ov�ho mech�ra',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C680','Zhubn� n�dor in�ch a bli��ie neur�en�ch mo�ov�ch org�nov','In� zhubn� n�dory mo�ov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor mo�ovopohlavn�ho syst�mu bez bli��ieho ur�enia');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C690','Zhubn� n�dor oka a o�n�ch adnexov','Zhubn� n�dory oka a jeho adnexov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor mihalnice (ko�e) (C43.1, C44.1), Zhubn� n�dor spojivov�ho tkaniva mihalnice (C49.0), Zhubn� n�dor o�n�ho nervu (C72.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C700','Zhubn� n�dor  mozgovomiechov�ch obalov','Zhubn� n�dory in�ch �ast� centr�lneho nervov�ho syst�mu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C710','Zhubn� n�dor mozgu','Zhubn� n�dory mozgu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor hlavov�ch nervov (C72.2 � C72.5), Zhubn� n�dor retrobulb�rneho tkaniva (C69.6)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C720','Zhubn� n�dor miechy, hlavov�ch nervov a in�ch �ast� centr�lnej nervovej s�stavy','Zhubn� n�dory in�ch �ast� centr�lneho nervov�ho syst�mu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor mozgov�ch plien (C70.-), Zhubn� n�dor perif�rnych nervov a auton�mnej nervovej s�stavy (C47.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C730','Zhubn� n�dor �t�tnej ��azy','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C740','Zhubn� n�dor nadobli�ky','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C750','Zhubn� n�dor in�ch �liaz s vn�torn�m vylu�ovan�m a bl�zkych �trukt�r','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor endokrinnej �asti pankreasu (C25.4), Zhubn� n�dor semenn�ka (C62.-), Zhubn� n�dor nadobli�ky (C74.-), Zhubn� n�dor vaje�n�ka (C56), Zhubn� n�dor �t�tnej ��azy (C73), Zhubn� n�dor t�musu (C37)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C760','Zhubn� n�dor na in�ch a nepresne ur�en�ch miestach','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C770','Sekund�rny a  bli��ie neur�en� zhubn� n�dor lymfatick�ch uzl�n','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor lymfatick�ch uzl�n ozna�en� ako prim�rny (C81 � 85, C96.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C780','Sekund�rny zhubn� n�dor d�chac�ch a tr�viacich org�nov','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C790','Sekund�rny zhubn� n�dor na in�ch a bli��ie neur�en�ch miestach','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C800','Zhubn� n�dor bez �dajov o mieste','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C810','Hodgkinov lymf�m','Hodgkinova choroba',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C820','Folikulov� lymf�m','Nehodgkinovsk� lymf�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Folikulov� lymf�m s dif�znymi oblas�ami alebo bez nich, Lymf�m zo zrel�ch T/NK-buniek (C84.-)',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C830','Nefolikulov� lymf�m','Nehodgkinovsk� lymf�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C840','Lymf�m zo zrel�ch T/NK-buniek','Nehodgkinovsk� lymf�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C850','In� a bli��ie neur�en� typ non-Hodgkinovho lymf�mu','Nehodgkinovsk� lymf�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Anaplastick� ve�kobunkov� lymf�m - ALK-negat�vny (C84.7), Anaplastick� ve�kobunkov� lymf�m - ALK-pozit�vny (C84.6)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C880','Zhubn� imunoproliferat�vna choroba','In� zhubn� n�dory lymfatick�ho, hematopoetick�ho a pr�buzn�ho tkaniva',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C900','Mnohopo�etn� myel�m a zhubn� n�dory z plazmatick�ch buniek','In� zhubn� n�dory lymfatick�ho, hematopoetick�ho a pr�buzn�ho tkaniva',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C910','Lymfocytov� leuk�mia','Leuk�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C920','Myeloick� leuk�mia','Leuk�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Leuk�mia:- Granulocytov� - Myelog�nna',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C930','Monocytov� leuk�mia','Leuk�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Monocytoidn� leuk�mia',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C940','In� leuk�mia z bli��ie ur�en�ch buniek','Leuk�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Leukemick� retikuloendoteli�za (C91.4-), Plazmocytov� leuk�mia (C90.1-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C950','Leuk�mia z bli��ie neur�en�ch buniek','Leuk�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C960','In� a bli��ie neur�en� zhubn� n�dor lymfatick�ho, krvotvorn�ho a pr�buzn�ho tkaniva','In� zhubn� n�dory lymfatick�ho, hematopoetick�ho a pr�buzn�ho tkaniva',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C970','Zhubn� n�dory mnohopo�etn� na viacer�ch nez�visl�ch prim�rnych miestach','Zhubn� n�dory in�ch bli��ie neur�en�ch sekund�rnych a mnohopo�etn�ch miest',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D000','Karcin�m in situ �stnej dutiny, pa�er�ka a �al�dka','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melanoma in situ (D03.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D010','Karcin�m in situ in�ch a bli��ie neur�en�ch tr�viacich org�nov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melanoma in situ (D03.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D020','Karcin�m in situ stredn�ho ucha a d�chacej s�stavy','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melanoma in situ (D03.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D030','Melan�m in situ','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M872 � M879 so stup�om malignity 2',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D040','Karcin�m ko�e in situ','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melanoma in situ (D03.-), Queyratovu erytropl�ziu penisu bez bli��ieho ur�enia (D07.4)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C010','Zhubn� n�dor kore�a jazyka','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Horn� (dorz�lna) strana kore�a jazyka, Bli��ie neur�en� nehybn� �as� jazyka, Zadn� tretina jazyka',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C020','Zhubn� n�dor in�ch a bli��ie neur�en�ch �ast� jazyka','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C030','Zhubn� n�dor �asna','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Alveol�rna sliznica (hrebe�), �asno','Zhubn� n�dory kost� a klbovej chrupky (C41.02 � C41.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C040','Zhubn� n�dor �stnej spodiny','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C050','Zhubn� n�dor podnebia','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C060','Zhubn� n�dor in�ch a bli��ie neur�en�ch �ast� �st','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C070','Zhubn� n�dor pr�u�nej ��azy','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C080','Zhubn� n�dor in�ch a bli��ie neur�en�ch ve�k�ch slinn�ch �liaz','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor mal�ch slinn�ch �liaz - ktor� s� zatrieden� pod�a ich anatomickej lokaliz�cie, Zhubn� n�dor mal�ch slinn�ch �liaz bez bli��ieho ur�enia (C06.9), Zhubn� n�dor pr�u�nej ��azy [glandula parotis] (C07)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C090','Zhubn� n�dor mandle','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor hltanovej mandle (tonzily) (C11.1), Zhubn� n�dor jazykovej mandle (tonzily) (C02.4)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C100','Zhubn� n�dor ofaryngu','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor mandle (tonzily) (C09.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C110','Zhubn� n�dor  nazofaryngu','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C120','Zhubn� n�dor recessus piriformis','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor fossa piriformis',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C130','Zhubn� n�dor hypofaryngu','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor recessus piriformis (C12)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C140','Zhubn� n�dor pery, �stnej dutiny a faryngu na inom a nepresne ur�enom mieste','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor �st, bli��ie neur�en� (C06.9)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C150','Zhubn� n�dor pa�er�ka','Zhubn� n�dory pa�er�ka',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C160','Zhubn� n�dor �al�dka','Zhubn� n�dory �al�dka',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C170','Zhubn� n�dor tenk�ho �reva','In� zhubn� n�dory tr�viacich org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C180','Zhubn� n�dor hrub�ho �reva','Zhubn� n�dory hrub�ho �reva',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C190','Zhubn� n�dor rektosigmoidov�ho spojenia hrub�ho �reva','Zhubn� n�dory rektosigmoid�lneho spojenia, rekta, anusu a an�lneho kan�la',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor hrub�ho �reva a rekta, Zhubn� n�dor spojenia rekta a colon sigmoideum',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C200','Zhubn� n�dor kone�n�ka','Zhubn� n�dory rektosigmoid�lneho spojenia, rekta, anusu a an�lneho kan�la',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor ampuly rekta',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C210','Zhubn� n�dor anusu a an�lneho kan�la','Zhubn� n�dory rektosigmoid�lneho spojenia, rekta, anusu a an�lneho kan�la',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C220','Zhubn� n�dor pe�ene a vn�trope�e�ov�ch �l�ov�ch ciest','Zhubn� n�dory pe�ene a vn�trope�e�ov�ch �l�ov�ch v�vodov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor �l�ov�ch ciest - bli��ie neur�en� (C24.9), Sekund�rny zhubn� n�dor pe�ene a vn�trope�e�ov�ch �l�ovodov (C78.7)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C230','Zhubn� n�dor �l�n�ka','In� zhubn� n�dory tr�viacich org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C240','Zhubn� n�dor in�ch a bli��ie neur�en�ch �ast� �l�ov�ch ciest','In� zhubn� n�dory tr�viacich org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Karcin�m vn�trope�e�ov�ch �l�ov�ch ciest (C22.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C250','Zhubn� n�dor pod�al�dkovej ��azy','Zhubn� n�dory pankreasu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C260','Zhubn� n�dor in�ch a nepresne ur�en�ch tr�viacich org�nov','In� zhubn� n�dory tr�viacich org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor pobru�nice a retroperitonea (C48.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C300','Zhubn� n�dor nosovej dutiny a stredn�ho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C310','Zhubn� n�dor prinosov�ch dut�n','In� zhubn� n�dory d�chac�ch a vn�trohrudn�kov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C320','Zhubn� n�dor hrtana','Zhubn� n�dory hrtana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C330','Zhubn� n�dor priedu�nice','Zhubn� n�dory priedu�nice, priedu�iek a p��c',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C340','Zhubn� n�dor priedu�iek a p��c','Zhubn� n�dory priedu�nice, priedu�iek a p��c',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C370','Zhubn� n�dor t�musu','In� zhubn� n�dory d�chac�ch a vn�trohrudn�kov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C380','Zhubn� n�dor srdca, medzihrudia (mediast�na) a pohrudnice','In� zhubn� n�dory d�chac�ch a vn�trohrudn�kov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Mezoteli�m (C45.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C390','Zhubn� n�dor in�ch a nepresne ur�en�ch miest d�chacej s�stavy a vn�trohrudn�kov�ch org�nov','In� zhubn� n�dory d�chac�ch a vn�trohrudn�kov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor bli��ie neur�enej �asti vn�trohrudn�ho priestoru (C76.1), Zhubn� n�dor bli��ie neur�enej �asti hrudn�ka (C76.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C400','Zhubn� n�dor kosti a k�bovej chrupky kon�at�n','Zhubn� n�dory kosti a k�bovej chrupky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C410','Zhubn� n�dor kosti a k�bovej chrupky na in�ch a bli��ie neur�en�ch miestach','Zhubn� n�dory kosti a k�bovej chrupky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor kosti kon�at�n (C40.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C430','Mal�gny melan�m ko�e','Mal�gny melan�m ko�e',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�dy M872 � M879 so stup�om malignity /3','Mal�gny melan�m ko�e pohlavn�ch org�nov (C51 � C52, C60.-, C63.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C440','In� zhubn� n�dor ko�e','In� zhubn� n�dory ko�e',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor: - potn�ch �liaz - mazov�ch �liaz','Mal�gny melan�m ko�e (C43.-), Zhubn� n�dor ko�e pohlavn�ch org�nov (C51 � C52, C60.-, C63.-), Kaposiho sark�m (C46.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C450','Mezoteli�m','Zhubn� n�dory mezotelu a m�kk�ch tkan�v',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M905 so stup�om malignity /3',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C460','Kaposiho sark�m','Zhubn� n�dory mezotelu a m�kk�ch tkan�v',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�dy M9140 so stup�om malignity /3',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C470','Zhubn� n�dor perif�rnych nervov a auton�mnej nervovej s�stavy','Zhubn� n�dory mezotelu a m�kk�ch tkan�',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor sympatikov�ch a parasympatikov�ch','Zhubn� n�dor mozgov�ch nervov (C72.2 � C72.5');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C480','Zhubn� n�dor retroperitonea a peritonea','Zhubn� n�dory mezotelu a m�kk�ch tkan�v',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Kaposiho sark�m (C46.1), Mezoteli�m (C45.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C490','Zhubn� n�dor in�ho spojivov�ho a m�kk�ho tkaniva','Zhubn� n�dory mezotelu a m�kk�ch tkan�v',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor krvnej cievy, Zhubn� n�dor burzy, Zhubn� n�dor fascie. Zhubn� n�dor tukov�ho tkaniva, Zhubn� n�dor chrupky, Zhubn� n�dor v�zov okrem v�zov maternice, Zhubn� n�dor lymfatickej cievy, Zhubn� n�dor svalu, Zhubn� n�dor ��achy (��achov�ho puzdra), Zhubn� n�dor synovi�lnej blany','Zhubn� n�dor spojivov�ho tkaniva prsn�ka (C50.-), Kaposiho sark�m (C46.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C500','Zhubn� n�dor prsn�ka','Zhubn� n�dory prsn�ka',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,'Zhubn� n�dor spojivov�ho tkaniva prsn�ka','Zhubn� n�dor ko�e prsn�ka (C43.5, C44.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C510','Zhubn� n�dor vulvy','In� zhubn� n�dory �ensk�ch pohlavn�ch org�nov',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B250','Cytomegalov�rusov� choroba','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Vroden� cytomegalov�rusov� choroba (P35.1), Mononukle�za zapr��inen� cytomegalov�rusom (B27.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B260','Mumps [Parotitis epidemica]','Mumps - parotitis epidemica',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infek�n� parotit�da, Epidemick� parotit�da',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B270','Infek�n� mononukle�za','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infek�n� mononukle�za, Monocytov� ang�na, Pfeifferova choroba �liaz',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B300','V�rusov� z�pal spojoviek','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Choroby oka - zapr��inen� herpetick�m v�rusom [herpes simplex] (B00.5) - pri herpes zoster (B02.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B330','In� v�rusov� choroba, nezatrieden� inde','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B340','V�rusov� infekcia bez bli��ieho ur�enia miesta','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Infekcia zapr��inen� herpetick�m v�rusom [herpes simplex], bli��ie neur�en� (B00.9), Infekcia zapr��inen� retrov�rusmi, bli��ie neur�en� (B33.3),V�rusy ako pr��ina chor�b, ktor� s� zatrieden� inde (B97),Cytomegalov�rusov� choroba, bli��ie neur�en� (B25.9)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B350','Dermatofyt�za [Tinea]','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Favus, Infekcie zapr��inen� epidermophyton - microsporum a trichophyton',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B360','In� povrchov� myk�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B370','Kandid�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Kandidov� myk�za, Monili�za','Kandid�za u novorodenca (P37.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B380','Kokcidioidomyk�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B390','Histoplazm�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B400','Blastomyk�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Juhoamerick� blastomyk�za (B41.-), Keloidov� blastomyk�za (B48.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B410','Parakokcidioidomyk�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Lutzova choroba, Juhoamerick� blastomyk�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B420','Sporotrich�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B430','Chromomyk�za a chromomykotick� absces','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B440','Aspergil�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Aspergil�m',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B450','Kryptokok�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B460','Zygomyk�za','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B470','Mycet�m','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B480','In� myk�za, nezatrieden� inde','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B490','Myk�za, bli��ie neur�en�','Myk�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Fung�mia, bli��ie neur�en�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B500','Mal�ria zapr��inen� Plasmodium falciparum','Mal�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zmie�an� infekcie zapr��inen�, Plasmodium falciparum s in�mi druhmi plazm�di�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B510','Mal�ria zapr��inen� Plasmodium vivax','Mal�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zmie�an� infekcie zapr��inen�, Plasmodium vivax s in�mi druhmi plazm�di� okrem Plasmodium falciparum','Ako zmie�an� infekcia s Plasmodium falciparum (B50.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B520','Mal�ria zapr��inen� Plasmodium malariae','Mal�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zmie�an� infekcie plasmodium malariae s in�mi druhmi plazm�di� okrem Plasmodium falciparum a Plasmodium vivax',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B530','In� parazitologicky potvrden� mal�ria','Mal�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B540','Mal�ria, bli��ie neur�en�','Mal�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Klinicky diagnostikovan� mal�ria bez parazitologick�ho potvrdenia',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B550','Lei�mani�za','Lei�mani�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B560','Africk� trypanozom�za','Trypanosom�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Spav� choroba',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B570','Chagasova choroba','Trypanosom�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Americk� trypanozom�za, Infekcia zapr��inen� Trypanosoma cruzi',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B580','Toxoplazm�za','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� Toxoplazma gondii','Vroden� toxoplazm�za (P37.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B590','Pneumocyst�za (J17.3*)','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Plazmocelul�rna interstici�lna pneum�nia',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B600','In� protozo�rna choroba, nezatrieden� inde','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Intestin�lna mikrosporidi�za (A07.8), Izospor�za (A07.3), Kryptosporidi�za (A07.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B640','Protozo�rna choroba, bli��ie neur�en�','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B650','Schistozom�za [Bilharzi�za]','Schistosom�za - bilharzi�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Slima�ia hor��ka (snail fever)',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B660','In� trematod�za','In� trematod�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B670','Echinokok�za','Hydatid�za - echinok�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Hydatid�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B680','Teni�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Cysticerk�za (B69.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B690','Cysticerk�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� larvami prasa�ej p�somnice',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B700','Difylobotri�za a spargan�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B710','In� infekcia ploch�mi �ervami','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B720','Drakunkul�za','Drakunkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� Dracunculus medinensis, Infekcia zapr��inen� quinejsk�m �ervom',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B730','Onchocerk�za','Onchocerk�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Rie�na slepota, Infekcia zapr��inen� Onchocerca volvulus, Onchocerk�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B740','Filari�za','Filari�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Onchocerk�za (B73), Tropick� (pulmon�lna) eozinof�lia, bli��ie neur�en� (J82)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B750','Trichinel�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� druhom Trichinela, Trichin�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B760','Ankylostom�za a nekator�za','Ankylostom�za a nekatori�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Uncinari�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B770','Askarid�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Askari�za, Askaridi�za, �krkavkov� infekcia',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B780','Strongyloid�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Trichostrongyl�za (B81.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B790','Trichurid�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'(infekcia)bi��kov�m �ervom, Trichocefali�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B800','Enterobi�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Hl�stov� infekcia, Infekcia zapr��inen� mr�ou detskou, Oxyuri�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B810','In� �revn� helmint�za, nezatrieden� inde','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Angiostrongyl�za zapr��inen� Angiostrongylus cantonensis (B83.2), Angiostrongyl�za zapr��inen� Parastrongylus cantonensis (B83.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B820','�revn� parazit�za, bli��ie neur�en�','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B830','In� helmint�za','In� helmint�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Kapilari�za - �revn� (B81.1) - bli��ie neur�en� (B81.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B850','Zav�ivenie [Pedikul�za a Ftiri�za]','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B860','Scabies','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Svrab',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B870','Myi�za','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Napadnutie mu��mi larvami',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B880','In� zamorenie','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B890','Parazitov� choroba, bli��ie neur�en�','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B900','N�sledky tuberkul�zy','N�sledky tuberkul�zy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B910','N�sledky poliomyelit�dy','N�sledky poliomyelit�dy','15','24','V',to_date('01.01.94','DD.MM.RR'),null,null,'Postpoliomyelitick� syndr�m (G14)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B920','N�sledky lepry','N�sledky lepry','24','30','V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B940','N�sledky in�ch a bli��ie neur�en�ch infek�n�ch a parazitov�ch chor�b','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B950','Streptokok a stafylokok ako pr��ina chor�b zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B960','In� bakt�re ako pr��ina chor�b zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B970','V�rus ako pr��ina chor�b zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B990','In� infek�n� choroba, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C000','Zhubn� n�dor pery','Zhubn� n�dory pery, �stnej dutiny a hltana',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Zhubn� n�dor ko�e pery (C43.0, C44.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A660','Framb�zia','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Framboesia (tropica), Pian, Yaws',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A670','Pinta [carate]','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A680','N�vratn� hor��ka','N�vratn� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Rekurentn� hor��ka','Lymsk� choroba (A69.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A690','In� infekcia zapr��inen� spiroch�tami','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A700','Infekcia zapr��inen� Chlamydia psittaci','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Ornit�za, Papag�ja choroba, Psitak�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A710','Trach�m','Trach�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'N�sledky trach�mu (B94.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A740','In� choroba zapr��inen� chlam�diami','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'pohlavne prenosn� choroby (A55 � A56), pneum�nia (J16.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A750','�kvrnit� t�fus','�kvrnit� t�fus - typhus exanthematicus',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Riketsi�za zapr��inen� Ehrlichia sennetsu (A79.8)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A760','Endemick� �kvrnit� t�fus (my��)','�kvrnit� t�fus',null,null,'V',to_date('01.01.04','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A770','�kvrnit� hor��ky [Riketsi�zy pren�an� klie��ami]','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A780','Q-hor��ka','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Balk�nska chr�pka, Infekcia zapr��inen� Rickettsia burnetii (Coxiela burnetii), Queryho hor��ka',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A790','In� riketsi�zy','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A800','Ak�tna poliomyelit�da','Ak�tna poliomyelit�da',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A810','Pomal� v�rusov� infekcia centr�lnej nervovej s�stavy','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Pri�nov� choroby centr�lnej nervovej s�stavy',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A820','Besnota [rabies, lyssa]','Besnota - rabies',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A830','V�rusov� encefalit�da, pren�an� kom�rmi','V�rusov� encefalit�da',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'V�rusov� meningoencefalit�da pren�an� kom�rmi','Venezuelsk� konsk� encefalit�da (A92.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A840','V�rusov� encefalit�da pren�an� klie��ami','V�rusov� encefalit�da',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'V�rusov� meningoencefalit�da pren�an� klie��ami',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A850','In� v�rusov� encefalit�da, nezatrieden� inde','V�rusov� encefalit�da',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'V�rusov� meningoencefalit�da zapr��inen� bli��ie ur�en�mi v�rusmi','Ben�gna myalgick� encefalomyelit�da (G93.3), Lymfocytov� choriomeningit�da (A87.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A860','V�rusov� encefalit�da, bli��ie neur�en�','V�rusov� encefalit�da',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'V�rusov� encefalomyelit�da, bli��ie neur�en�, V�rusov� meningoencefalit�da, bli��ie neur�en�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A870','V�rusov� meningit�da','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Menigit�da - herpetick�m v�rusom [herpes simplex] (B00.3) -  v�rusom os�pok (B05.1) - v�rusom parotit�dy (B26.1) ');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A880','In� v�rusov� infekcia centr�lnej nervovej s�stavy, nezatrieden� inde','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'V�rusov� encefalit�da, bli��ie neur�en� (A86), V�rusov� meningit�da, bli��ie neur�en� (A87.9)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A890','V�rusov� infekcia centr�lnej nervovej s�stavy, bli��ie neur�en�','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A900','Hor��ka dengue [klasick� dengue]','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Hemoragick� hor��ka dengue (A91)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A910','Hemoragick� hor��ka dengue','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A920','In� v�rusov� hor��ka pren�an� kom�rmi','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Choroba Ross River (B33.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A930','In� v�rusov� hor��ka pren�an� �l�nkono�cami, nezatrieden� inde','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A940','V�rusov� hor��ka pren�an� �l�nkono�cami, bli��ie neur�en�','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Arbov�rusov� infekcia, bli��ie neur�en�, Arbov�rusov� choroba, bli��ie neur�en�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A950','�lt� zimnica','�lt� zimnica',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A960','Arenav�rusov� hemoragick� hor��ka','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A980','In� v�rusov� hemoragick� hor��ka, nezatrieden� inde','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Hemoragick� hor��ka Chikungunya (A92.0), Hemoragick� hor��ka dengue (A91)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A990','V�rusov� hemoragick� hor��ka, bli��ie neur�en�','In� v�rusov� hor��ky a v�rusov� hemoragick� hor��ky',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B000','Infekcia herpetick�m v�rusom [Herpes simplex]','Infekcie herpesov�mi v�rusmi pren�an� �l�nkono�cami',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Vroden� infekcia zapr��inen� herpetick�mi v�rusmi (P35.2) ,Herpang�na (B08.5), Infekcie anogenit�lnej oblasti zapr��inen� herpetick�mi v�rusmi (A60.-), Mononukle�za zapr��inen� gama herpetick�mi v�rusmi (B27.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B010','Ov�ie kiahne [Varicella]','Ov�ie kiahne - varicella',null,null,null,to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B020','P�sov� opar  [Herpes zoster, Zoster]','Ov�ie kiahne - varicella',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Herpes zoster, P�sov� opar',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B030','Kiahne [Variola]','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B040','Opi�ie kiahne','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B050','Os�pky [Morbilli]','Os�pky - morbilli',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morbilli','Subak�tna sklerotizuj�ca panencefalit�da (A81.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B060','Ru�ienka  [Rubeola]','Ru�ienka - rubeola',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Vroden� ru�ienka (P35.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B070','V�rusov� bradavice [Verrucae]','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Verruca - simplex - vulgaris ',' Anogenit�lne (venerick�) bradavice (A63.0), Papil�m -  hrtana (D14.1) - mo�ov�ho mech�ra (D41.4) - kr�ka maternice (D26.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B080','In� v�rusov� infekcie charakterizovan� postihnut�m ko�e a slizn�c, nezatrieden� inde','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B090','V�rusov� infekcia charakterizovan� postihnut�m ko�e a slizn�c, bli��ie neur�en�','In� v�rusov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'V�rusov� enant�m, bli��ie neur�en�, V�rusov� exant�m, bli��ie neur�en�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B150','Ak�tna hepatit�da A','In� v�rusov� hepatit�dy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B160','Ak�tna hepatit�da B','Ak�tna hepatit�da B',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B170','In� ak�tna v�rusov� hepatit�da','In� v�rusov� hepatit�dy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B180','Chronick� v�rusov� hepatit�da','In� v�rusov� hepatit�dy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B190','V�rusov� hepatit�da, bli��ie neur�en�','In� v�rusov� hepatit�dy',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B200','Choroba HIV s n�sledn�mi infek�n�mi a parazitov�mi chorobami','Choroba vyvolan� v�rusom �udskej imunitnej nedostato�nosti [HIV]',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Ak�tny infek�n� syndr�m HIV (B23.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B210','Choroba HIV s n�sledn�mi zhubn�mi n�dormi','Choroba vyvolan� v�rusom �udskej imunitnej nedostato�nosti [HIV]',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B220','Choroba HIV s in�mi n�sledn�mi chorobami, bli��ie ur�en�mi','Choroba vyvolan� v�rusom �udskej imunitnej nedostato�nosti [HIV]',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B230','Choroba HIV s in�mi n�sledn�mi stavmi','Choroba vyvolan� v�rusom �udskej imunitnej nedostato�nosti [HIV]',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B240','Choroba HIV, bli��ie neur�en�','Choroba vyvolan� v�rusom �udskej imunitnej nedostato�nosti [HIV]',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'AIDS-related complex [ARC], bli��ie neur�en�, Z�skan� syndr�m imunitnej nedostato�nosti [AIDS]',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A400','Streptokokov� sepsa','Septik�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Streptokokov� sepsa u novorodenca (P36.0 � P36.1), Puerper�lna streptokokov� sepsa (O85), Streptokokov� sepsa po�as p�rodu (O75.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A410','In� sepsa','Septik�mia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Bli��ie neur�en� bakt�riov� infekcia bez bli��ieho ur�enia miesta (A49.9), Syndr�m toxick�ho �oku (A48.3), Sepsa aktinomykotick�');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A420','Aktinomyk�za','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Aktinomycet�m (B47.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A430','Nokardi�za','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A440','Bartonel�za','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A460','Eryzipel [Erysipelas, Ru�a]','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Postpart�lny alebo puerper�lny eryzipel (O86.8)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A480','In� bakt�riov� choroba, nezatrieden� inde','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Aktinomycet�m (B47.1)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A490','Bakt�riov� infekcia bez bli��ieho ur�enia miesta','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Bakt�rie ako pr��ina chor�b uveden�ch v in�ch kapitol�ch (B95 � B96), Chlam�diov� infekcia, bli��ie neur�en� (A74.9), Meningokokov� infekcia, bli��ie neur�en� (A39.9), Riketsiov� infekcia, bli��ie neur�en� (A79.9), Spiroch�tov� infekcia, bli��ie neur�en� (A69.9)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A500','Vroden� syfilis [Lues congenita]','Vroden� syfilis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A510','V�asn� syfilis','V�asn� syfilis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A520','Neskor� syfilis','In� syfilis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A530','In� a bli��ie neur�en� syfilis','In� syfilis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A540','Gonokokov� infekcia','Gonokokov� infekcie',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A550','Lymphogranuloma venereum (chlam�diov�)','Sexu�lne prenosn� chlam�diov� choroby','15','24','V',to_date('01.01.94','DD.MM.RR'),null,'Durandova-Nicolasova-Favreova choroba, Esthiomene, Lymphogranuloma inguinale, Klimatick� alebo tropick� bubo',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A560','In� pohlavne prenosn� chlam�diov� choroba','Sexu�lne prenosn� chlam�diov� choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Choroby s pohlavn�m prenosom zapr��inen�, Chlamydia trachomatis','Chlam�diov� konjunktivit�da novorodenca');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A570','M�kk� vred [ulcus molle]','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu','15','24','V',to_date('01.01.94','DD.MM.RR'),null,'Chancroid',' ');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A580','Granuloma venereum (inguinale)','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu','15','24','V',to_date('01.01.94','DD.MM.RR'),null,'Donovan�za',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A590','Trichomon�za','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'�revn� trichomon�za (A07.8)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A600','Anogenit�lna infekcia herpetick�m v�rusom [Herpes simplex]','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A630','In� preva�ne pohlavne prenosn� choroba, nezatrieden� inde','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A640','Pohlavne prenosn� choroba, bli��ie neur�en�','In� infekcie s preva�ne sexu�lnym sp�sobom prenosu','15','24','V',to_date('01.01.94','DD.MM.RR'),null,'Pohlavn� choroby, bli��ie neur�en�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A650','Nevenerick� syfilis','In� infek�n� a parazit�rne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Bejel, Endemick� syfilis, Njovera',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A000','Cholera','Cholera',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A010','Bru�n� t�fus a parat�fus','Bru�n� t�fus a parat�fus',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A020','In� salmonelov� infekcie','In� �revn� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infek�n� enetrit�da zapr��inen� salmonelou',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A030','�igel�za [bakt�riov� �ervienka, dyzent�ria]','Bacilov� �ervienka (dyzent�ria)',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A040','In� bakt�riov� �revn� infekcie','In� �revn� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Potravinov� otrava zatrieden� inde (A05.-), Tuberkul�zna enterit�da (A18.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A050','In� bakt�riov� potravinov� otrava','In� �revn� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Infekcia zapr��inen� Escherichia coli (A04.0 � A04.4),Infekcia alebo potravinov� oprava zapr��inen� salmonelou (A02.-), Infekcia alebo potravinov� oprava zapr��inen� Clostridium difficile (A04.7),Listeri�za (A32.-), Toxick� ��inok �kodliv�ch (pokazen�ch) potrav�n (T61 � T62)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A060','Am�bov� �ervienka - ameb�za','Am�bov� �ervienka - amebi�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� Entamoeba histolytica','In� �revn� choroby zapr��inen� protozoami (A07.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A070','In� protozo�rne �revn� choroby','In� �revn� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A080','V�rusov�  a in�, bli��ie ur�en� �revn� infekcie','In� �revn� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Chr�pka s postihnut�m tr�viacej trubice (J09, J10.8, J11.8)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A090','In� gastroenterit�da a kolit�da infek�n�ho a bli��ie neur�en�ho p�vodu','Hna�ka a gastroenterit�da pravdepodobne infek�n�ho p�vodu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'In� kolit�da zapr��inen� bakt�riami - protozoami - v�rusmi a in�mi bli��ie ur�en�mi infek�n�mi patog�nmi (A00 � A08), Neinfek�n� hna�ka (K52.9),Neinfek�n� hna�ka u novorodenca (P78.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A150','Tuberkul�za d�chacej s�stavy bakteriologicky, molekulovobiologicky alebo histologicky potvrden�','Respira�n� tuberkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A160','Tuberkul�za d�chacej s�stavy nepotvrden� bakteriologicky, molekulovobiologicky alebo histologicky','Respira�n� tuberkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A170','Tuberkul�za nervovej s�stavy','In� tuberkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A180','Tuberkul�za in�ch org�nov','In� tuberkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A190','Mili�rna tuberkul�za','In� tuberkul�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Tuberkul�zna polyserozit�da, Tuberkul�za diseminovan�,Tuberkul�za generalizovan�',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A200','Mor','Mor - pestis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcie zapr��inen� Yersinia pestis',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A210','Tular�mia','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Zaja�� mor, Tular�mia, Infekcia - zapr��inen� Franciscella tularensis',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A220','Antrax','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� Bacillus antracis',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A230','Brucel�za','Brucel�za',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Maltsk� hor��ka, Stredozemn� hor��ka, Unduluj�ca hor��ka',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A240','Sop�avka [malleus] a melioid�za [pseudomalleus]','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A250','Hor��ka po uhryznut� potkanom','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A260','Eryzipeloid','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A270','Leptospir�za','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A280','In� bakt�riov� zoon�za, nezatrieden� inde','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A300','Lepra [malomocenstvo, Hansenova choroba]','Lepra',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Infekcia zapr��inen� Mycobacterium leprae','N�sledky lepry (B92)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A310','Infekcia zapr��inen� inou mykobakt�riou','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Lepra (A30.-), Tuberkul�za (A15 � A19)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A320','Listeri�za','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Potravinov� infekcia zapr��inen� list�riou','Listeri�za novorodenca (diseminovan�) (P37.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A330','Tetanus novorodencov','Tetanus novorodencov','0','1','D',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A340','Tetanus po�as gravidity, p�rodu a v �estonedel�','In� tetanus - st�pnutos�','12','55','Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A350','In� tetanus','In� tetanus - st�pnutos�',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Tetanus, bli��ie neur�en�','Tetanus neonatorum (A33), Tetanus v gravidite, po�as p�rodu a v �estonedel� (A34)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A360','Dift�ria  [ Z�krt ]','Dift�ria',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A370','Pertussis  [�ierny ka�e�, Div� ka�e�]','Div� ka�e� - pertussis',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A380','Scarlatina [�arlach]','In� bakteri�lne choroby',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Streptokokov� z�pal hltana (J02.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('A390','Meningokokov� infekcia','Meningokokov� infekcia',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z590','Probl�my s�visiace s b�van�m alebo ekonomickou situ�ciou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z600','Probl�my s�visiace so soci�lnym prostred�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z610','Probl�my s�visiace s negat�vnymi udalos�ami v detstve',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z620','In� probl�my s�visiace s v�chovou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z630','In� probl�my s�visiace so skupinou prim�rnej starostlivosti vr�tane rodinnej situ�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z640','Probl�my s�visiace s ur�it�mi psychosoci�lnymi okolnos�ami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z650','Probl�my s�visiace s in�mi psychosoci�lnymi okolnos�ami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z700','Poradenstvo s�visiace so vz�ahom k sexualite, sexu�lnym spr�van�m a orient�ciou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z710','Osoby, ktor� vyh�adali zdravotn�cke slu�by kv�li in�mu poradenstvu, nezatrieden�mu inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z720','Probl�my s�visiace so sp�sobom �ivota',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z730','Probl�my s�visiace s �a�kos�ami so zvl�dnut�m �ivota',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z740','Probl�my s�visiace so z�vislos�ou od opatrovate�a',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z750','Probl�my s�visiace so zdravotn�ckymi zariadeniami a inou zdravotnou starostlivos�ou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z760','Osoba, ktor� nav�t�vila zdravotn�cke slu�by za in�ch okolnost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z800','Zhubn� n�dor v rodinnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z810','Poruchy psychiky a spr�vania v rodinnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z820','Niektor� postihnutia a chronick� choroby ved�ce k invalidite v rodinnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z830','In� ur�en� choroby v rodinnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z840','In� choroby v rodinnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z850','Zhubn� n�dor v osobnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z860','Niektor� in� choroby v osobnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z870','In� choroby a stavy v osobnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z880','Alergia na lie�iv�, lieky a biologick� l�tky v osobnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z890','Z�skan� ch�banie kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z900','Z�skan� ch�banie org�nov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z910','Rizikov� faktory v osobnej anamn�ze, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z920','Predch�dzaj�ca lie�ba v osobnej anamn�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z930','Stav s predt�m umelo vytvoren�m vy�sten�m (st�miou)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z940','Stav po transplant�cii org�nu a tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z950','Stav po implant�cii srdcov�ho alebo cievneho implant�tu alebo �tepu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z960','Stav po implant�cii in�ch funk�n�ch implant�tov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z970','Stav po implant�cii in�ch zdravotn�ch pom�cok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z980','In� poopera�n� stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z990','Dlhodob� z�vislos� od pomocn�ch pr�strojov alebo pom�cok, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W460','Kontakt s injek�nou ihlou',null,null,null,'V',to_date('01.01.19','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('U070','Potvrden� Infekcia/Podozrenie z Infekcie COVID-19',null,null,null,'V',to_date('01.01.20','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y650','In� po�kodenia po�as lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y660','Neposkytnutie lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y690','Po�kodenie po�as lek�rskej starostlivosti, (bli��ie neur�en�)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y700','Nepriazniv� pr�hody s�visiace s pou�it�m anestetick�ch pr�strojov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y710','Nepriazniv� pr�hody s�visiace s pou�it�m srdcovocievnych pr�strojov (pom�cok)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y720','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v otorinolaryngol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y730','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v gastroenterol�gii a v urol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y740','Nepriazniv� pr�hody s�visiace so zariadeniami a pom�ckami na v�eobecn� nemocni�n� a osobn� pou�itie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y750','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v neurol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y760','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v gynekol�gii a p�rodn�ctve',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y770','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v oftalmol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y780','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v r�diol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y790','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok v ortop�dii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y800','Nepriazniv� pr�hody s�visiace s pou�it�m pom�cok pri fyzik�lnej lie�be',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y810','Nepriazniv� pr�hody s�visiace s pou�it�m zariaden� a pom�cok vo v�eobecnej a plastickej chirurgii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y820','Nepriazniv� pr�hody s�visiace s pou�it�m in�ch a bli��ie neur�en�ch lek�rskych pom�cok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y830','Chirurgick� v�kon ako pr��ina abnorm�lnej reakcie pacienta alebo neskor�ej komplik�cie, bez  nehody v �ase v�konu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y840','In� lek�rsky v�kon ako pr��ina abnorm�lnej reakcie pacienta alebo neskor�ej komplik�cie, bez  nehody v �ase v�konu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y850','Neskor� n�sledky dopravn�ch neh�d',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y860','Neskor� n�sledky in�ch neh�d',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y870','Neskor� n�sledky �myseln�ho sebapo�kodenia, napadnutia a udalost� s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y880','Neskor� n�sledky chirurgickej a inej lek�rskej starostlivosti ako vonkaj�ej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y890','Neskor� n�sledky in�ch vonkaj��ch pr��in',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y900','D�kaz vplyvu alkoholu pod�a koncentr�cie alkoholu v krvi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y910','D�kaz vplyvu alkoholu pod�a stup�a intoxik�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y950','Nozokomi�lna choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y960','Choroba z povolania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y970','Choroba s�visiaca so zne�isten�m �ivotn�m prostred�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y980','Choroba s�visiaca so sp�sobom �ivota',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('B980','In� infek�n� p�vodca, bli��ie ur�en�, ako pr��ina chor�b zatrieden�ch inde',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('C860','In� lymf�m z T/NK-buniek, bli��ie ur�en�',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D900','Imunodeficit po o�iaren�, po chemoterapii a po in�ch imunosupres�vnych v�konoch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F740','Disoci�cia inteligencie',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G140','Postpoliomyelitick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K640','Hemoroidy a perian�lna �ilov� tromb�za',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O090','Trvanie gravidity',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O940','N�sledky komplik�ci� gravidity, p�rodu a �estonedelia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R650','Syndr�m syst�movej z�palovej odpovede  [SIRS]',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T890','In� komplik�cia �razu, bli��ie ur�en�',null,null,null,'V',to_date('01.01.16','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z000','V�eobecn� vy�etrenie a prehliadka os�b bez �a�kost� a bez uvedenej diagn�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z010','�peci�lne vy�etrenie a prehliadka os�b bez �a�kost� a bez uvedenej diagn�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z020','Vy�etrenie a n�v�teva na administrat�vne ��ely',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z030','Lek�rske pozorovanie a vy�etrenie pre podozrenie z choroby a chorobn�ho stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z040','Vy�etrenie a pozorovanie pre in� pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z080','Sledovanie po lie�be zhubn�ho n�doru',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z090','Sledovanie po lie�be inej choroby ako zhubn�ho n�doru',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z100','Rutinn� v�eobecn� zdravotn� kontrola definovanej skupiny obyvate�stva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z110','�peci�lne skr�ningov� vy�etrenie, zameran� na infek�n� a parazitov� choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z120','�peci�lne skr�ningov� vy�etrenie, zameran� na n�dorov� choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z130','�peci�lne skr�ningov� vy�etrenie, zameran� na in� choroby a poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z200','Kontakt a vystavenie prenosn�m chorob�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z210','Bezpr�znakov� stav infekcie HIV (v�rusom �udsk�ho imunodeficitu)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z220','Nosi�stvo p�vodcu infek�nej choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z230','Potreba imuniz�cie proti jednotliv�m bakt�riov�m chorob�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z240','Potreba imuniz�cie proti ur�it�m jednotliv�m v�rusov�m chorob�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z250','Potreba imuniz�cie proti in�m jednotliv�m v�rusov�m chorob�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z260','Potreba imuniz�cie proti in�m jednotliv�m infek�n�m chorob�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z270','Potreba imuniz�cie proti kombin�cii infek�n�ch chor�b',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z280','Nevykonan� imuniz�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z290','Potreba in�ch prevent�vnych postupov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z300','Riadenie antikoncepcie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z310','Vy�etrenie a lie�enie por�ch fertility',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z320','Vy�etrenie a testy, zameran� na zistenie gravidity',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z330','Gravidita ako ved�aj�� n�lez',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z340','Doh�ad nad priebehom norm�lnej gravidity',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z350','Doh�ad nad priebehom rizikovej gravidity',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z360','Prenat�lny skr�ning',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z370','V�sledok p�rodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z380','�ivonaroden� deti pod�a miesta narodenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z390','Pop�rodn� starostlivos� a vy�etrenie matky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z400','Profylaktick� chirurgick� v�kon',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z410','V�kony z in�ch d�vodov ako zo zdravotnej indik�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z420','N�sledn� starostlivos� v plastickej chirurgii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z430','O�etrovanie umelo vytvoren�ch telesn�ch otvorov (st�mii)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z440','Sk��anie a prisp�sobovanie vonkaj�ej protetickej pom�cky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z450','Prisp�sobovanie a �dr�ba implantovanej pom�cky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z460','Sk��anie a prisp�sobovanie in�ho pr�stroja alebo zdravotn�ckej pom�cky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z470','In� n�sledn� ortopedick� starostlivos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z480','In� n�sledn� chirurgick� starostlivos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z490','Starostlivos� pri dial�ze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z500','Starostlivos� s pou�it�m rehabilita�n�ch v�konov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z510','In� zdravotn� starostlivos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z520','Darcovia org�nov a tkan�v',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z530','Osoby, ktor� nav�t�vili zdravotn�cke slu�by kv�li ur�it�m neuskuto�nen�m v�konom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z540','Rekonvalescencia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z550','Probl�my s�visiace so vzdel�van�m a gramotnos�ou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z560','Probl�my s�visiace so zamestnan�m a nezamestnanos�ou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z570','Profesion�lne vystavenie rizikov�m faktorom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Z580','Probl�my s�visiace so �ivotn�m prostred�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X940','Napadnutie v�strelom z gu�ovnice, brokovnice a dlhej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X950','Napadnutie v�strelom z inej a bli��ie neur�enej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X960','Napadnutie v�bu�n�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X970','Napadnutie dymom, po�iarom a plame�mi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X980','Napadnutie parou, hor�cimi v�parmi a hor�cimi predmetmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X990','Napadnutie ostr�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y000','Napadnutie tup�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y010','Napadnutie zhoden�m z v��ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y020','Napadnutie soten�m alebo umiestnen�m obete pred pohybuj�ci sa predmet',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y030','Napadnutie z�mern�m havarovan�m s motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y040','Napadnutie s pou�it�m fyzickej sily',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y050','Sexu�lne napadnutie s pou�it�m fyzickej sily',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y060','Zanedbanie starostlivosti a opustenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y070','In� syndr�m t�rania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y080','Napadnutie in�m bli��ie ur�en�m sp�sobom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y090','N�siln� �tok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y100','Otrava a priotr�venie neopioidov�mi analgetikami, antipyretikami a antireumatikami a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y110','Otrava antiepileptikami, sedat�vami, hypnotikami, antiparkinsonikami a psychotropn�mi liekmi, nezatrieden�mi inde, a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y120','Otrava opioidov�mi analgetikami a halucinog�nmi (psychodysleptikami), nezatrieden� inde, a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y130','Otrava in�mi liekmi, ��inkuj�cimi na auton�mnu nervov� s�stavu a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y140','Otrava in�mi a bli��ie neur�en�mi lie�ivami, liekmi a biologick�mi l�tkami a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y150','Otrava alkoholom a vystavenie (expoz�cia) alkoholu, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y160','Otrava organick�mi rozp���adlami, halog�novan�mi uh�ovod�kmi a ich v�parmi a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y170','Otrava in�mi plynmi a v�parmi a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y180','Otrava pestic�dmi a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y190','Otrava in�mi a bli��ie neur�en�mi chemik�liami a �kodliv�mi l�tkami a vystavenie t�mto l�tkam, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y200','Obesenie, za�krtenie a udusenie, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y210','Utopenie a topenie, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y220','Z�sah v�strelom z ru�nej zbrane, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y230','Z�sah v�strelom z pu�ky (gu�ovnice), brokovnice a dlhej strelnej zbrane, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y240','Z�sah v�strelom z inej a bli��ie neur�enej strelnej zbrane, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y250','Kontakt s v�bu�nou l�tkou, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y260','Vystavenie dymu, po�iaru a plame�om, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y270','Kontakt s parou, hor�cimi v�parmi a hor�cimi predmetmi, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y280','Kontakt s ostr�m predmetom, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y290','Kontakt s tup�m predmetom, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y300','P�d, skok alebo sotenie z v��ky s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y310','P�d, �ahnutie si alebo vbehnutie pred pohybuj�ci sa predmet alebo do neho, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y320','Nehoda motorov�ho vozidla, s neur�en�m �myslom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y330','In� udalos� s neur�en�m �myslom, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y340','Udalos� s neur�en�m �myslom, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y350','Poranenia pri z�konnom z�sahu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y360','Poranenia pri vojnovej oper�cii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y400','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: celkovo ��inkuj�ce antibiotik�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y410','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: in� celkovo ��inkuj�ce protiinfek�n� a antiparazitov� lieky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y420','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: horm�ny, ich syntetick� n�hrady a antagonisti, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y430','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky s prim�rne celkov�m ��inkom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y440','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky s prim�rnym ��inkom na zlo�ky krvi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y450','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: analgetik�, antipyretik� a protiz�palov� lieky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y460','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: antiepileptik� a antiparkinsonik�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y470','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: sedat�va, hypnotik� a anxiolytik�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y480','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: anestetik� a lie�ebn� plyny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y490','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: psychotropn� lieky, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y500','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: stimulanci� centr�lnej nervovej s�stavy, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y510','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: lie�iv�, ��inkuj�ce najm� na auton�mnu nervov� s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y520','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky, ��inkuj�ce prim�rne na srdcovocievnu s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y530','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky, ��inkuj�ce prim�rne na tr�viacu s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y540','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky, prim�rne ��inkuj�ce na vodn� rovnov�hu a na metabolizmus miner�lov a kyseliny mo�ovej',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y550','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky, ��inkuj�ce prim�rne na hladk� a kostrov� svaly a na d�chaciu s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y560','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: l�tky na lok�lne pou�itie, ��inkuj�ce prim�rne na ko�u a sliznicu a lieky pou��van� v oftalmol�gii, otorinolaryngol�gii a stomatol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y570','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it� liekov a lie�iv: in� a bli��ie neur�en� lieky a lie�iv�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y580','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: bakt�riov� o�kovacia l�tka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y590','Ne�iaduce ved�aj�ie ��inky pri lie�ebnom pou�it�: in� a bli��ie neur�en� o�kovacie l�tky a biologicky akt�vne l�tky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y600','Ne�myseln� porezanie, pichnutie, prederavenie alebo krv�canie po�as chirurgickej a lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y610','N�hodne ponechan� cudz� predmet v tele po�as chirurgickej a lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y620','Nedodr�anie z�sad sterility po�as chirurgickej a lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y630','Nedodr�anie d�vkovania po�as chirurgickej a lek�rskej starostlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Y640','Kontaminovan� lie�ivo alebo biologicky akt�vna l�tka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X050','Vystavenie zap�leniu alebo roztopeniu no�n�ho oble�enia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X060','Vystavenie zap�leniu alebo roztopeniu in�ho oble�enia a �iat',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X080','Vystavenie in�mu bli��ie ur�en�mu dymu, oh�u a plame�u',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X090','Vystavenie bli��ie neur�en�mu dymu, oh�u a plame�u',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X100','Kontakt s hor�cim n�pojom, potravinami, tukom a olejom na varenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X110','Kontakt s hor�cou vodovodnou vodou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X120','Kontakt s inou hor�cou tekutinou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X130','Kontakt s vodnou parou a hor�cimi v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X140','Kontakt s hor�cim vzduchom a plynom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X150','Kontakt s hor�cimi n�dobami a pr�strojmi v dom�cnosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X160','Kontakt s hor�cimi vari�mi, radi�tormi a r�rami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X170','Kontakt s hor�cimi motormi, strojov�m zariaden�m a n�strojmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X180','Kontakt s in�mi hor�cimi kovmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X190','Kontakt s inou a bli��ie neur�enou hor��avou alebo hor�cou l�tkou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X200','Kontakt s jedovat�m hadom alebo ja�tericou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X210','Kontakt s jedovat�m pav�kom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X220','Kontakt so �korpi�nom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X230','Kontakt so sr��om, osou alebo v�elou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X240','Kontakt so stono�kou a jedovatou tropickou mnohono�kou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X250','Kontakt s in�m bli��ie ur�en�m jedovat�m �l�nkono�com',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X260','Kontakt s jedovat�m morsk�m zviera�om alebo rastlinou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X270','Kontakt s in�m bli��ie ur�en�m jedovat�m zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X280','Kontakt s inou bli��ie ur�enou jedovatou rastlinou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X290','Kontakt s bli��ie neur�en�m jedovat�m zviera�om a rastlinou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X300','Vystavenie nadmernej prirodzenej hor��ave',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X310','Vystavenie nadmern�mu prirodzen�mu chladu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X320','Vystavenie slne�n�mu svetlu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X330','Obe� blesku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X340','Obe� zemetrasenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X350','Obe� v�buchu sopky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X360','Obe� lav�ny, zosuvu p�dy a in�ch pohybov zeme',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X370','Obe� ni�ivej v�chrice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X380','Obe� z�plavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X390','Po�kodenie ��inkami in�ch a bli��ie neur�en�ch pr�rodn�ch s�l',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X400','N�hodn� otrava a priotr�venie neopioidov�mi analgetikami, antipyretikami a antireumatikami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X410','N�hodn� otrava a priotr�venie antiepileptikami, sedat�vami, hypnotikami, antiparkinsonikami a psychotropn�mi liekmi, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X420','N�hodn� otrava a priotr�venie opioidov�mi analgetikami a psychodysleptikami (halucinog�nmi), nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X430','N�hodn� otrava a priotr�venie in�mi lie�ivami, ��inkuj�cimi na auton�mnu nervov� s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X440','N�hodn� otrava a priotr�venie in�mi a bli��ie neur�en�mi lie�ivami, liekmi a biologick�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X450','N�hodn� otrava a priotr�venie alkoholom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X460','N�hodn� otrava a priotr�venie organick�mi rozp���adlami, halog�novan�mi uh�ovod�kmi a ich v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X470','N�hodn� otrava a priotr�venie in�mi plynmi a v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X480','N�hodn� otrava a priotr�venie pestic�dmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X490','N�hodn� otrava a priotr�venie in�mi a bli��ie neur�en�mi chemik�liami a �kodliv�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X500','Pre�a�enie a nam�hav� alebo opakovan� pohyby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X510','Cestovanie a pohyb',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X520','Dlh�� pobyt v beztia�ovom prostred�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X530','Nedostatok potravy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X540','Nedostatok vody',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X570','Bli��ie neur�en� nedostatok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X580','Vystavenie in�mu bli��ie ur�en�mu vplyvu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X590','Vystavenie bli��ie neur�en�mu vplyvu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X600','�myseln� samopo�kodenie otravou a priotr�ven�m neopioidov�mi analgetikami, antipyretikami a antireumatikami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X610','�myseln� samopo�kodenie otravou a priotr�ven�m antiepileptikami, sedat�vami, hypnotikami, antiparkinsonikami a psychotropn�mi liekmi, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X620','�myseln� samopo�kodenie otravou a priotr�ven�m opioidov�mi analgetikami a psychodysleptikami (halucinog�nmi), nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X630','�myseln� samopo�kodenie otravou a priotr�ven�m liekmi, ��inkuj�cimi na auton�mnu nervov� s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X640','�myseln� samopo�kodenie otravou a priotr�ven�m in�mi a bli��ie neur�en�mi liekmi, lie�ivami a biologicky akt�vnymi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X650','�myseln� samopo�kodenie otravou a priotr�ven�m alkoholom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X660','�myseln� samopo�kodenie otravou a priotr�ven�m organick�mi rozp���adlami, halog�novan�mi uh�ovod�kmi a ich v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X670','�myseln� samopo�kodenie otravou a priotr�ven�m in�mi plynmi a v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X680','�myseln� samopo�kodenie otravou a priotr�ven�m pestic�dmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X690','�myseln� samopo�kodenie otravou a priotr�ven�m in�mi a bli��ie neur�en�mi chemick�mi a �kodliv�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X700','�myseln� samopo�kodenie obesen�m, za�krten�m a zadusen�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X710','�myseln� samopo�kodenie utopen�m a topen�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X720','�myseln� samopo�kodenie v�strelom z ru�nej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X730','�myseln� samopo�kodenie v�strelom z gu�ovnice, brokovnice a dlhej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X740','�myseln� samopo�kodenie v�strelom z inej a bli��ie neur�enej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X750','�myseln� samopo�kodenie v�bu�nou l�tkou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X760','�myseln� samopo�kodenie dymom, po�iarom a plame�mi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X770','�myseln� samopo�kodenie parou, hor�cimi v�parmi a hor�cimi predmetmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X780','�myseln� samopo�kodenie ostr�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X790','�myseln� samopo�kodenie tup�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X800','�myseln� samopo�kodenie skokom z v��ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X810','�myseln� samopo�kodenie sko�en�m alebo �ahnut�m pred pohybuj�ci sa predmet',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X820','�myseln� samopo�kodenie havarovan�m s motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X830','�myseln� samopo�kodenie in�mi bli��ie ur�en�mi prostriedkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X840','�myseln� samopo�kodenie bli��ie neur�en�mi prostriedkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X850','Napadnutie liekmi, lie�ivami a biologicky akt�vnymi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X860','Napadnutie �ieravinami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X870','Napadnutie pestic�dmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X880','Napadnutie plynmi a v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X890','Napadnutie in�mi bli��ie ur�en�mi chemik�liami a �kodliv�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X900','Naopadnutie bli��ie neur�en�mi chemik�liami alebo �kodliv�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X910','Napadnutie obesen�m, za�krten�m a zahrd�sen�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X920','Napadnutie utopen�m a topen�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X930','Napadnutie v�strelom z ru�nej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X040','Vystavenie zap�leniu ve�mi hor�av�ho materi�lu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V940','In� a bli��ie neur�en� nehoda pri vodnej doprave',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V950','Nehoda motorov�ho lietadla ako pr��ina zranenia �lena pos�dky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V960','Nehoda bezmotorov�ho lietadla ako pr��ina zranenia �lena pos�dky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V970','In� bli��ie ur�en� dopravn� leteck� nehody',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V980','In� dopravn� nehoda, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V990','Dopravn� nehoda, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W000','P�d na tej istej �rovni na �ade a snehu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W010','P�d na tej istej �rovni n�sledkom po�myknutia, potknutia a zakopnutia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W020','P�d pri kor�u�ovan�, ly�ovan�, kor�u�ovan� na kolieskov�ch kor�uliach alebo jazde na skateboarde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W030','In� p�d na tej istej rovine, zapr��inen� zr�kou s inou osobou alebo soten�m inou osobou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W040','P�d pri nesen� alebo podopieran� in�mi osobami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W050','P�d z invalidn�ho voz�ka (kolieskovej stoli�ky)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W060','P�d z postele',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W070','P�d zo stoli�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W080','P�d z in�ho n�bytku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W090','P�d z n�radia ihriska',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W100','P�d na schody a zo schodov alebo stup�ov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W110','P�d na rebr�k a z rebr�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W120','P�d na le�enie a z le�enia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W130','P�d z budovy alebo kon�trukcie alebo prepadnutie nimi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W140','P�d zo stromu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W150','P�d z brala (skaly)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W160','Pon�ranie alebo sk�kanie do vody ako pr��ina poranenia in�ho, ako je utopenie alebo topenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W170','In� p�d z jednej �rovne na druh�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W180','In� p�d na tej istej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W190','P�d, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W200','Zasiahnutie hoden�m, vrhnut�m alebo padaj�cim telesom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W210','Narazenie do �portov�ho n�radia alebo zasiahnutie n�rad�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W220','Narazenie do in�ch predmetov alebo zasiahnutie t�mito predmetmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W230','Zachytenie, pomlia�denie, zaklie�tenie alebo privrznutie medzi predmetmi alebo v nich',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W240','Zachytenie zdv�hac�mi a prenosov�mi zariadeniami, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W250','Poranenie (kontakt) ostr�m sklom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W260','Poranenie (kontakt s) no�om, me�om alebo d�kou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W270','Poranenie (kontakt s) ru�n�m n�rad�m bez pohonu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W280','Poranenie (kontakt s) motorov�m striha�om tr�vnika',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W290','Poranenie (kontakt) in�m motorov�m n�rad�m a pr�strojmi pre dom�cnos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W300','Poranenie (kontakt s) po�nohospod�rskymi mechanizmami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W310','Poranenie (kontakt s) in�mi a bli��ie neur�en�mi mechanizmami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W320','Z�sah v�strelom z kr�tkej (ru�nej) strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W330','Z�sah v�strelom z gu�ovnice, brokovnice alebo dlhej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W340','Z�sah v�strelom z inej a bli��ie neur�enej strelnej zbrane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W350','Z�sah v�buchom a puknutie n�dr�e bojlera',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W360','Z�sah v�buchom a puknutie plynov�ho valca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W370','Z�sah v�buchom a puknutie naf�kanej pneumatiky, r�ry alebo hadice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W380','Z�sah v�buchom a puknutie in�ch bli��ie ur�en�ch zariaden� pod tlakom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W390','Z�sah v�strelom z oh�ostroja',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W400','Z�sah v�buchom in�ch materi�lov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W410','Vystavenie ��inku pr�denia pod vysok�m tlakom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W420','Vystavenie hluku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W430','Vystavenie vibr�ci�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W440','Cudzie teleso vnikaj�ce do oka, cez oko alebo in� prirodzen� otvor tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W450','Cudzie teleso alebo predmet prenikaj�ci cez ko�u',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W490','Vystavenie inej a bli��ie neur�enej ne�ivej mechanickej sile',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W500','Udretie, bitie, kopnutie, vykr�tenie, u�tipnutie, alebo po�kriabanie inou osobou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W510','Sotenie alebo narazenie soten�m do inej osoby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W520','Pomlia�denie, pritisnutie alebo po�liapanie v dave alebo pri panike',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W530','Uhryznutie potkanom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W540','Uhryznutie alebo udretie psom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W550','Uhryznutie alebo udretie in�m cicavcom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W560','Poranenie morsk�m zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W570','Uhryznutie alebo u�tipnutie nejedovat�m hmyzom a in�m nejedovat�m �l�nkono�com',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W580','Uhryznutie alebo udretie krokod�lom alebo alig�torom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W590','Uhryznutie alebo pomlia�denie in�m plazom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W600','Kontakt s rastlinn�mi t��mi, pichlia�mi a ostr�mi listami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W640','Vystavenie bli��ie neur�enej �ivej mechanickej sile',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W650','Utopenie a topenie vo vani',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W660','Utopenie a topenie po p�de do vane',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W670','Utopenie a topenie v plaveckom baz�ne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W680','Utopenie a topenie po p�de do plaveck�ho baz�na',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W690','Utopenie a topenie v pr�rodn�ch vod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W700','Utopenie a topenie pri p�de do vody v pr�rodn�ch vod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W730','In� utopenie a topenie, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W740','Utopenie a topenie, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W750','N�hodn� udusenie a za�krtenie v posteli',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W760','In� n�hodn� obesenie a za�krtenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W770','Udusenie zapr��inen� prepadnut�m zeme, zavalen�m zemou a in�mi materi�lmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W780','Vd�chnutie obsahu �al�dka (v�vratkov)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W790','Vd�chnutie a prehltnutie potravy, zapr��i�uj�ce zapchatie d�chac�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W800','Vd�chnutie a prehltnutie in�ch predmetov, zapr��i�uj�ce zapchatie d�chac�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W810','Zatvorenie alebo uviaznutie v prostred� s nedostatkom kysl�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W830','In� bli��ie ur�en� ohrozenie d�chania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W840','Bli��ie neur�en� ohrozenie d�chania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W850','Vystavenie elektrick�mu vedeniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W860','Vystavenie in�mu bli��ie ur�en�mu elektrick�mu pr�du',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W870','Vystavenie bli��ie neur�en�mu elektrick�mu pr�du',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W880','Vystavenie ionizuj�cemu �iareniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W890','Vystavenie umel�mu vidite�n�mu a ultrafialov�mu svetlu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W900','Vystavenie in�mu neionizuj�cemu �iareniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W910','Vystavenie bli��ie neur�en�mu �iareniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W920','Vystavenie nadmernej hor��ave umel�ho p�vodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W930','Vystavenie nadmern�mu chladu umel�ho p�vodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W940','Vystavenie vysok�mu alebo n�zkemu tlaku vzduchu, alebo zmen�m tlaku vzduchu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('W990','Vystavenie in�mu a bli��ie neur�en�mu umel�mu �inite�ovi prostredia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X000','Vystavenie nekontrolovan�mu oh�u v budove alebo stavbe',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X010','Vystavenie nekontrolovan�mu oh�u mimo budovy alebo stavby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X020','Vystavenie kontrolovan�mu oh�u v budove alebo stavbe',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('X030','Vystavenie kontrolovan�mu oh�u mimo budovy alebo stavby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V310','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V320','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s in�m dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V330','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V340','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V350','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V360','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V370','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V380','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V390','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri in�ch a bli��ie neur�en�ch dopravn�ch nehod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V400','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s chodcom alebo zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V410','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V420','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V430','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V440','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V450','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V460','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V470','Poranenie �lena pos�dky osobn�ho auta pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V480','Poranenie �lena pos�dky osobn�ho auta pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V490','Poranenie �lena pos�dky osobn�ho auta pri in�ch a bli��ie neur�en�ch dopravn�ch nehod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V500','Poranenie cestuj�ceho v n�kladnom alebo dod�vkovom aute pri zr�ke s chodcom alebo zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V510','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V520','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V530','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V540','Poranenie cestuj�ceho v n�kladnom alebo dod�vkovom aute pri zr�ke s kami�nom alebo s autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V550','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V560','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V570','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V580','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V590','Poranenie �lena pos�dky dod�vky alebo n�kladn�ho auta pri inej a bli��ie neur�enej dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V600','Poranenie cestuj�ceho v kami�ne pri zr�ke s chodcom alebo so zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V610','Poranenie �lena pos�dky kami�na pri zr�ke s bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V620','Poranenie �lena pos�dky kami�na pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V630','Poranenie �lena pos�dky kami�na pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V640','Poranenie �lena pos�dky kami�na pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V650','Poranenie �lena pos�dky kami�na pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V660','Poranenie �lena pos�dky kami�na pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V670','Poranenie �lena pos�dky kami�na pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V680','Poranenie �lena pos�dky kami�na pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V690','Poranenie �lena pos�dky kami�na pri inej a bli��ie neur�enej dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V700','Poranenie �lena pos�dky autobusu pri zr�ke s chodcom alebo zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V710','Poranenie �lena pos�dky autobusu pri zr�ke s bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V720','Poranenie �lena pos�dky autobusu pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V730','Poranenie �lena pos�dky autobusu pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V740','Poranenie �lena pos�dky autobusu pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V750','Poranenie �lena pos�dky autobusu pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V760','Poranenie �lena pos�dky autobusu pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V770','Poranenie �lena pos�dky autobusu pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V780','Poranenie �lena pos�dky autobusu pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V790','Poranenie �lena pos�dky autobusu pri in�ch a bli��ie neur�en�ch dopravn�ch nehod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V800','Poranenie jazdca alebo �lena pos�dky vozidla �ahan�ho zviera�om pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V810','Poranenie �lena pos�dky vlaku alebo ko�ajov�ho vozidla pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V820','Poranenie �lena pos�dky vozidla miestnej dopravy pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V830','Poranenie cestuj�ceho v �peci�lnom vozidle pou��vanom najm� v priemyseln�ch objektoch pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V840','Poranenie �lena pos�dky v �peci�lnom vozidle pou��vanom najm� v po�nohospod�rstve pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V850','Poranenie �lena pos�dky �peci�lneho stavebn�ho vozidla pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V860','Poranenie �lena pos�dky v �peci�lnom ter�nnom vozidle, alebo inak upravenom motorovom vozidle na pou�itie mimo ciest pri dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V870','Presne ur�en� typ dopravnej nehody, ale sp�sob dopravy poranen�ho nezn�my',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V880','Presne ur�en� typ nedopravnej nehody, ale sp�sob dopravy poranen�ho nezn�my',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V890','Dopravn� nehoda motorov�ho alebo nemotorov�ho vozidla bez bli��ieho ur�enia typu vozidla',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V900','Nehoda plavidla ako pr��ina utopenia a ponorenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V910','Nehoda plavidla ako pr��ina in�ho poranenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V920','Utopenie a ponorenie pri vodnej doprave bez nehody plavidla',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V930','Nehoda na palube plavidla bez nehody plavidla nezapr��i�uj�ca utopenie a ponorenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T400','Otrava opi�tmi a psychodysleptikami [halucinog�nmi]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T410','Otrava anestetikami a lie�ebn�mi plynmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T420','Otrava antiepileptikami, sedat�vami, hypnotikami a antiparkinsonikami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T430','Otrava psychotropn�mi l�tkami, nezatrieden�mi inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T440','Otrava lie�ivami, ��inkuj�cimi najm� na auton�mnu nervov� s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T450','Otrava prostriedkami, ��inkuj�cimi najm� celkovo a na zlo�ky krvi, nezatrieden�mi inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T460','Otrava prostriedkami, ��inkuj�cimi najm� na obehov� s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T470','Otrava prostriedkami, ��inkuj�cimi najm� na tr�viacu s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T480','Otrava prostriedkami, ��inkuj�cimi prim�rne na hladk� a kostrov� svaly a na d�chaciu s�stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T490','Otrava prostriedkami na lok�lne pou�itie ��inkuj�cimi, prim�rne na ko�u a sliznice a prostriedkami pou��van�mi v oftalmol�gii, otorinolaryngol�gii a stomatol�gii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T500','Otrava diuretikami a in�mi bli��ie neur�en�mi liekmi, lie�ivami a biologick�mi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T510','Toxick� ��inok alkoholu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T520','Toxick� ��inok organick�ch rozp���adiel',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T530','Toxick� ��inok halog�nov�ch deriv�tov alifatick�ch a aromatick�ch uh�ovod�kov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T540','Toxick� ��inok leptavej l�tky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T550','Toxick� ��inok mydla a detergencia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T560','Toxick� ��inok kovu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T570','Toxick� ��inok inej anorganickej l�tky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T580','Toxick� ��inok oxidu uho�nat�ho (CO)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T590','Toxick� ��inok in�ho plynu, dymu a v�parov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T600','Toxick� ��inok pestic�du',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T610','Toxick� ��inok �kodliv�ch l�tok po�it�ch ako morsk� potrava',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T620','Toxick� ��inok in�ch �kodliv�ch l�tok po�it�ch ako potrava',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T630','Toxick� ��inok kontaktu s jedovat�mi zvieratami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T640','Toxick� ��inok aflatox�nu a in�ch mykotox�nov, zne�is�uj�cich potravu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T650','Toxick� ��inok inej a bli��ie neur�enej l�tky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T660','Bli��ie neur�en� ��inky �iarenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T670','��inky tepla a svetla',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T680','Podchladenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T690','In� ��inky zn�enej teploty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T700','��inok tlaku vzduchu a tlaku vody',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T710','Zadusenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T730','��inky in�ch nedostatkov [depriv�ci�]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T740','Syndr�m, zapr��inen� zl�m zaobch�dzan�m [t�ran�m]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T750','��inky in�ch vonkaj��ch pr��in',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T780','Ne�iaduci ��inok, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T790','Ur�it� v�asn� komplik�cie �razu, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T800','Komplik�cia po inf�zii, transf�zii a lie�ebnej injekcii',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T810','Komplik�cia po v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T820','Komplik�cia zapr��inen� srdcovou a cievnou prot�zou, implant�tom a transplant�tom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T830','Komplik�cia zapr��inen� mo�ovopohlavnou prot�zou, implant�tom a transplant�tom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T840','Komplik�cia zapr��inen� vn�tornou ortopedickou prot�zou, implant�tom a transplant�tom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T850','Komplik�cia zapr��inen� inou vn�tornou prot�zou, implant�tom a �tepom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T860','Zlyh�vanie a odvrhnutie transplantovan�ch org�nov a tkan�v',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T870','Komplik�cia charakteristick� pre replant�ciu a amput�ciu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T880','In� komplik�cia lek�rskej a zdravotn�ckej starostlivosti, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T900','Neskor� n�sledky poranenia hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T910','Neskor� n�sledky poranenia krku a trupu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T920','Neskor� n�sledky poranenia hornej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T930','Neskor� n�sledky poranenia dolnej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T940','Neskor� n�sledky poranenia viacer�ch a bli��ie neur�en�ch oblast� tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T950','Neskor� n�sledky pop�lenia, poleptania a omrzl�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T960','Neskor� n�sledky otravy liekmi, lie�ivami a biologicky akt�vnymi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T970','Neskor� n�sledky toxick�ch ��inkov l�tky pou��vanej najm� mimo lek�rstva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T980','Neskor� n�sledky in�ch a bli��ie neur�en�ch ��inkov vonkaj��ch pr��in',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V010','Poranenie chodca pri zr�ke s bicyklom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V020','Poranenie chodca pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V030','Poranenie chodca pri zr�ke s osobn�m, dod�vkov�m alebo �ahk�m n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V040','Poranenie chodca pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V050','Poranenie chodca pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V060','Poranenie chodca pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V090','Poranenie chodca pri inej a bli��ie neur�enej dopravnej nehode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V100','Poranenie bicyklistu pri zr�ke s chodcom alebo so zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V110','Poranenie bicyklistu pri zr�ke s in�m bicyklom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V120','Poranenie bicyklistu pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V130','Poranenie bicyklistu pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V140','Poranenie bicyklistu pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V150','Poranenie bicyklistu pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V160','Poranenie bicyklistu pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V170','Poranenie bicyklistu pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V180','Poranenie bicyklistu pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V190','Poranenie bicyklistu pri in�ch a bli��ie neur�en�ch dopravn�ch nehod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V200','Poranenie jazdca na motocykli pri zr�ke s chodcom alebo so zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V210','Poranenie jazdca na motocykli pri zr�ke bicyklistom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V220','Poranenie jazdca na motocykli pri zr�ke s dvojkolesov�m alebo trojkolesov�m motorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V230','Poranenie jazdca na motocykli pri zr�ke s osobn�m, dod�vkov�m alebo n�kladn�m autom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V240','Poranenie jazdca na motocykli pri zr�ke s kami�nom alebo autobusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V250','Poranenie jazdca na motocykli pri zr�ke s vlakom alebo ko�ajov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V260','Poranenie jazdca na motocykli pri zr�ke s in�m nemotorov�m vozidlom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V270','Poranenie jazdca na motocykli pri zr�ke s pevn�m alebo nepohybliv�m predmetom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V280','Poranenie jazdca na motocykli pri dopravnej nehode bez zr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V290','Poranenie jazdca na motocykli pri in�ch a bli��ie neur�en�ch dopravn�ch nehod�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('V300','Poranenie �lena pos�dky trojkolesov�ho motorov�ho vozidla pri zr�ke s chodcom alebo so zviera�om',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S370','Poranenie mo�ov�ch org�nov a panvov�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S380','Drviv� poranenie a �razov� amput�cia �asti brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S390','In� a bli��ie neur�en� poranenie brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S400','Povrchov� poranenie pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S410','Otvoren� rana pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S420','Zlomenina pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S430','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov plecov�ho pletenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S440','Poranenie nervov v �rovni pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S450','Poranenie krvn�ch ciev v �rovni pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S460','Poranenie svalu a ��achy v �rovni pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S470','Drviv� poranenie pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S480','�razov� amput�cia pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S490','In� a bli��ie neur�en� poranenie pleca a ramena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S500','Povrchov� poranenie lak�a a predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S510','Otvoren� rana predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S520','Zlomenina predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S530','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov lak�a',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S540','Poranenie nervov v �rovni predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S550','Poranenie krvn�ch ciev v �rovni predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S560','Poranenie svalu a ��achy v �rovni predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S570','Drviv� poranenie predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S580','�razov� amput�cia lak�a a predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S590','In� a bli��ie neur�en� poranenia predlaktia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S600','Povrchov� poranenie z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S610','Otvoren� rana z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S620','Zlomenina v �rovni z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S630','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov v �rovni z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S640','Poranenie nervov v �rovni z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S650','Poranenie krvn�ch ciev v �rovni z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S660','Poranenie svalu a ��achy v �rovni z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S670','Drviv� poranenie z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S680','�razov� amput�cia z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S690','In� a bli��ie neur�en� poranenia z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S700','Povrchov� poranenie bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S710','Otvoren� rana bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S720','Zlomenina stehnovej kosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S730','Vyk�benie, vyvrtnutie a natiahnutie k�bu a v�zov bedra',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S740','Poranenie nervu v �rovni bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S750','Poranenie krvn�ch ciev v �rovni bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S760','Poranenie svalu a ��achy v �rovni bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S770','Drviv� poranenie bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S780','�razov� amput�cia bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S790','In� a bli��ie neur�en� poranenie bedra a stehna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S800','Povrchov� poranenie predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S810','Otvoren� rana predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S820','Zlomenina predkolenia vr�tane �lenka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S830','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov kolena',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S840','Poranenie nervu v �rovni predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S850','Poranenie krvn�ch ciev v �rovni predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S860','Poranenie svalu a ��achy v �rovni predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S870','Drviv� poranenie predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S880','�razov� amput�cia predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S890','In� a bli��ie neur�en� poranenie predkolenia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S900','Povrchov� poranenie �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S910','Otvoren� rana �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S920','Zlomenina nohy [okrem �lenka]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S930','Vyk�benie, vyvrtnutie a natiahnutie k�bu a v�zu v �rovni �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S940','Poranenie nervov v �rovni �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S950','Poranenie krvn�ch ciev v �rovni �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S960','Poranenie svalu a ��achy v �rovni �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S970','Drviv� poranenie �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S980','�razov� amput�cia �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S990','In� a bli��ie neur�en� poranenie �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T000','Povrchov� poranenie viacer�ch oblast� tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T010','Otvoren� rana postihuj�ca viacer� oblasti tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T020','Zlomeniny postihuj�ce viacer� oblasti tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T030','Vyk�benia, vyvrtnutia a natiahnutia postihuj�ce viacer� oblasti tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T040','Drviv� poranenie postihuj�ce viacer� oblasti tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T050','�razov� amput�cia postihuj�ca viacer� oblasti tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T060','In� poranenia postihuj�ce viacer� oblasti tela, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T070','Viacer� poranenia, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T080','Zlomenina chrbtice v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T090','In� poranenia chrbtice a trupu v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T100','Zlomenina hornej kon�atiny v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T110','In� poranenie hornej kon�atiny v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T120','Zlomenina dolnej kon�atiny, v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T130','In� poranenie dolnej kon�atiny, v bli��ie neur�enej �rovni',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T140','Poranenie: oblas� bli��ie neur�en� tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T150','Cudzie teleso vo vonkaj�om oku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T160','Cudzie teleso v uchu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T170','Cudzie teleso v d�chacej s�stave',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T180','Cudzie teleso v tr�viacej s�stave',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T190','Cudzie teleso v mo�ovopohlavnej s�stave',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T200','Pop�lenina a poleptanie hlavy a krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T210','Pop�lenina a poleptanie trupu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T220','Pop�lenina a poleptanie pleca a hornej kon�atiny okrem z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T230','Pop�lenina a poleptanie z�p�stia a ruky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T240','Pop�lenina a poleptanie bedra a dolnej kon�atiny okrem �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T250','Pop�lenina a poleptanie �lenka a nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T260','Pop�lenina a poleptanie obmedzen� na oko a o�n� adnexy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T270','Pop�lenina a poleptanie d�chac�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T280','Pop�lenina a poleptanie in�ch vn�torn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T290','Pop�lenina a poleptania viacer�ch �ast� tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T300','Pop�lenina a poleptanie: oblas� bli��ie neur�en� tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T310','Pop�leniny zatrieden� pod�a rozsahu postihnut�ho povrchu tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T320','Poleptania zatrieden� pod�a rozsahu postihnut�ho povrchu tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T330','Povrchov� omrzlina',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T340','Omrzlina s nekr�zou tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T350','Omrzlina postihuj�ca viacer� �asti tela a bli��ie neur�en� omrzlina',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T360','Otrava celkovo ��inkuj�cimi antibiotikami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T370','Otrava in�mi syst�movo ��inkuj�cimi protiinfek�n�mi a antiparazitov�mi prostriedkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T380','Otrava horm�nmi, ich syntetick�mi n�hradami a antagonistami, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('T390','Otrava neopioidov�mi analgetikami, antipyretikami a antireumatikami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R180','Ascites',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R190','In� subjekt�vne a objekt�vne pr�znaky postihnutia tr�viacej s�stavy a brucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R200','Porucha ko�nej citlivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R210','Ra� a in� ne�pecifick� ko�n� vyr�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R220','Lokalizovan� zdurenie, �tvar, hr�a ko�e a podko�n�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R230','In� ko�n� zmeny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R250','Abnorm�lne mimov��ov� pohyby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R260','Porucha ch�dze a pohyblivosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R270','In� porucha koordin�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R290','In� subjekt�vny a objekt�vny pr�znak postihnutia nervovej, svalovej a kostrovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R300','Boles� pri mo�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R310','Hemat�ria, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R320','Inkontinencia mo�u, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R330','Retencia mo�u',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R340','An�ria a olig�ria',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R350','Poly�ria',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R360','V�tok z uretry',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R390','In� subjekt�vny a objekt�vny pr�znak poruchy mo�ovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R400','Somnolencia, sopor a k�ma',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R410','In� subjekt�vne a objekt�vne pr�znaky por�ch pozn�vac�ch funkci� a vedomia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R420','Z�vrat [vertigo]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R430','Poruchy �uchu a chuti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R440','In� subjekt�vne a objekt�vne pr�znaky por�ch celkovej citlivosti a zmyslov�ho vn�mania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R450','Subjekt�vne a objekt�vne pr�znaky por�ch emo�n�ho stavu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R460','Subjekt�vne a objekt�vne pr�znaky s�visiace s v�zorom a spr�van�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R470','Poruchy re�i, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R480','Dyslexia a in� symbolick� dysfunkcie, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R490','Poruchy hlasu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R500','Hor��ka in�ho a nezn�meho p�vodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R510','Boles� hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R520','Boles�, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R530','Mal�tnos� a �nava',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R540','Senilita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R550','Synkopa a kolaps',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R560','K��e, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R570','�ok, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R580','Krv�canie, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R590','Zv��enie lymfatick�ch uzl�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R600','Opuch, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R610','Hyperhidr�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R620','Zaost�vanie v o�ak�vanom fyziologickom v�vine',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R630','Subjekt�vne a objekt�vne pr�znaky s�visiace s prij�man�m potravy a tekut�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R640','Kachexia (vycivenos�)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R680','In� celkov� subjekt�vne a objekt�vne pr�znaky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R690','Nezn�me a bli��ie neur�en� pr��iny chorobnosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R700','Zr�chlen� sediment�cia erytrocytov a abnorm�lna viskozita plazmy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R710','Abnormality �erven�ch krviniek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R720','Abnormality bielych krviniek, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R730','Zv��en� koncentr�cia gluk�zy v krvnom s�re',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R740','Abnorm�lna aktivita enz�mov v krvnom s�re',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R750','Laborat�rny d�kaz v�rusu �udskej imunodeficiencie (HIV)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R760','In� abnorm�lny imunologick� n�lez v krvnom s�re',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R770','In� abnormality bielkov�n plazmy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R780','N�lezy liekov a in�ch l�tok, ktor� sa norm�lne v krvi nenach�dzaj�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R790','In� abnorm�lne n�lezy v chemickom zlo�en� krvi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R800','Izolovan� protein�ria',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R810','Glykoz�ria',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R820','In� abnorm�lne n�lezy v mo�i',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R830','Abnorm�lny n�lez v mozgovomiechovom moku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R840','Abnorm�lny n�lez vo vzork�ch z d�chac�ch org�nov a hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R850','Abnorm�lny n�lez vo vzork�ch z tr�viacich org�nov a bru�nej dutiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R860','Abnorm�lny n�lez vo vzork�ch z mu�sk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R870','Abnorm�lny n�lez vo vzork�ch zo �ensk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R890','Abnorm�lny n�lez vo vzork�ch z in�ch org�nov, s�stav a tkan�v',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R900','Abnorm�lny n�lez pri diagnostickom zobrazovan� centr�lnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R910','Abnorm�lny n�lez pri diagnostickom zobrazen� p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R920','Abnorm�lny n�lez pri diagnostickom zobrazen� prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R930','Abnorm�lny n�lez pri diagnostickom zobrazen� in�ch �trukt�r tela',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R940','Abnorm�lne v�sledky funk�n�ch vy�etren�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R950','N�hla smr� doj�a�a',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R960','In� n�hla smr� z nezn�mej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R980','Smr� bez svedkov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R990','In� nepresne ur�en� a neur�en� pr��ina smrti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S000','Povrchov� poranenie hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S010','Otvoren� rana hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S020','Zlomenina lebky a tv�rov�ch kost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S030','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S040','Poranenie hlavov�ch nervov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S050','Poranenie oka a o�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S060','Vn�trolebkov� poranenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S070','Drviv� poranenie hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S080','�razov� amput�cia �asti hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S090','In� a bli��ie neur�en� poranenie hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S100','Povrchov� poranenie krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S110','Otvoren� rana krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S120','Zlomenina kr�nej chrbtice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S130','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S140','Poranenie kr�n�ch nervov a kr�nej miechy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S150','Poranenie krvn�ch ciev v �rovni krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S160','Poranenie svalov a �liach v �rovni krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S170','Drviv� poranenie krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S180','�razov� amput�cia v �rovni krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S190','In� a bli��ie neur�en� poranenie krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S200','Povrchov� poranenie hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S210','Otvoren� rana hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S220','Zlomenina rebra (rebier), hrudnej kosti a hrudn�kovej chrbtice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S230','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S240','Poranenie nervov a miechy v �rovni hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S250','Poranenie krvn�ch ciev hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S260','Poranenie srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S270','Poranenie in�ho a bli��ie neur�en�ho vn�trohrudn�kov�ho org�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S280','Drviv� poranenie hrudn�ka a �razov� amput�cia �asti hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S290','In� a bli��ie neur�en� poranenie hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S300','Povrchov� poranenie brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S310','Otvoren� rana brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S320','Zlomenina driekovej �asti chrbtice a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S330','Vyk�benie, vyvrtnutie a natiahnutie k�bov a v�zov driekovej chrbtice a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S340','Poranenie nervov a miechy v �rovni brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S350','Poranenie krvn�ch ciev v �rovni brucha, drieku a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('S360','Poranenie vn�trobru�n�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R170','�lta�ka, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P770','Nekrotizuj�ca enterokolit�da plodu a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P780','In� perinat�lna porucha tr�viacej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P800','Hypotermia u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P810','In� porucha regul�cie telesnej teploty u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P830','In� choroba ko�e �pecifick� pre plod a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P900','K��e [konvulzie]  u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P910','In� mozgov� porucha u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P920','Probl�m s k�men�m novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P930','Reakcia na lieky a intoxik�cia liekmi podan�mi plodu a novorodencovi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P940','Porucha svalov�ho tonusu u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P950','Smr� plodu z bli��ie neur�enej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P960','In� porucha so za�iatkom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q000','Anencefalus a podobn� vroden� chyba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q010','Encefalok�la',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q020','Mikrocef�lia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q030','Vroden� hydrocefalus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q040','In� vroden� chyba mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q050','R�z�tep chrbtice  [Spina bifida]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q060','In� vroden� chyba miechy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q070','In� vroden� chyba nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q100','Vroden� chyby mihalnice, slzn�ch org�nov a o�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q110','Anoftalmus, mikroftalmus a makroftalmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q120','Vroden� chyba �o�ovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q130','Vroden� chyba predn�ho segmentu oka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q140','Vroden� chyba zadn�ho segmentu oka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q150','In� vroden� chyba oka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q160','Vroden� chyby ucha, zapr��i�uj�ce zhor�enie sluchu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q170','In� vroden� chyba ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q180','In� vroden� chyba tv�re a krku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q200','Vroden� chyba srdcov�ch dut�n a ich spojen�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q210','Vroden� chyba srdcov�ch priehradiek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q220','Vroden� chyba pulmon�lnej a trikuspid�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q230','Vroden� chyba aort�lnej a mitr�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q240','In� vroden� chyba srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q250','Vroden� chyby ve�k�ch tepien',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q260','Vroden� chyba ve�k�ch ��l',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q270','In� vroden� chyba perif�rnej cievnej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q280','In� vroden� chyba obehovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q300','Vroden� chyba nosa',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q310','Vroden� chyba hrtana',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q320','Vroden� chyba priedu�nice a priedu�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q330','Vroden� chyba p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q340','In� vroden� chyba d�chac�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q350','R�z�tep podnebia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q360','R�z�tep pery',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q370','R�z�tep podnebia s r�z�tepom pery',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q380','In� vroden� chyba jazyka, �st a hltana',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q390','Vroden� chyba pa�er�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q400','In� vroden� chyba hornej tr�viacej trubice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q410','Vroden� ch�banie, atr�zia a sten�za tenk�ho �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q420','Vroden� ch�banie, atr�zia a sten�za hrub�ho �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q430','In� vroden� chyba �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q440','Vroden� chyba �l�n�ka, �l�ov�ch v�vodov a pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q450','In� vroden� chyba tr�viacej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q500','Vroden� chyba vaje�n�kov, vaj��kovodov  a �irok�ch v�zov maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q510','Vroden� chyba maternice a kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q520','In� vroden� chyba �ensk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q530','Nezost�pen� semenn�k',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q540','Hyposp�dia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q550','In� vroden� chyby mu�sk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q560','Neur�it� pohlavie a pseudohermafroditizmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q600','Agen�za a in� hypopl�zie obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q610','Cystick� choroba obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q620','Vroden� ob�truk�n� chyby obli�kovej panvi�ky a vroden� chyby mo�ovodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q630','In� vroden� chyba obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q640','In� vroden� chyba mo�ovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q650','Vroden� deformity bedra',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q660','Vroden� deformita n�h',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q670','Vroden� deformita svalov a kost� hlavy, tv�re, chrbtice a hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q680','In� vroden� deformita svalov a kost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q690','Polydakt�lia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q700','Syndakt�lia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q710','Reduk�n� defekty hornej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q720','Reduk�n� defekty dolnej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q730','Reduk�n� defekt bli��ie neur�enej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q740','In� vroden� chyba kon�atiny (kon�at�n)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q750','In� vroden� chyba kost� lebky a tv�rov�ch kost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q760','Vroden� chyba chrbtice a kost� hrudn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q770','Osteochondrodyspl�zie s poruchou rastu dlh�ch kost� a chrbtice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q780','In� osteochondrodyspl�zia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q790','Vroden� chyby svalov a kost�, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q800','Vroden� ichty�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q810','Bul�zna epidermol�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q820','In� vroden� chyba ko�e',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q830','Vroden� chyba prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q840','In� vroden� chyba spolo�nej (ko�nej) pokr�vky [integumentum commune]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q850','Fakomat�za, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q860','Syndr�m vrodenej chyby, zapr��inen� zn�mymi vonkaj��mi pr��inami, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q870','Syndr�my in�ch bli��ie ur�en�ch vroden�ch ch�b, postihuj�ci viacer� syst�my',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q890','In� vroden� chyba, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q900','Downov syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q910','Edwardsov syndr�m a Patauov syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q920','In� triz�mie a �iasto�n� triz�mie autoz�mov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q930','Monoz�mia a del�cia autoz�mov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q950','Balansovan� chromoz�mov� prestavba  a �trukt�rne markery, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q960','Turnerov syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q970','In� abnormalita pohlavn�ch chromoz�mov so �ensk�m fenotypom, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q980','In� abnormalita pohlavn�ch chromoz�mov s mu�sk�m fenotypom, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('Q990','In� chromoz�mov� abnormalita, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R000','Poruchy srdcov�ho rytmu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R010','Srdcov� �elest a in� srdcov� zvuk',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R020','Gangr�na, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R030','Abnorm�lne hodnoty krvn�ho tlaku bez ur�enia diagn�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R040','Krv�canie z d�chac�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R050','Ka�e�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R060','Porucha d�chania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R070','Boles� v hrdle a boles� v hrudn�ku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R090','In� subjekt�vne a objekt�vne pr�znaky postihnutia obehovej a d�chacej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R100','Boles� brucha a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R110','Pocit na vracanie (nauzea) a vracanie (vomitus)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R120','P�lenie z�hy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R130','Dysf�gia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R140','Flatulencia a podobn� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R150','Inkontinencia stolice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('R160','Hepatomeg�lia a splenomeg�lia, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O310','Komplik�cie �pecifick� pre viacplodov� graviditu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O320','Starostlivos� o matku pre zisten� alebo suspektn� nepravideln� naliehanie plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O330','Starostlivos� o matku pri zistenom alebo suspektnom nepomere medzi plodom a panvou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O340','Starostlivos� o matku pre zisten� alebo suspektn� abnormalitu panvov�ch org�nov matky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O350','Starostlivos� o matku pre zisten� alebo suspektn� abnormalitu a po�kodenie plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O360','Starostlivos� o matku pre in� zisten� alebo suspektn� probl�my plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O400','Polyhydramnion',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O410','In� poruchy plodovej vody a plodov�ch obalov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O420','Pred�asn� puknutie plodov�ch obalov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O430','Porucha placenty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O440','Placenta praevia a n�zko ulo�en� placenta',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O450','Pred�asn� odlupovanie placenty  [Abruptio placentae]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O460','Krv�canie pred p�rodom, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O470','Falo�n� p�rodn� �innos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O480','Pred�en� gravidita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O600','Pred�asn� p�rodn� �innos� a p�rod',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O610','Ne�spe�n� indukcia p�rodnej �innosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O620','Porucha p�rodnej �innosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O630','Pred�en� p�rod',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O640','Nepokra�uj�ci p�rod, zapr��inen� nespr�vnou polohou a naliehan�m plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O650','Nepokra�uj�ci p�rod, zapr��inen� abnormalitami panvy matky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O660','In� nepokra�uj�ci p�rod',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O670','P�rodn� �innos� a p�rod, komplikovan� krv�can�m pri p�rode, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O680','Komplik�cie p�rodnej �innosti a p�rodu distresom plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O690','Komplik�cie p�rodnej �innosti a p�rodu pre poruchy pupo�n�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O700','Natrhnutie hr�dze pri p�rode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O710','In� p�rodn� poranenie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O720','Krv�canie po p�rode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O730','Zadr�anie placenty a bl�n bez krv�cania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O740','Komplik�cie anest�zie po�as p�rodnej �innosti a pri p�rode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O750','In� komplik�cia p�rodnej �innosti a p�rodu, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O800','Spont�nny p�rod jedn�ho plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O810','P�rod jedn�ho plodu klie��ami alebo v�kuov�m extraktorom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O820','P�rod jedn�ho plodu cis�rskym rezom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O830','In� vedenie p�rodu jedn�ho plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O840','Plody pri viacplodovej �archavosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O850','Puerper�lna sepsa',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O860','In� puerper�lna infekcia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O870','�ilov� choroby ako komplik�cie v �estonedel�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O880','Emb�lia v gesta�nom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O890','Komplik�cie anest�zie v �estonedel�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O900','Komplik�cie v �estonedel�, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O910','Infekcie prsn�ka v s�vislosti s p�rodom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O920','In� choroba prsn�ka a porucha lakt�cie v s�vislosti s p�rodom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O950','Smr� v gravidite z bli��ie neur�enej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O960','Smr� z akejko�vek p�rodn�ckej pr��iny, ktor� nastala po viac ako 42 d�och, ale menej ako jeden rok od p�rodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O970','Smr� ako n�sledok p�rodn�ckej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O980','Infek�n� a parazitov� choroba matky, ktor� sa d� zatriedi� inde, ale komplikuje graviditu, p�rod a �estonedelie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O990','In� choroby matky, ktor� sa daj� zatriedi� inde, ale komplikuj� graviditu, p�rod a �estonedelie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P000','Po�kodenie plodu a novorodenca chorobami matky, ktor� nemusia s�visie� s teraj�ou graviditou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P010','Po�kodenie plodu a novorodenca matersk�mi komplik�ciami v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P020','Po�kodenie plodu a novorodenca komplik�ciami placenty, pupo�n�ka a bl�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P030','Po�kodenie plodu a novorodenca in�mi komplik�ciami p�rodnej �innosti a p�rodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P040','Po�kodenie plodu a novorodenca �kodliv�mi l�tkami prenesen�mi placentou alebo matersk�m mliekom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P050','Nedostato�n� rast a podv��iva plodu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P070','Porucha s�visiaca so skr�tenou graviditou a s malou p�rodnou hmotnos�ou, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P080','Porucha s�visiaca s pred�enou graviditou a s vysokou p�rodnou hmotnos�ou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P100','Intrakrani�lne poranenie a krv�canie zapr��inen� poranen�m pri p�rode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P110','In� p�rodn� poranenie centr�lnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P120','P�rodn� poranenie vlasatej �asti hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P130','P�rodn� poranenie kostry',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P140','P�rodn� poranenie perif�rnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P150','In� poranenie pri p�rode',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P200','Vn�tromaternicov� hypoxia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P210','P�rodn� asfyxia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P220','Respira�n� tiese� [respiratory distress] novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P230','Vroden� z�pal p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P240','Novorodeneck� syndr�m z aspir�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P250','Interstici�lny emfyz�m a pr�buzn� stavy so vznikom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P260','P��cne krv�canie so vznikom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P270','Chronick� respira�n� choroba so vznikom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P280','In� respira�n� poruchy so vznikom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P290','Srdcovocievne poruchy so vznikom v perinat�lnom obdob�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P350','Vroden� v�rusov� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P360','Bakt�riov� sepsa u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P370','In� vroden� infek�n� a parazitov� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P380','Omfalit�da u novorodenca bez krv�cania alebo s miernym krv�can�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P390','In� infekcia �pecifick� pre perinat�lne obdobie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P500','Fet�lna strata krvi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P510','Krv�canie z pupo�n�ka novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P520','Vn�trolebkov� ne�razov� krv�canie plodu a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P530','Hemoragick� choroba plodu a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P540','In� krv�canie novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P550','Hemolytick� choroba plodu a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P560','Hydrops plodu v d�sledku hemolytickej choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P570','Jadrov� ikterus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P580','Novorodeneck� �lta�ka zapr��inen� inou nadmernou hemol�zou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P590','Novorodeneck� �lta�ka z in�ch a bli��ie neur�en�ch pr��in',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P600','Diseminovan� intravaskul�rna koagul�cia plodu a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P610','In� perinat�lna krvn� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P700','Prechodn� porucha metabolizmu sacharidov �pecifick� pre plod a novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P710','Prechodn� porucha metabolizmu v�pnika a hor��ka u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P720','In� prechodn� endokrinn� porucha u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P740','In� prechodn� elektrolytov� a metabolick� porucha u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P750','Mek�niov� ileus pri cystickej fibr�ze (E84.1�)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('P760','In� �revn� nepriechodnos� u novorodenca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M990','Biomechanick� po�kodenie, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N000','Ak�tny nefritick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N010','R�chlo progreduj�ci nefritick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N020','Recidivuj�ca a pretrv�vaj�ca hemat�ria',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N030','Chronick� nefritick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N040','Nefrotick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N050','Nefritick� syndr�m, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N060','Izolovan� protein�ria s morfologick�mi zmenami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N070','Heredit�rna nefropatia, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N080','Glomerulov� choroba pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N100','Ak�tna tubulointerstici�lna nefrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N110','Chronick� tubulointerstici�lna nefrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N120','Tubulointerstici�lna nefrit�da, neur�en� ako ak�tna, alebo chronick�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N130','Ob�truk�n� a refluxov� uropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N140','Tubulointerstici�lna a tubulov� choroba zapr��inen� liekmi alebo �a�k�mi kovmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N150','In� tubulointerstici�lna choroba obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N160','Tubulointerstici�lna choroba pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N170','Ak�tne zlyhanie obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N180','Chronick� choroba obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N190','Zlyhanie obli�iek, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N200','Konkrement obli�ky [nefroliti�za] a mo�ovodu [ureteroliti�za]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N210','Konkrement doln�ch mo�ov�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N220','Konkrement mo�ov�ch ciest pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N230','Obli�kov� kolika, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N250','Choroba vypl�vaj�ca z po�kodenia funkcie obli�kov�ch tubulov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N260','Scvrknut� obli�ka, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N270','Mal� obli�ka z nezn�mej pr��iny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N280','In� choroba obli�iek a mo�ovodov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N290','In� choroby obli�iek a mo�ovodov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N300','Cystit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N310','Nervovosvalov� dysfunkcia mo�ov�ho mech�ra, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N320','In� choroby mo�ov�ho mech�ra',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N330','Choroba mo�ov�ho mech�ra pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N340','Uretrit�da a uretrov� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N350','Strikt�ra uretry',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N360','In� choroby mo�ovej r�ry',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N370','Choroby uretry pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N390','In� choroba mo�ovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N400','Hyperpl�zia prostaty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N410','Z�palov� choroby prostaty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N420','In� choroba prostaty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N430','Hydrok�la a spermatok�la',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N440','Torzia semenn�ka a hidat�dy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N450','Orchit�da a epididymit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N460','Mu�sk� neplodnos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N470','Hyperplastick� predko�ka, fim�za a parafim�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N480','In� choroba penisu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N490','Z�palov� choroba mu�sk�ch pohlavn�ch org�nov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N500','In� choroby mu�sk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N510','Choroby mu�sk�ch pohlavn�ch org�nov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N600','Ben�gna dyspl�zia prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N610','Z�palov� choroba prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N620','Hypertrofia prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N630','Hr�ka v prsn�ku, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N640','In� choroby prsn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N700','Salpingit�da a ooforit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N710','Z�palov� choroba maternice, okrem kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N720','Z�palov� choroba kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N730','In� z�palov� choroba �ensk�ch panvov�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N740','Z�palov� choroby �ensk�ch panvov�ch org�nov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N750','Choroby Bartholinovej ��azy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N760','In� z�pal po�vy a vulvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N770','Vulvovagin�lne ulcer�cie a z�paly pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N800','Endometri�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N810','Prolaps  pohlavn�ch org�nov u �eny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N820','Fistula s postihnut�m �ensk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N830','Nez�palov� choroba vaje�n�ka, vaj��kovodu a �irok�ho v�zu maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N840','Polyp �ensk�ch pohlavn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N850','In� nez�palov� choroba maternice, okrem kr�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N860','Er�zia a ektropium kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N870','Dyspl�zia kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N880','In� nez�palov� choroby kr�ka maternice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N890','In� nez�palov� choroba po�vy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N900','In� nez�palov� choroba vulvy a hr�dze',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N910','Ch�baj�ca, slab� a zriedkav� men�tru�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N920','Nadmern�, �ast� a nepravideln� men�tru�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N930','In� abnorm�lne krv�canie z maternice alebo po�vy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N940','Boles� a in� odch�lky spojen� so �ensk�mi pohlavn�mi org�nmi a men�trua�n�m cyklom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N950','Menopauzov� a in� perimenopauzov� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N960','Sklon k habitu�lnemu potr�caniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N970','�ensk� neplodnos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N980','Komplik�cie spojen� s umel�m oplodnen�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('N990','Choroba mo�ovopohlavn�ch org�nov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O000','Mimomaternicov� gravidita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O010','Mola hydatidosa',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O020','In� abnorm�lny v�tvor po�atia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O030','Spont�nny potrat',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O040','Lek�rsky potrat',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O050','In� potrat',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O060','Potrat, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O070','Ne�spe�n� pokus o potrat',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O080','Komplik�cie po potrate, mimomaternicovej gravidite a gravidite s molou hydatidosa',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O100','Predt�m existuj�ca art�riov� hypertenzia, komplikuj�ca graviditu, p�rod a �estonedelie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O110','Predt�m existuj�ca art�riov� hypertenzia komplikuj�ca graviditu, p�rod a �estonedelie, s nasadaj�cou preeklampsiou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O120','Gesta�n� (zapr��inen� graviditou) opuchy a protein�ria bez hypertenzie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O130','Gesta�n� (zapr��inen� graviditou) art�riov� hypertenzia bez v�znamnej protein�rie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O140','Gesta�n� (zapr��inen� graviditou) art�riov� hypertenzia s v�znamnou protein�riou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O150','Eklampsia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O160','Art�riov� hypertenzia matky, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O200','Krv�canie vo v�asnej gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O210','Nadmern� vracanie v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O220','�ilov� choroby ako komplik�cie v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O230','Infekcia mo�ovopohlavn�ch org�nov v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O240','Diabetes mellitus v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O250','Podv��iva v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O260','Starostlivos� o matku pre in� stavy s�visiace najm� s graviditou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O280','Abnorm�lny n�lez pri prenat�lnom skr�ningu matky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O290','Komplik�cie anest�zie v gravidite',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('O300','Viacplodov� gravidita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L420','Pityriasis rosea',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L430','Lichen ruber planus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L440','In� papuloskvam�zna choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L450','Papuloskvam�zna (pupencovo-�upinov�) choroba ko�e pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L500','�ih�avka [urticaria]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L510','Erythema exsudativum multiforme',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L520','Erythema nodosum',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L530','In� eryt�mov� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L540','Eryt�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L550','Ak�tna sol�rna dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L560','In� ak�tne zmeny ko�e zapr��inen� ultrafialov�m �iaren�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L570','Zmeny ko�e zapr��inen� chronick�m vystaven�m neionizuj�cemu �iareniu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L580','R�diodermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L590','In� po�kodenie ko�e a podko�n�ho tkaniva zapr��inen� �iaren�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L600','Choroba nechtov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L620','Choroba nechtov pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L630','Alopecia areata',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L640','Androg�nna alop�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L650','In� nejazvov� strata vlasov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L660','Jazvov� alop�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L670','Abnormality farby a tvaru vlasov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L680','Hypertrich�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L700','Akn�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L710','Rosacea',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L720','Folikulov� cysta ko�e a podko�n�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L730','In� choroba vlasov�ch folikulov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L740','Choroba ekrinn�ch potn�ch �liaz',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L750','Choroba apokrinn�ch potn�ch �liaz',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L800','Vitiligo',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L810','In� porucha pigment�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L820','Seboroick� kerat�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L830','Acanthosis nigricans',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L840','Kurie oko a mozo�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L850','In� zhrubnutia epidermy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L860','Keratoderma pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L870','Choroby transepiderm�lnej elimin�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L880','Pyoderma gangrenosum',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L890','Dekubitus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L900','Atrofick� choroby ko�e',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L910','Hypertrofick� choroba ko�e',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L920','Granulomat�zne choroby ko�e a podko�n�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L930','Lupus erythematosus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L940','In� lokalizovan� choroby spojivov�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L950','Vaskulit�da ohrani�en� na ko�u, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L970','Vred predkolenia, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L980','In� choroba ko�e a podko�n�ho tkaniva, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L990','In� choroby ko�e a podko�n�ho tkaniva pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M000','Pyog�nna artrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M010','Priame infekcie k�bu pri infek�n�ch a parazitov�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M020','Reakt�vne artropatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M030','Poinfek�n� a reakt�vna artrit�da pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M050','S�ropozit�vna reumatoidn� artrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M060','In� reumatoidn� artrit�dy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M070','Psoriatick� a enteropatick� artropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M080','Juveniln� artrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M090','Juveniln� artrit�da pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M100','Dna  [L�mka]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M110','In� kry�t�lov� artropatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M120','In� artropatie, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M130','In� artrit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M140','Artropatie pri in�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M150','Polyartr�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M160','Artr�za bedrov�ho k�bu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M170','Artr�za kolenn�ho k�bu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M180','Artr�za prv�ho karpometakarpov�ho k�bu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M190','In� artr�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M200','Z�skan� deformity prstov r�k a n�h',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M210','In� z�skan� deformity kon�at�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M220','Choroby pately',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M230','Vn�torn� porucha kolenn�ho k�bu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M240','In� �pecifick� poruchy k�bov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M250','In� choroba k�bu, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M300','Polyarteriitis nodosa a pr�buzn� choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M310','In� nekrotizuj�ce vaskulopatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M320','Syst�mov� lupus erythematosus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M330','Dermatopolymyozit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M340','Syst�mov� skler�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M350','In� syst�mov� postihnutie spojiva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M360','Syst�mov� choroby spojiva pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M400','Kyf�za a lord�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M410','Skoli�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M420','Osteochondr�za chrbtice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M430','In� deformuj�ce dorzopatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M450','Ankylozuj�ca spondylit�da  [spondylitis ankylosans]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M460','In� z�palov� spondylopatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M470','Spondyl�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M480','In� spondylopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M490','Spondylopatia pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M500','Po�kodenie kr�nej medzistavcovej platni�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M510','In� po�kodenie medzistavcovej platni�ky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M530','In� dorzopatie, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M540','Boles� chrbta [Dorzalgia]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M600','Myozit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M610','V�penatenie a kostnatenie svalov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M620','In� choroby svalov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M630','Choroby svalov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M650','Z�pal synovi�lnej blany a ��achovej po�vy [synovit�da a tendosynovit�da]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M660','Spont�nne roztrhnutie synovi�lnej blany a ��achy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M670','In� choroby synovi�lnej blany a ��achy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M680','Choroby synovi�lnej blany a �liach pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M700','Choroba m�kk�ho tkaniva v s�vislosti so za�a�ovan�m, pre�a�ovan�m a tlakom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M710','In� burzopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M720','Fibromat�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M730','Choroby m�kk�ho tkaniva pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M750','Po�kodenie pleca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M760','Entezopatia dolnej kon�atiny, okrem nohy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M770','In� entezopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M790','In� choroba m�kk�ho tkaniva, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M800','Osteopor�za s patologickou zlomeninou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M810','Osteopor�za bez patologickej zlomeniny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M820','Osteopor�za pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M830','Osteomal�cia v dospelosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M840','Porucha celistvosti kosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M850','In� poruchy hustoty a �trukt�ry kost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M860','Osteomyelit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M870','Osteonekr�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M880','Deformuj�ca osteodystrofia  [Pagetova choroba]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M890','In� choroby kost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M900','Osteopatia pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M910','Juveniln� osteochondr�za bedra a panvy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M920','In� juveniln� osteochondr�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M930','In� osteochondropatie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M940','In� choroba chrupky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M950','In� z�skan� deformita svalovej a kostrovej s�stavy a spojivov�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L410','Parapsori�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('M960','Porucha svalovej a kostrovej s�stavy po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J450','Bronchi�lna astma',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J460','Status asthmaticus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J470','Bronchiekt�zie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J600','Pneumokoni�za ban�kov uho�n�ch ban�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J610','Pneumokoni�za zapr��inen� azbestom a in�mi anorganick�mi vl�knami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J620','Pneumokoni�za zapr��inen� prachom obsahuj�cim krem�k',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J630','Pneumokoni�za zapr��inen� in�mi anorganick�mi prachmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J640','Pneumokoni�za, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J650','Pneumokoni�za zdru�en� s tuberkul�zou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J660','Choroba d�chac�ch ciest zapr��inen� �pecifick�m organick�m prachom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J670','Alergick� alveolit�da zapr��inen� organick�m prachom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J680','Choroby d�chacej s�stavy zapr��inen� chemik�liami, plynmi, dymom a v�parmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J690','Z�pal p��c, zapr��inen� tuh�mi l�tkami a tekutinami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J700','Choroba d�chac�ch org�nov zapr��inen� in�mi vonkaj��mi faktormi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J800','Syndr�m respira�nej tiesne dospel�ch [ARDS]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J810','P��cny opuch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J820','Eozinofiln� p��cny infiltr�t, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J840','In� choroba interst�cia p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J850','Absces p��c a mediast�na',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J860','Pyotorax',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J900','Pohrudnicov� v�potok, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J910','Pohrudnicov� v�potok pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J920','Pohrudnicov� zrasty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J930','Pneumotorax',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J940','In� choroby pohrudnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J950','Choroby d�chac�ch ciest po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J960','Respira�n� insuficiencia, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J980','In� choroby d�chacej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J990','Choroby d�chacej s�stavy pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K000','Poruchy v�vinu a erupcie zubov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K010','Neprerezan� a vrasten� zuby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K020','Zubn� kaz',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K030','In� choroba tvrd�ch tkan�v zubov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K040','Choroby zubnej drene a periapik�lnych tkan�v',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K050','Z�pal �asien  a choroba parodontu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K060','In� choroba �asien a bezzub�ho alveolov�ho hrebe�a',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K070','Dentofaci�lne anom�lie (vr�tane ch�b zhryzu)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K080','In� choroby zubov a podporn�ch �trukt�r',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K090','Cysty v oblasti �st, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K100','In� choroby �e�ust�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K110','Choroba slinn�ch �liaz',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K120','Z�pal sliznice �st  a pr�buzn� choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K130','In� choroba pery a �stnej sliznice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K140','Choroba jazyka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K200','Ezofagit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K210','Gastroezof�gov� refluxov� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K220','In� choroba pa�er�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K230','Choroba pa�er�ka pri chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K250','Vred �al�dka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K260','Vred dvan�stnika',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K270','Peptick� vred bez bli��ieho ur�enia miesta',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K280','Peptick� vred jej�na',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K290','Gastrit�da a duodenit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K300','Dyspepsia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K310','In� choroba �al�dka a dvan�stnika',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K350','Ak�tna apendicit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K360','In� apendicit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K370','Apendicit�da, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K380','In� choroba �ervovit�ho pr�vesku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K400','Slabinov� prietr�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K410','Stehnov� prietr�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K420','Pupkov� prietr�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K430','Bru�n� prietr� [hernia ventralis]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K440','Br�nicov� prietr�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K450','In� bru�n� prietr�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K460','Bru�n� prietr�, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K500','Crohnova choroba [Enteritis regionalis]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K510','Ulcer�zna kolit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K520','In� neinfek�n� gastroenterit�da a kolit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K550','Cievna choroba �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K560','Paralytick� ileus  a mechanick� ileus  bez prietr�e',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K570','Divertikul�za �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K580','Syndr�m dr�div�ho �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K590','In� funk�n� porucha �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K600','Fis�ra a fistula an�lnej a rekt�lnej oblasti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K610','Absces v an�lnej a rekt�lnej oblasti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K620','In� choroby anusu a kone�n�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K630','In� choroby �reva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K650','Z�pal pobru�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K660','In� choroby pobru�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K670','Choroba pobru�nice pri infek�nej chorobe zatriedenej inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K700','Alkoholov� choroba pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K710','Toxick� choroba pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K720','Zlyh�vanie pe�ene, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K730','Chronick� hepatit�da, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K740','Fibr�za a cirh�za pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K750','In� z�palov� choroby pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K760','In� choroba pe�ene',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K770','Choroba pe�ene pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K800','�l�ov� kamene [choleliti�za]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K810','Cholecystit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K820','In� choroba �l�n�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K830','In� choroba �l�ov�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K850','Ak�tna pankreatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K860','In� choroba pod�al�dkovej ��azy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K870','Choroby �l�n�ka, �l�ov�ch ciest a pod�al�dkovej ��azy pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K900','�revn� malabsorpcia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K910','Choroby tr�viacej s�stavy po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K920','In� choroby tr�viacej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('K930','Choroby in�ch tr�viacich org�nov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L000','Syndr�m obarenej ko�e zapr��inen� stafylokokmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L010','Impetigo',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L020','Ko�n� absces, furunkul a karbunkul',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L030','Flegm�na',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L040','Ak�tny z�pal lymfatick�ch uzl�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L050','Pilonid�lna cysta',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L080','In� lok�lna infekcia ko�e a podko�n�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L100','Pemfigus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L110','In� akantolytick� dermat�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L120','Pemfigoid',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L130','In� p�uzgierov� dermat�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L140','P�uzgierov� (bul�zna) dermat�za pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L200','Atopick� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L210','Seboroick� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L220','Plienkov� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L230','Alergick� kontaktn� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L240','Irita�n� kontaktn� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L250','Kontaktn� dermatit�da, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L260','Exfoliat�vna dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L270','Dermatit�da zapr��inen� l�tkami u�it�mi vn�torne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L280','Lichen simplex chronicus a prurigo',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L290','Svrbenie  [pruritus]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L300','In� dermatit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('L400','Psori�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J440','In� chronick� ob�truk�n� choroba p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H940','In� choroby ucha pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H950','Choroby ucha a hl�vkov�ho v�be�ku po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I000','Reumatick� hor��ka bez postihnutia srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I010','Reumatick� hor��ka s postihnut�m srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I020','Reumatick� chorea',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I050','Reumatick� choroba mitr�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I060','Reumatick� choroba aort�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I070','Reumatick� choroba trikuspid�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I080','Choroba viacer�ch chlopn�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I090','In� reumatick� choroba srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I100','Prim�rna [esenci�lna] art�riov� hypertenzia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I110','Hypertenzn� choroba srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I120','Hypertenzn� choroba obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I130','Hypertenzn� choroba srdca a obli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I150','Sekund�rna art�riov� hypertenzia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I200','Angina pectoris',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I210','Ak�tny infarkt myokardu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I220','�al�� infarkt myokardu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I230','Ur�it� ak�tne komplik�cie po ak�tnom infarkte myokardu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I240','In� ak�tna forma ischemickej choroby srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I250','Chronick� ischemick� choroba srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I260','P��cna emb�lia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I270','In� srdcovop��cne choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I280','In� choroba p��cnych ciev',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I300','Ak�tna perikardit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I310','In� choroby osrdcovn�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I320','Perikardit�da pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I330','Ak�tna a subak�tna endokardit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I340','Nereumatick� choroba mitr�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I350','Nereumatick� choroba aort�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I360','Nereumatick� choroby trikuspid�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I370','Choroba pulmon�lnej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I380','Endokardit�da bli��ie neur�enej chlopne',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I390','Endokardit�da a chlop�ov� chyba pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I400','Ak�tna myokardit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I410','Myokardit�da pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I420','Kardiomyopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I430','Kardiomyopatia pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I440','Atrioventrikul�rna blok�da a blok�da �av�ho ramienka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I450','In� porucha vedenia srdcov�ch vzruchov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I460','Zastavenie srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I470','Paroxyzm�lna tachykardia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I480','Fibril�cia predsien� a flater predsien�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I490','In� srdcov� arytmia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I500','Zlyh�vanie srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I510','Komplik�cie choroby srdca a nepresne op�san� choroba srdca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I520','In� choroba srdca pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I600','Subarachnoid�lne krv�canie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I610','Vn�tromozgov� krv�canie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I620','In� ne�razov� intrakrani�lne krv�canie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I630','Mozgov� infarkt',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I640','Cievna mozgov� pr�hoda bli��ie neur�en� ako krv�canie alebo infarkt',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I650','Uz�ver a z��enie pr�vodn�ch mozgov�ch tepien, ktor� neviedli k mozgov�mu infarktu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I660','Uz�ver a z��enie mozgov�ch tepien, ktor� neviedli k mozgov�mu infarktu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I670','In� cievna choroba mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I680','Cievna choroba mozgu pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I690','N�sledky cievnych chor�b mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I700','Ateroskler�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I710','Aneuryzma  a disekcia  aorty',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I720','In� aneuryzma a disekcia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I730','In� choroby perif�rnych ciev',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I740','Emb�lia a tromb�za tepny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I770','In� choroba tepien a tepni�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I780','Choroba vl�so�n�c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I790','Choroba tepien, tepni�iek a vl�so�n�c pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I800','Tromb�za, flebit�da a tromboflebit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I810','Tromb�za v. portae',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I820','In� �ilov� emb�lia a tromb�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I830','Varixy doln�ch kon�at�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I840','Hemoroidy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I850','Varixy pa�er�ka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I860','Varixy na in�ch miestach',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I870','In� choroby ��l',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I880','Ne�pecifick� lymfadenit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I890','In� neinfek�n� choroba lymfatick�ch ciev a lymfatick�ch uzl�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I950','Art�riov� hypotenzia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I970','Komplik�cie obehovej s�stavy po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I980','In� poruchy obehovej s�stavy pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('I990','In� a bli��ie neur�en� choroba obehovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J000','Ak�tna z�pal nosohltana [n�dcha]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J010','Ak�tny z�pal prinosov�ch dut�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J020','Ak�tny z�pal hltana',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J030','Ak�tny z�pal mandl�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J040','Ak�tny z�pal hrtana a priedu�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J050','Ak�tny ob�truk�n� z�pal hrtana [krup] a ak�tny z�pal hrtanovej pr�klopky [epiglotit�da]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J060','Ak�tna infekcia horn�ch d�chac�ch ciest na viacer�ch a bli��ie neur�en�ch miestach',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J090','Chr�pka zapr��inen� ur�it�m identifikovan�m v�rusom chr�pky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J100','Chr�pka zapr��inen� in�m identifikovan�m v�rusom chr�pky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J110','Chr�pka zapr��inen� neidentifikovan�m v�rusom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J120','V�rusov� z�pal p��c, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J130','Z�pal p��c, zapr��inen� Streptococcus pneumoniae',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J140','Z�pal p��c zapr��inen� Haemophilus influenzae',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J150','Bakt�riov� z�pal p��c, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J160','Z�pal p��c zapr��inen� in�m mikroorganizmom, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J170','Z�pal p��c pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J180','Z�pal p��c zapr��inen� bli��ie neur�en�m mikroorganizmom',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J200','Ak�tny z�pal priedu�iek  [ak�tna bronchit�da]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J210','Ak�tny z�pal priedu�ni�iek [ak�tna bronchiolit�da]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J220','Ak�tna infekcia doln�ch d�chac�ch ciest, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J300','Vazomotorick� a alergick� rinit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J310','Chronick� z�pal nosa, nosohltana a hltana',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J320','Chronick� z�pal prinosov�ch dut�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J330','Nosov� polyp',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J340','In� choroba nosa a prinosov�ch dut�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J350','Chronick� choroba mandl� a adenoidn�ho tkaniva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J360','Peritonzil�rny absces',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J370','Chronick� laryngit�da a chronick� laryngotracheit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J380','Choroba hlasiviek a hrtana, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J390','In� choroba horn�ch d�chac�ch ciest',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J400','Bronchit�da, neur�en� ako ak�tna alebo chronick�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J410','Jednoduch� a hlienovohnisov� chronick� bronchit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J420','Chronick� bronchit�da, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('J430','Emfyz�m p��c',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G250','In� extrapyram�dov� porucha a porucha hybnosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G260','Extrapyram�dov� poruchy a poruchy hybnosti pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G300','Alzheimerova choroba (F00.-*)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G310','In� degenerat�vna choroba nervovej s�stavy, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G320','In� degenerat�vna choroba nervovej s�stavy pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G350','Roztr�sen� skler�za [Sclerosis multiplex, Encephalomyelitis disseminata]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G360','In� ak�tna roztr�sen� [diseminovan�] demyeliniz�cia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G370','In� demyeliniza�n� choroba centr�lnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G400','Epilepsia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G410','Epileptick� stav  [Status epilepticus]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G430','Migr�na',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G440','In� syndr�m bolesti hlavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G450','Prechodn� mozgov� isch�mia  a pr�buzn� syndr�my',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G460','Cievne mozgov� syndr�my pri mozgov�ch cievnych chorob�ch (I60-I67�)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G470','Poruchy sp�nku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G500','Porucha trojklan�ho nervu [n. trigeminus]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G510','Porucha tv�rov�ho tv�rov�ho nervu [n.facialis]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G520','Poruchy ostatn�ch hlavov�ch nervov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G530','Poruchy hlavov�ch nervov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G540','Choroby nervov�ch kore�ov a splet�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G550','Kompresia nervov�ch kore�ov a splet� pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G560','Mononeuropatia hornej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G570','Mononeuropatia dolnej kon�atiny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G580','In� mononeuropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G590','Mononeuropatia pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G600','Dedi�n� a idiopatick� neuropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G610','Z�palov� polyneuropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G620','In� polyneuropatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G630','Polyneuropatia pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G640','In� porucha perif�rnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G700','Myasthenia gravis a in� nervovosvalov� choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G710','Prim�rna  myopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G720','In� myopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G730','Choroba s poruchou nervovosvalovej platni�ky a svalu pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G800','Detsk� mozgov� obrna',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G810','Hemipar�za a hemipl�gia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G820','Parapar�za a parapl�gia, tetrapar�za a tetrapl�gia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G830','In� paralytick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G900','Porucha auton�mnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G910','Hydrocefalus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G920','Toxick� encefalopatia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G930','In� choroba mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G940','In� choroba mozgu pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G950','In� choroba miechy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G960','In� choroby centr�lnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G970','Choroba nervovej s�stavy po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G980','In� choroba nervovej s�stavy, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G990','In� choroby nervovej s�stavy pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H000','Hordeolum  a chalazion',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H010','In� z�pal mihalnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H020','In� choroba mihalnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H030','Choroby mihalnice pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H040','Choroba slzn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H050','Choroba o�nice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H060','Choroba slzn�ch org�nov a o�nice pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H100','Konjuktivit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H110','In� choroba spojovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H130','Choroba spojovky pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H150','Choroby bielka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H160','Keratit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H170','Jazva a z�kal rohovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H180','In� choroba rohovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H190','Choroba o�n�ho bielka a rohovky pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H200','Iridocyklit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H210','In� choroba d�hovky  a vr�skovca [corpus ciliare]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H220','Choroby d�hovky a vr�skovca pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H250','Seniln� katarakta',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H260','In� katarakta',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H270','In� choroba �o�ovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H280','Katarakta a in� choroby �o�ovky pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H300','Chorioretinit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H310','In� choroba cievovky',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H320','Choroby cievovky a sietnice  pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H330','Odl�penie sietnice a natrhnutie sietnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H340','Okl�zia ciev sietnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H350','In� choroby sietnice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H360','Choroba sietnice pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H400','Glauk�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H420','Glauk�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H430','Choroba sklovca',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H440','Choroba o�nej gule',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H450','Choroba sklovca a o�nej gule pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H460','Z�pal zrakov�ho nervu [neuritis n. optici]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H470','In� choroba zrakov�ho nervu a zrakov�ch dr�h',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H480','Choroba zrakov�ho nervu  [n.opticus] a zrakov�ch dr�h pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H490','Paralytick� strabizmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H500','In� strabizmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H510','In� porucha binokul�rnych pohybov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H520','Porucha refrakcie a akomod�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H530','Porucha videnia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H540','Slepota a slabozrakos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H550','Nystagmus a in� nepravideln� pohyby oka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H570','In� choroby oka a jeho adnexov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H580','In� choroba oka a jeho adnexov pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H590','Choroby oka a jeho adnexov po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H600','Z�pal vonkaj�ieho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H610','In� chorobym vonkaj�ieho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H620','Choroba vonkaj�ieho ucha pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H650','Nehnisov� z�pal stredn�ho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H660','Hnisov� a bli��ie neur�en� z�pal stredn�ho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H670','Z�pal stredn�ho ucha pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H680','Z�pal a uz�ver sluchovej trubice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H690','In� choroba sluchovej trubice',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H700','Z�pal hl�vkov�ho v�be�ku a pr�buzn� choroby',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H710','Cholesteat�m stredn�ho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H720','Perfor�cia  blany bubienka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H730','In� choroby blany bubienka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H740','In� choroba stredn�ho ucha a hl�vkov�ho v�be�ku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H750','In� choroba stredn�ho ucha a hl�vkov�ho v�be�ku pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H800','Otoskler�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H810','Poruchy vestibul�rnej funkcie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H820','Z�vratov� syndr�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H830','In� choroby vn�torn�ho ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H900','Prevodov� a percep�n�  strata sluchu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H910','In� strata sluchu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H920','Boles� v uchu a v�tok z ucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('H930','In� choroby ucha, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E890','Endokrinn� a metabolick� porucha po lek�rskom v�kone, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E900','Nutri�n� a metabolick� porucha pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F000','Demencia pri Alzheimerovej chorobe (G30.-�)',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F010','Vaskul�rna demencia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F020','Demencia pri in�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F030','Demencia, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F040','Organick� amnestick� syndr�m nezapr��inen� alkoholom alebo in�mi psychoakt�vnymi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F050','Del�rium nezapr��inen� alkoholom alebo in�mi psychoakt�vnymi l�tkami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F060','In� du�evn� poruchy zapr��inen� po�koden�m a dysfunkciou mozgu a somatickou chorobou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F070','Poruchy osobnosti a spr�vania zapr��inen� chorobou, po�koden�m a dysfunkciou mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F090','Organick� alebo symptomatick� psychick� porucha, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F100','Porucha psychiky a spr�vania zapr��inen� u��van�m alkoholu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F110','Porucha psychiky a spr�vania zapr��inen� u��van�m opi�tov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F120','Porucha psychiky a spr�vania zapr��inen� u��van�m kanabinoidov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F130','Porucha psychiky a spr�vania zapr��inen� u�it�m (u��van�m) sedat�v alebo hypnot�k',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F140','Porucha psychiky a spr�vania zapr��inen� u��van�m koka�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F150','Porucha psychiky a spr�vania zapr��inen�, u��van�m in�ch stimulanci� vr�tane kofe�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F160','Porucha psychiky a spr�vania zapr��inen� u��van�m halucinog�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F170','Porucha psychiky a spr�vania zapr��inen� u��van�m tabaku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F180','Porucha psychiky a spr�vania zapr��inen� u��van�m prchav�ch rozp���adiel',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F190','Porucha psychiky a spr�vania zapr��inen� u��van�m viacer�ch drog a in�ch psychoakt�vnych l�tok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F200','Schizofr�nia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F210','Schizotypov� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F220','Pretrv�vaj�ce poruchy s bludmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F230','Ak�tne a prechodn� psychotick� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F240','Indukovan� porucha s bludmi',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F250','Schizoafekt�vne poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F280','In� neorganick� psychotick� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F290','Neorganick� psych�za, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F300','Manick� epiz�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F310','Bipol�rna afekt�vna porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F320','Depres�vna epiz�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F330','Recidivuj�ca depres�vna porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F340','Pretrv�vaj�ca afekt�vna porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F380','In� afekt�vne poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F390','Afekt�vna porucha, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F400','F�bick� �zkostn� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F410','In� �zkostn� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F420','Obsedantno-kompulz�vna porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F430','Reakcia na �a�k� stres a adapta�n� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F440','Disociat�vne [konverzn�] poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F450','Somatoformn� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F480','In� neurotick� poruchy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F500','Porucha pr�jmu potravy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F510','Neorganick� porucha sp�nku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F520','Poruchy pohlavn�ch funkci� nezapr��inen� organickou poruchou alebo chorobou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F530','Porucha psychiky a spr�vania v �estonedel�, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F540','Psychick� faktory a faktory spr�vania spojen� s poruchami alebo chorobami zatrieden�mi inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F550','�kodliv� u��vanie l�tok, ktor� nevytv�raj� z�vislos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F590','Poruchy spr�vania spojen� s poruchami fyziologick�ch funkci� a somatick�ch faktorov, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F600','�pecifick� poruchy osobnosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F610','Zmie�an� a in� porucha osobnosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F620','Pretrv�vaj�ca zmena osobnosti, ktor� nemo�no pris�di� po�kodeniu alebo chorobe mozgu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F630','Porucha n�vykov a impulzov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F640','Porucha pohlavnej identity',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F650','Porucha sexu�lneho zamerania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F660','Porucha psychiky a spr�vania spojen� so sexu�lnym v�vinom a orient�ciou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F680','In� porucha osobnosti a spr�vania dospel�ch',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F690','Porucha osobnosti a spr�vania dospel�ch, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F700','Mierna du�evn� zaostalos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F710','Stredne �a�k� du�evn� zaostalos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F720','�a�k� du�evn� zaostalos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F730','Hlbok� du�evn� zaostalos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F780','In� du�evn� zaostalos�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F790','Du�evn� zaostalos�, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F800','�pecifick� v�vinov� porucha re�i a jazyka',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F810','�pecifick� porucha v�vinu �kolsk�ch zru�nost�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F820','�pecifick� porucha v�vinu motorick�ch funkci�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F830','Zmie�an� �pecifick� v�vinov� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F840','Pervaz�vna v�vinov� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F880','In� porucha psychick�ho v�vinu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F890','Porucha psychick�ho v�vinu, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F900','Hyperkinetick� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F910','Porucha spr�vania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F920','Zmie�an� porucha spr�vania a emotivity',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F930','Porucha emotivity v detskom veku',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F940','Porucha soci�lneho fungovania so za�iatkom v detstve a po�as dospievania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F950','Tikov� porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F980','In� porucha spr�vania a emotivity so zvy�ajn�m za�iatkom v detstve a po�as dospievania',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('F990','Du�evn� porucha, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G000','Bakt�riov� meningit�da, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G010','Meningit�da pri bakt�riov�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G020','Meningit�da pri in�ch infek�n�ch a parazitov�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G030','Meningit�da zapr��inen� in�mi a bli��ie neur�en�ch pr��inami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G040','Encefalit�da, myelit�da a encefalomyelit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G050','Encefalit�da, myelit�da a encefalomyelit�da pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G060','Intrakrani�lny a intraspin�lny absces a granul�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G070','Intrakrani�lny a intraspin�lny absces a granul�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G080','Intrakrani�lna a intraspin�lna flebit�da a tromboflebit�da',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G090','N�sledky z�palov�ch chor�b centr�lnej nervovej s�stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G100','Huntingtonova choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G110','Dedi�n� ataxia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G120','Spin�lna svalov� atrofia a pr�buzn� syndr�my',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G130','Syst�mov� atrofia prvotne postihuj�ca centr�lny nervov� syst�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G200','Parkinsonova choroba',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G210','Sekund�rny Parkinsonov syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G220','Parkinsonov syndr�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G230','In� degenerat�vna choroba baz�lnych gangli�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('G240','Dyst�nia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D430','N�dor s neur�it�m alebo nezn�mym spr�van�m: mozog a centr�lna nervov� s�stava','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'N�dor s neur�it�m alebo nezn�mym spr�van�m: perif�rne nervy a auton�mna nervov� s�stava (D48.2)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D440','N�dor s neur�it�m alebo nezn�mym spr�van�m: ��azy s vn�torn�m vylu�ovan�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D450','Polycythaemia vera','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D460','Myelodysplastick� syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D470','In� n�dor lymfatick�ho, krvotvorn�ho a pr�buzn�ho tkaniva s neur�it�m alebo nezn�mym spr�van�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D480','N�dor na in�ch a bli��ie neur�en�ch miestach s neur�it�m alebo nezn�mym spr�van�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D500','An�mia z nedostatku �eleza',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D510','An�mia z nedostatku vitam�nu B12',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D520','An�mia z nedostatku kyseliny listovej',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D530','In� nutri�n� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D550','An�mia zapr��inen� poruchou enz�mov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D560','Talas�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D570','Kos��ikovit� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D580','In� dedi�n� hemolytick� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D590','Z�skan� hemolytick� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D600','Z�skan� �ist� apl�zia �erven�ch krviniek [erytroblastop�nia] [pure red cell aplasia]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D610','In� aplastick� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D620','Ak�tna posthemoragick� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D630','An�mia pri chronick�ch chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D640','In� an�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D650','Diseminovan� intravaskul�rna koagul�cia [Defibrina�n� syndr�m]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D660','Dedi�n� nedostatok faktora VIII',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D670','Dedi�n� nedostatok faktora IX',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D680','In� poruchy koagul�cie',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D690','Purpura a in� stavy krv�cavosti',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D700','Agranulocyt�za a neutrop�nia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D710','Funk�n� porucha polymorfonukle�rnych neutrofilov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D720','In� porucha bielych krviniek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D730','Choroba sleziny',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D740','Methemoglobin�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D750','In� choroba krvi a krvotvorn�ch org�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D760','In� choroby s ��as�ou lymforetikulov�ho a retikulohistiocytov�ho tkaniva, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D770','In� syndr�m histiocyt�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D800','Imunodeficit s prevahou nedostatku protil�tok',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D810','Kombinovan� imunodeficit',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D820','Imunodeficit spojen� s in�mi �a�k�mi poruchami',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D830','Be�n� premenliv� imunodeficit  [common variable immunodeficiency -CVID]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D840','In� imunodeficit',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D860','Sarkoid�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D890','In� porucha s ��as�ou imunitn�ch mechanizmov, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E000','Vroden� syndr�m z nedostatku j�du',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E010','Choroba �t�tnej ��azy spojen� s nedostatkom j�du a pridru�en� stavy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E020','Subklinick� hypotyre�za z nedostatku j�du',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E030','In� hypotyre�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E040','In� netoxick� struma',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E050','Hypertyre�za [Tyreotoxik�za]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E060','Z�pal �t�tnej ��azy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E070','In� choroba �t�tnej ��azy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E100','Diabetes mellitus 1. typu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E110','Diabetes mellitus 2. typu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E120','Diabetes mellitus spojen� s podv��ivou',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E130','In� diabetes mellitus, bli��ie ur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E140','Diabetes mellitus, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E150','Nediabetick� hypoglykemick� k�ma',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E160','In� porucha vn�torn�ho vylu�ovania pod�al�dkovej ��azy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E200','Hypoparatyre�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E210','Hyperparatyre�za a in� choroby pri�t�tnych �liaz',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E220','Hyperfunkcia hypof�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E230','Hypofunkcia a in� choroby hypof�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E240','Cushingov syndr�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E250','Adrenogenit�lna porucha',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E260','Hyperaldosteronizmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E270','In� choroba nadobli�iek',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E280','Porucha funkcie vaje�n�kov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E290','Porucha funkcie semenn�kov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E300','Porucha puberty, nezatrieden� inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E310','Porucha �innosti viacer�ch �liaz s vn�torn�m vylu�ovan�m [polyglandul�rna dysfunkcia]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E320','Choroba t�musu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E340','In� choroba �liaz s vn�torn�m vylu�ovan�m',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E350','Porucha �liaz s vn�torn�m vylu�ovan�m pri chorob�ch zatrieden�ch inde',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E400','Kva�iorkor',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E410','Nutri�n� marazmus',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E420','Marantick� kva�iorkor',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E430','�a�k� prote�novo-energetick� podv��iva, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E440','Prote�novo-energetick� podv��iva stredn�ho a mierneho stup�a',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E450','Zaost�vanie vo v�vine v d�sledku prote�novo-energetickej podv��ivy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E460','Prote�novo-energetick� podv��iva, bli��ie neur�en�',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E500','Nedostatok vitam�nu A',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E510','Nedostatok tiam�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E520','Nedostatok niac�nu [Pellagra]',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E530','Nedostatok in�ho vitam�nu skupiny B',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E540','Nedostatok vitam�nu C',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E550','Nedostatok vitam�nu D',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E560','In� nedostatok vitam�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E580','Nedostatok v�pnika vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E590','Nedostatok sel�nu vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E600','Nedostatok zinku vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E610','Nedostatok in�ho stopov�ho prvku vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E630','In� nedostatok vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E640','N�sledky podv��ivy a in�ch nedostatkov vo v��ive',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E650','Lokalizovan� obezita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E660','Obezita',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E670','In� nadmern� v��iva',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E680','N�sledok nadmernej v��ivy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E700','Porucha metabolizmu aromatick�ch aminokysel�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E710','Poruchy metabolizmu aminokysel�n s rozvetven�m re�azcom a poruchy metabolizmu mastn�ch kysel�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E720','In� porucha metabolizmu aminokysel�n',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E730','Intolerancia lakt�zy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E740','In� porucha metabolizmu sacharidov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E750','Porucha metabolizmu sfingolipidov a in� porucha ukladania lipidov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E760','Porucha metabolizmu glykozaminoglyk�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E770','Porucha metabolizmu glykoprote�nov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E780','Porucha metabolizmu lipoprote�nov a in� lipid�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E790','Porucha metabolizmu pur�nu a pyrimid�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E800','Porucha metabolizmu porfyr�nu a bilirub�nu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E830','Porucha metabolizmu miner�lov',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E840','Cystick� fibr�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E850','Amyloid�za',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E860','Dehydrat�cia, hypovol�mia',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E870','In� porucha rovnov�hy tekut�n, elektrolytov a acidob�zickej rovnov�hy',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('E880','In� porucha metabolizmu',null,null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D050','Karcin�m in situ prsn�ka','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,'Karcin�m in situ ko�e prsn�ka (D04.5), Melan�m in situ ko�e prsn�ka (D03.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D060','Karcin�m in situ kr�ka maternice','Karcinoma in situ kr�ka maternice',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,'Intraepitelov� n�dor kr�ka maternice [CIN] III. stup�a','Vysokostup�ov� dyspl�zia kr�ka maternice bez bli��ieho ur�enia (N87.2), Melan�m in situ kr�ka maternice (D03.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D070','Karcin�m in situ in�ch a bli��ie neur�en�ch pohlavn�ch org�nov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melan�m in situ (D03.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D090','Karcin�m in situ na in�ch a bli��ie neur�en�ch miestach','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Melan�m in situ (D03.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D100','Nezhubn� n�dor �st a hltana','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D110','Nezhubn� n�dor ve�k�ch slinn�ch �liaz','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� n�dory mal�ch slinn�ch �liaz bez bli��ieho ur�enia (D10.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D120','Nezhubn� n�dor hrub�ho �reva, kone�n�ka, anusu a an�lneho kan�la','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D130','Nezhubn� n�dor in�ch a nepresne ur�en�ch �ast� tr�viacej s�stavy','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D140','Nezhubn� n�dor stredn�ho ucha a d�chacej s�stavy','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D150','Nezhubn� n�dor in�ch a bli��ie neur�en�ch vn�trohrudn�kov�ch org�nov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D160','Nezhubn� n�dor kosti a k�bovej chrupky','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Keratocystick� odontog�nny n�dor','Nezhubn� n�dor synovi�lnej blany (D21.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D170','Nezhubn� lipomat�zny n�dor','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M885 � M888 so stup�om malignity /0',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D180','Hemangi�m a lymfangi�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M912 � M917 so stup�om malignity /0','Modr� alebo pigmentov� n�vus (D22.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D190','Nezhubn� n�dor mezotelov�ho tkaniva','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M905 so stup�om malignity /0',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D200','Nezhubn� n�dor m�kk�ho tkaniva retroperitonea a peritonea','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� n�dor tukov�ho tkaniva pobru�nice a retroperitonea (D17.7), Nezhubn� n�dor mezotelov�ho tkaniva (D19.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D210','In� nezhubn� n�dor spojivov�ho a in�ho m�kk�ho tkaniva','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Krvn� cieva, Burza, Fascia, Tukov� tkanivo, Chrupka',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D220','Melanocytov� n�vus','Nezhubn� n�dory ko�e',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Morfologick� k�d M872 � M879 so stup�om malignity /0, Vlasat� n�vus (Nevus pilosus)',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D230','In� nezhubn� n�dor ko�e','Nezhubn� n�dory ko�e',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� n�dor tukov�ho tkaniva (D17.0 � D17.3), Melanocytov� n�vus (D22.-)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D240','Nezhubn� n�dor prsn�ka','Nezhubn� n�dory prsn�ka',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� dyspl�zia prsn�ka (N60.-), Nezhubn� n�dor ko�e prsn�ka (D22.5, D23.5)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D250','Leiomy�m maternice','Leiomy�m maternice',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,'Fibromy�m maternice',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D260','In� nezhubn� n�dor maternice','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D270','Nezhubn� n�dor vaje�n�ka','Nezhubn� n�dory vaje�n�ka',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D280','Nezhubn� n�dor in�ch a bli��ie neur�en�ch �ensk�ch pohlavn�ch org�nov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,'Adenomat�zny polyp, Nezhubn� n�dor ko�e �ensk�ch pohlavn�ch org�nov',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D290','Nezhubn� n�dor mu�sk�ch pohlavn�ch org�nov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'M',to_date('01.01.94','DD.MM.RR'),null,'Nezhubn� n�dor ko�e mu�sk�ch pohlavn�ch org�nov',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D300','Nezhubn� n�dor mo�ovej s�stavy','Nezhubn� n�dory mo�ov�ch org�nov',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D310','Nezhubn� n�dor oka a o�n�ch adnexov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� n�dor spojivov�ho tkaniva mihalnice (D21.0), Nezhubn� n�dor ko�e mihalnice (D22.1, D23.1), Nezhubn� n�dor optick�ho nervu (D33.3)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D320','Nezhubn� n�dor mozgovomiechov�ch obalov','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D330','Nezhubn� n�dor mozgu a in�ch �ast� centr�lnej nervovej s�stavy','Nezhubn� n�dory mozgu a in�ch �ast� centr�lneho nervov�ho syst�mu',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,'Angi�m (D18.0-), Nezhubn� n�dor mozgovomiechov�ch obalov (D32.-)',null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D340','Nezhubn� n�dor �t�tnej ��azy','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D350','Nezhubn� n�dor in�ch a bli��ie neur�en�ch �liaz s vn�torn�m vylu�ovan�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Nezhubn� n�dor endokrinnej �asti pankreasu (D13.7), Nezhubn� n�dor semenn�ka (D29.2), Nezhubn� n�dor vaje�n�ka (D27), Nezhubn� n�dor t�musu (D15.0)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D360','Nezhubn� n�dor na in�ch a bli��ie neur�en�ch miestach','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D370','N�dor �stnej dutiny a tr�viacich org�nov s neur�it�m alebo nezn�mym spr�van�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D380','N�dor s neur�it�m alebo nezn�mym spr�van�m: stredn� ucho, d�chacie a vn�trohrudn�kov� org�ne','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,'Srdce (D48.7)');
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D390','N�dor �ensk�ch pohlavn�ch org�nov s neur�it�m alebo nezn�mym spr�van�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'Z',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D400','N�dor mu�sk�ch pohlavn�ch org�nov s neur�it�m alebo nezn�mym spr�van�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'M',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D410','N�dor s neur�it�m alebo nezn�mym spr�van�m: mo�ov� s�stava','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
Insert into SYSTEM.CHOROBA (CIS_CHOROBA,NAZOV,SK_OCHORENI,OBM_VEK_OD,OBM_VEK_DO,OBM_POHLAVIE,VALID_OD,VALID_DO,DOPL_INFO_PATRI,DOPL_INFO_NEPATRI) values ('D420','N�dor mozgovomiechov�ch obalov s neur�it�m alebo nezn�mym spr�van�m','In� nezhubn� n�dory in situ a n�dory s neur�it�m a nezn�mym spr�van�m',null,null,'V',to_date('01.01.94','DD.MM.RR'),null,null,null);
REM INSERTING into SYSTEM.KRAJ
SET DEFINE OFF;
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('1','Bratislavsk�');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('2','Trnavsk�');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('3','Trenciansky');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('4','Nitriansky');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('5','�ilinsk�');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('6','Banskobystrick�');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('7','Pre�ovsk�');
Insert into SYSTEM.KRAJ (ID_KRAJ,NAZOV) values ('8','Ko�ick�');
REM INSERTING into SYSTEM.L_BALENIE
SET DEFINE OFF;
Insert into SYSTEM.L_BALENIE (KOD_BALENIA,ID_LIEK,SPOSOB_UHRADY,CENA,DOPLATOK,POCET_KS) values ('86052','1','I','1,68','1,68','24');
REM INSERTING into SYSTEM.LEKAR
SET DEFINE OFF;
Insert into SYSTEM.LEKAR (ID_LEKAR,ID_POUZIVATEL,ID_ODDEL,DO) values ('1','2','2',null);
REM INSERTING into SYSTEM.LIEK
SET DEFINE OFF;
Insert into SYSTEM.LIEK (ID_LIEK,NAZOV,REZIM_VYDAJA,LIEK_FORMA) values ('1','Paralen 500','F ','Tableta');
REM INSERTING into SYSTEM.LIEK_APLIKACIA
SET DEFINE OFF;
Insert into SYSTEM.LIEK_APLIKACIA (ID_LIEK,ID_OBLAST) values ('1','1');
Insert into SYSTEM.LIEK_APLIKACIA (ID_LIEK,ID_OBLAST) values ('1','2');
REM INSERTING into SYSTEM.LIEK_UCINNA_LATKA
SET DEFINE OFF;
Insert into SYSTEM.LIEK_UCINNA_LATKA (ID_LIEK,ID_LATKA) values ('1','1');
REM INSERTING into SYSTEM.MESTO
SET DEFINE OFF;
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Horn� Lieskov','874');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Horn� Pial','875');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Horn� Tisovn�k','876');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Horn� Vadi�ov','877');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Horovce','878');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Horovce','879');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Hos�ov�','880');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Hos�ovce','881');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Hos�ovce','882');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Hoste','883');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hosti�ovce','884');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hostice','885');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Hostie','886');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Hostovice','887');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Hozelec','888');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Hr�dok','889');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Hr�e�','890');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Hra�','891');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Hra�n�','892');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Hra�ov�k','893');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Doln� Plachtince','614');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Doln� Saliby','615');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Doln� Semerovce','616');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Doln� Srnie','617');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Doln� Strh�re','618');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Doln� Trhovi�te','619');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Doln� Vestenice','620');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Doln� Zahorany','621');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Doln� Zelenice','622');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Doln� Bad�n','623');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Doln� Bar','624');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Doln� Chot�r','625');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Doln� Harmanec','626');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Doln� Hri�ov','627');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Doln� Kaln�k','628');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Doln� Kub�n','629');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Doln� Lieskov','630');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Doln� Lopa�ov','631');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Doln� Ohaj','632');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Sv�t� Peter','633');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Doln� Pial','634');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Doln� Vadi�ov','635');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Domadice','636');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Doman�ky','637');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Domani�a','638');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Doma�ovce','639');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Donovaly','640');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Dr�ovce','641');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Dr�bsko','642');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Dr�a','643');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Dr�enice','644');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Dr�kovce','645');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Dra�ice','646');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Dra�kovce','647');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Drah�ov','648');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Drahovce','649');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Dravce','650');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Drien�any','651');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Drienica','652');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Drienov','653');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Drienovec','654');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Drienovo','655');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Drienovsk� Nov� Ves','656');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Drietoma','657');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Drnava','658');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Dru�stevn� pri Horn�de','659');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Dubinn�','660');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Dubn�k','661');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Dubni�ka','662');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Dubnica nad V�hom','663');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Dubno','664');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Dubodiel','665');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Dubov�','666');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Dubov�','667');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Dubov�','668');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Dubov�','669');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Dubovany','670');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Dubovce','671');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Dubovec','672');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Dubovica','673');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ducov�','674');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Dudince','675');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Dukovce','676');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Dulov','677');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Dulova Ves','678');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Dulovce','679');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Dulovo','680');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Dunajov','681');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Dunajsk� Lu�n�','682');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Dunajsk� Streda','683');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Dunajsk� Kl�tov','684');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Dupl�n','685');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Dvorany nad Nitrou','686');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Dvorec','687');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Dvorianky','688');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Dvorn�ky','689');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Dvory nad �itavou','690');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Egre�','691');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Fa�kov','692');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Falku�ovce','693');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Farn�','694');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Feki�ovce','695');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Fi�akovo','696');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Fi�akovsk� Kov��e','697');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Figa','698');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Fija�','699');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Fintice','700');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Folku�ov�','701');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Forbasy','702');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Fri�ka','703');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Fri�kovce','704');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Fri�ovce','705');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Fulianka','706');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','G��','707');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','G�novce','708');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','G�tovany','709');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Gab��kovo','710');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Gaboltov','711');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Gajary','712');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Galanta','713');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Galovany','714');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Gbe�any','715');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Gbelce','716');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Gbely','717');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ge�a','718');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Gelnica','719');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Gemer','720');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Gemer�ek','721');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Gemersk� H�rka','722');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Gemersk� Panica','723');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Gemersk� Poloma','724');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Gemersk� Ves','725');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Gemersk� Decht�re','726');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Gemersk� Michalovce','727');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Gemersk� Teplice','728');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Gemersk� Jablonec','729');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Gemersk� Sad','730');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Geraltov','731');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Gerlachov','732');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Gerlachov','733');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Giglovce','734');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Giraltovce','735');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Girovce','736');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Glabu�ovce','737');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Go�altovo','738');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Go�ovo','739');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Golianovo','740');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Gortva','741');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Gran�-Petrovce','742');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Gregorova Vieska','743');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Gregorovce','744');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Gribov','745');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Gruzovce','746');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Gy�ov','747');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','H�j','748');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','H�j','749');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','H�jske','750');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','H�rka','751');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','H�rka nad V�hom','752');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','H�rky','753');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','H��ov','754');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ha�ava','755');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ha��n','756');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ha��n nad Cirochou','757');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ha�l�n','758');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Habovka','759');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Habura','760');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Hajn� Nov� Ves','761');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hajn��ka','762');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Hajtovka','763');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Hal��ovce','764');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Hali�','765');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Haligovce','766');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Haluzice','767');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Hamuliakovo','768');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Handlov�','769');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Hanigovce','770');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Haniska','771');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Haniska','772');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Hankov�','773');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hankovce','774');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Hankovce','775');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Hanu�ovce nad Top�ou','776');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Harakovce','777');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Harhaj','778');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Harichovce','779');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Harmanec','780');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Hatalov','781');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Hatn�','782');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Havaj','783');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Havka','784');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Havranec','785');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','He�pa','786');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Helcmanovce','787');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Henckovce','788');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Henclov�','789');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Hencovce','790');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Hendrichovce','791');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Her�any','792');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Hermanovce','793');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Hermanovce nad Top�ou','794');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hertn�k','795');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hervartov','796');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Hiade�','797');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Hincovce','798');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Hladovka','799');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Hlbok�','800');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Hlbok� nad V�hom','801');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Hlin�k nad Hronom','802');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Hlinn�','803');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Hlivi�tia','804');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Hlohovec','805');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hn���a','806');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Hniezdne','807');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Hnil��k','808');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Hnilec','809');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Hnojn�','810');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hodejov','811');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hodejovec','812');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Hodkovce','813');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Hodru�a-H�mre','814');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hokovce','815');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Hol��kovce','816');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Hol��','817');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Holi�a','818');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Holiare','819');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Holice','820');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Holumnica','821');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Honce','822');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hontianska Vrbica','823');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Hontianske Moravce','824');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Hontianske Nemce','825');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Hontianske Tes�re','826');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hontianske Trs�any','827');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Hor�a','828');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Hor�any','829');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Horn� �tub�a','830');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Horn� �da�a','831');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Horn� Breznica','832');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Horn� Kr�ov�','833');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Horn� Krup�','834');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Horn� Lehota','835');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Horn� Lehota','836');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Horn� Marikov�','837');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Horn� Mi�in�','838');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Horn� Poruba','839');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Horn� Pot��','840');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Pot�nske L�ky','841');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Horn� S��a','842');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Horn� Se�','843');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Horn� Streda','844');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Horn� Strehov�','845');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Horn� Ves','846');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Horn� Ves','847');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Horn� �tit�re','848');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Horn� Chlebany','849');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Horn� Dubov�','850');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Horn� H�mre','851');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Horn� Lefantovce','852');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Horn� M�to','853');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Horn� Mladonice','854');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Horn� Na�tice','855');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Horn� Obdokovce','856');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Horn� Ore�any','857');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Horn� Otrokovce','858');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Horn� Plachtince','859');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Horn� Pr�any','860');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Horn� Saliby','861');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Horn� Semerovce','862');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Horn� Srnie','863');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Horn� Strh�re','864');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Horn� Turovce','865');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Horn� Trhovi�te','866');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Horn� Vestenice','867');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Horn� Zahorany','868');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Horn� Zelenice','869');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Horn� Bad�n','870');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Horn� Bar','871');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Horn� Hri�ov','872');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Horn� Kaln�k','873');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Bretka','420');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Breza','421');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Brezany','422');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Brezina','423');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Breziny','424');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Brezni�ka','425');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Brezni�ka','426');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Breznica','427');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Brezno','428');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Brezolupy','429');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Brezov','430');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Brezov� pod Bradlom','431');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Brezovec','432');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Brezovi�ka','433');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Brezovica','434');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Brezovica','435');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Brezovka','436');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Brhlovce','437');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Brie�tie','438');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Brodsk�','439');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Brodzany','440');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Brunovce','441');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Brusn�k','442');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Brusnica','443');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Brusno','444');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Brutovce','445');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Bruty','446');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Brvni�te','447');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Brzot�n','448');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Bu�any','449');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Bu�ince','450');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Bu�ovce','451');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Buclovany','452');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Bud�a','453');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Budi�','454');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Budikovany','455');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Budim�r','456');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Budin�','457');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Budince','458');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Budkovce','459');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Budmerice','460');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Buglovce','461');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Bukov�','462');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Bukovce','463');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bukovec','464');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Bukovec','465');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Bukovina','466');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Bulhary','467');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bunetice','468');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Bunkovce','469');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Buzica','470');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Buzitka','471');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','By�ta','472');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Bystr�','473');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Bystr�','474');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Bystr�','475');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Bystrany','476');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Bystri�any','477');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Bystri�ka','478');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Byt�a','479');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Bzenica','480');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Bzenov','481');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Bzince pod Javorinou','482');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Bziny','483');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Bzov�k','484');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Bzovsk� Leh�tka','485');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','C�fer','486');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Cabaj-��por','487');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Cabov','488');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Cakov','489');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Cejkov','490');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Cernina','491');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Cerov�','492');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Cerovo','493');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Cestice','494');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Ch�aba','495');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Chanava','496');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Chlebnice','497');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Chlmec','498');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Chme�nica','499');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Chme�ov','500');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Chme�ov�','501');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Chme�ovec','502');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Chmi�any','503');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Chminianska Nov� Ves','504');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Chminianske Jakubovany','505');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Cho�a','506');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Cho�kovce','507');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Chocholn�-Vel�ice','508');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Chorv�tsky Grob','509');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Chorv�ty','510');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Chot�a','511');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Chot�n','512');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Chr�mec','513');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Chr�any','514');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Chrabrany','515');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Chras� nad Horn�dom','516');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Chrastince','517');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Chrastn�','518');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Chrenovec-Brusno','519');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Chropov','520');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Chtelnica','521');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Chud� Lehota','522');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Chvalov�','523');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Chvojnica','524');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Chvojnica','525');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Chy�n�','526');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Chynorany','527');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Cige�','528');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Cige�ka','529');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Cigla','530');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Cimenn�','531');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Cinoba�a','532');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','D�brava','533');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','D�brava','534');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','D�brava','535');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','D�bravica','536');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','D�bravka','537');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','D�bravy','538');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Da�ov Lom','539');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Daletice','540');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Dani�ovce','541');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Dargov','542');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Davidov','543');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','De�erice','544');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Debra�','545');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Dechtice','546');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Deda�ov','547');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Dedina Ml�de�e','548');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Dedinka','549');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Dedinky','550');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Dek��','551');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Dem�novsk� Dolina','552');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Demandice','553');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Demjata','554');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Detr�k','555');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Detva','556');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Detvianska Huta','557');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Devi�any','558');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Devi�ie','559');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Diakov�','560');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Diakovce','561');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Div�n','562');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Diviacka Nov� Ves','563');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Diviaky nad Nitricou','564');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Divina','565');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Divinka','566');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Dl��n','567');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Dlh�','568');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Dlh� nad Kysucou','569');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Dlh� nad Oravou','570');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Dlh� nad V�hom','571');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Dlh� Ves','572');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Dlh� Kl�ovo','573');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Dlh� nad Cirochou','574');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Dlh� Pole','575');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Dlh� Str�e','576');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Dlho�a','577');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Do�any','578');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Do�any','579');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Dob�in�','580');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Dobr�','581');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Dobr� Niva','582');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Dobr� Voda','583');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Dobro�','584');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Kotmanov�','585');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Dobroho��','586');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Dobroslava','587');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Doh�any','588');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Doj�','589');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Dolinka','590');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Doln� �da�a','591');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Doln� Breznica','592');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Doln� Krup�','593');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Doln� Lehota','594');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Doln� Marikov�','595');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Doln� Mi�in�','596');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Doln� Poruba','597');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Doln� S��a','598');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Doln� Se�','599');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Doln� Streda','600');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Doln� Strehov�','601');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Doln� Ti�ina','602');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Doln� Trn�vka','603');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Doln� Ves','604');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Doln� Dubov�','605');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Doln� Ko�kovce','606');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Doln� Lefantovce','607');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Doln� Lov�ice','608');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Doln� Mladonice','609');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Doln� Na�tice','610');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Doln� Obdokovce','611');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Doln� Ore�any','612');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Doln� Otrokovce','613');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Batizovce','307');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Be�adikov�','308');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Be�adikovce','309');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Be�adovo','310');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Be�atina','311');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Be�u�','312');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Be�a','313');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Be�a','314');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Be�e�ov','315');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Be�e�ov�','316');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Be�ovce','317');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Becherov','318');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Beckov','319');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Beharovce','320');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Bel�','321');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Bel�','322');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Bel� nad Cirochou','323');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Bel�-Dulice','324');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Bel�n','325');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bel�a','326');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Beladice','327');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Belejovce','328');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Belina','329');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Belince','330');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Bellova Ves','331');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Belove�a','332');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Belu�a','333');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Beluj','334');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Beniakovce','335');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Benice','336');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Benkovce','337');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Bernol�kovo','338');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Bertotovce','339');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Betlanovce','340');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Betliar','341');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bidovce','342');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Biel','343');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Bielovce','344');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Biely Kostol','345');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Bijacovce','346');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Biskupice','347');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Biskupov�','348');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Bitarov�','349');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bla�ice','350');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Bla�ovce','351');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Blahov�','352');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Blatn� na Ostrove','353');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Blatn� Polianka','354');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Blatn�','355');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Blatn� Remety','356');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Blatn� Revi�tia','357');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Blatnica','358');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Blesovce','359');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Blhovce','360');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bo�iar','361');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Bo�','362');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Bo�kovce','363');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Bo��ca','364');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Bo�any','365');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Bo�any','366');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Bobot','367');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Bobrov','368');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Bobrov�ek','369');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Bobrovec','370');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Bobrovn�k','371');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Bod�ky','372');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Bodin�','373');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Bodorov�','374');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Bodovce','375');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Bodru�al','376');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Bodza','377');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Bodzianske L�ky','378');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Bogliarka','379');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Boh��ovo','380');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Bohdanovce','381');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Bohdanovce nad Trnavou','382');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Bohe�ov','383');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Bohunice','384');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Bohunice','385');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Bojn�','386');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Bojni�ky','387');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Bojnice','388');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Boldog','389');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Bole�ov','390');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Boler�z','391');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Boliarov','392');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Bor�any','393');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Bor�ice','394');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Bor�a','395');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Borcov�','396');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Borinka','397');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Borov�','398');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Borovce','399');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Borsk� Sv�t� Jur','400');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Borsk� Mikul�','401');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Bory','402');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Bottovo','403');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Bracovce','404');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Bran�','405');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Branovo','406');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Brav�covo','407');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Brd�rka','408');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Bre�any','409');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Brehov','410');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Brehy','411');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Brekov','412');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Brestov','413');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Brestov','414');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Brestov nad Laborcom','415');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Brestovany','416');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Brestovec','417');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Brestovec','418');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Bretejovce','419');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Bansk� Studenec','300');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Bara','301');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Barca','302');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Bardejov','303');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Bardo�ovo','304');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Barto�ova Leh�tka','305');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Barto�ovce','306');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�belov�','1');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','��ry','2');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','���ov','3');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','��','4');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�a�a','5');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�ab','6');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','�abalovce','7');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','�abiny','8');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','�abradsk� Vrbovok','9');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','�achtice','10');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�ajkov','11');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�aka','12');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�akajovce','13');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�akanovce','14');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�akanovce','15');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','�akany','16');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�aklov','17');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','�alovec','18');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Ve�k� Meder','19');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�amovce','20');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','�aradice','21');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','�ast�','22');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','�astkov','23');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','�astkovce','24');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�ata','25');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','�ataj','26');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','�avoj','27');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','�e�ehov','28');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�e�ejovce','29');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�e�adice','30');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','�e�ovce','31');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�elovce','32');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�ebovce','33');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�echy','34');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�echynce','35');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','�ekovce','36');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�el�re','37');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','�e�adince','38');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','�elkova Lehota','39');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�elovce','40');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','�enkovce','41');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','�er�n','42');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','�ere�any','43');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�eren�any','44');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','�erhov','45');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','�ermany','46');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�ern�k','47');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','�ernina','48');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','�ernochov','49');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','�erti�n�','50');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�erve�any','51');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�erven� Voda','52');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','�erven�k','53');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','�erven� Hr�dok','54');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','�erven� Kame�','55');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','�erven� Kl�tor','56');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ervenica','57');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�ervenica pri Sabinove','58');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','�esk� Brezovo','59');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','�i�arovce','60');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�i�ava','61');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','�i�many','62');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�i�atice','63');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','�ierna','64');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','�ierna Lehota','65');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','�ierna Lehota','66');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','�ierna nad Tisou','67');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','�ierna Voda','68');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','�ierne','69');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','�ierne K�a�any','70');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�ierne nad Top�ou','71');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','�ierne Pole','72');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','�ierny Balog','73');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','�ierny Brod','74');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�ierny Potok','75');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�if�re','76');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','�ili�sk� Radva�','77');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','�imhov�','78');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�ir�','79');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','�oltovo','80');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','�remo�n�','81');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','�u�ma','82');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','�ukalovce','83');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�a�ov','84');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','�anov�','85');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�apalovce','86');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','�ub�kovo','87');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','�ur�in�','88');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�ur�o�','89');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�ur�o��k','90');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','�ur�ov�','91');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�urkov','92');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�urkov�','93');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�urkovce','94');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','L��ky','95');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�ub�','96');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','�ube�a','97');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','�ubi�a','98');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','�ubica','99');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','�ubietov�','100');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','�uboch�a','101');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�ubore�','102');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�uborie�ka','103');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�ubot�n','104');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ubotice','105');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ubovec','106');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�udov�tov�','107');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�utina','108');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','�utov','109');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','�agov','110');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','��vo�','111');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','��d','112');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','��pkov','113');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','��pkov�','114');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','��rovce','115');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','��tovce','116');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','��tovo','117');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','�a�a','118');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','�a�ov�','119');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','�a�t�n-Str�e','120');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Torna�a','121');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�ahy','122');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','�ajd�kove Humence','123');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','�algo�ka','124');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','�algovce','125');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�alov','126');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�ambron','127');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','�amor�n','128');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','�amudovce','129');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','�andal','130');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�arbov','131');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ari�sk� Poruba','132');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ari�sk� Trsten�','133');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','�ari�sk� �ierne','134');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ari�sk� Bohdanovce','135');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�ari�sk� Dravce','136');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�ari�sk� Jastrabie','137');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�ari�sk� Micha�any','138');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','�ari�sk� Sokolovce','139');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�ari�sk� �tiavnik','140');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�arkan','141');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�arovce','142');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','�elpice','143');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�em�a','144');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�emetkovce','145');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','�enkvice','146');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','�i�ov','147');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�iatorsk� Bukovinka','148');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','�iba','149');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�imonovce','150');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�indliar','151');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','�intava','152');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�ir�kov','153');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�irkovce','154');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�irok�','155');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','�ivetice','156');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','�migovec','157');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','�olt�ska','158');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','�opor�a','159');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','�pa�ince','160');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','�pania Dolina','161');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�panie Pole','162');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','�rob�rov�','163');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','�t�tnik','164');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�t�s','165');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','�t�la','166');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�t�rovo','167');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','�tefanov','168');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','�tefanov nad Oravou','169');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','�tefanov�','170');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�tefanovce','171');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�tefanovce','172');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�tefanovi�ov�','173');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�tefurov','174');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','�terusy','175');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','�tiavni�ka','176');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','�tiavnick� Bane','177');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','�tiavnik','178');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�tit�re','179');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','�trba','180');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','�trkovec','181');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','�tvrtok','182');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','�tvrtok na Ostrove','183');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�u�a','184');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','�u�ava','185');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Sudince','186');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','�uja','187');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','�umiac','188');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','�urany','189');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�urianky','190');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','�urice','191');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','�v�bovce','192');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','�vedl�r','193');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Telg�rt','194');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','�vo�ov','195');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','�ape�ovo','196');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','�bre�','197');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','�dol','198');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','�horn�','199');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','��p','200');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�irany','201');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','�a�kov','202');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','�abokreky','203');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','�abokreky nad Nitrou','204');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','�akarovce','205');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','�akovce','206');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�alob�n','207');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�arnov','208');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','�arnovica','209');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','�bince','210');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','�da�a','211');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','�diar','212');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','�elovce','213');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�eh�a','214');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','�ehra','215');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','�elezn� Breznica','216');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�elezn�k','217');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�eliezovce','218');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','�elmanovce','219');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�emberovce','220');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','�emliare','221');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','�iar','222');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','�iar','223');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','�iar nad Hronom','224');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','�ibritov','225');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','�ih�rec','226');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','�ikava','227');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','�ilina','228');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ipov','229');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','�itavany','230');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','�itavce','231');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','�itn�-Radi�a','232');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','�lkovce','233');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�up�any','234');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','�upkov','235');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Abovce','236');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Abrah�m','237');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Abrah�movce','238');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Abrah�movce','239');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Abramov�','240');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Abranovce','241');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Adamovsk� Kochanovce','242');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Adidovce','243');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Alek�ince','244');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Andovce','245');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Andrejov�','246');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Sv�t� Anton','247');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Ardanovce','248');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ardovo','249');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Arnutovce','250');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','B��','251');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','B�b','252');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','B�dice','253');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','B�ho�','254');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','B�nov','255');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','B�novce nad Bebravou','256');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','B�novce nad Ondavou','257');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','B�tka','258');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','B�torov�','259');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','B�tovce','260');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','B��a','261');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','B��ovce','262');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','B�lkove Humence','263');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','B�rka','264');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','B��','265');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','B�any','266');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ba�ka','267');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ba�kov','268');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ba�kov�k','269');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Ba�an','270');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Ba�a','271');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ba�ka','272');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ba�kovce','273');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ba�kovce','274');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ba�ovce','275');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Bab�n','276');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Babie','277');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Babin�','278');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Babindol','279');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Babinec','280');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Bac�ch','281');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Bac�rov','282');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Bad�n','283');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Baj�','284');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Bajany','285');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Bajerov','286');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Bajerovce','287');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Bajka','288');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Bajtava','289');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Baka','290');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Bal�e','291');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Baldovce','292');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Balo�','293');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Balog nad Ip�om','294');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Banka','295');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Bansk� �tiavnica','296');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Bansk� Bel�','297');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Bansk� Bystrica','298');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Bansk�','299');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Hrabi�ov','894');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Hrabkov','895');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Hrabov� Roztoka','896');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Hrabov��k','897');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hrabovec','898');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Hrabovec nad Laborcom','899');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Hrabovka','900');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hrabsk�','901');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Hrabu�ice','902');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Hrachovi�te','903');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hrachovo','904');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Hradi�te','905');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Hradi�te','906');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Hradi�te pod Vr�tnom','907');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Hradisko','908');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Hrani�n�','909');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Hranovnica','910');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Hrhov','911');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Hri�ovsk� Podhradie','912');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Hri�ov�','913');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Hri�ovce','914');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Hriadky','915');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hrkovce','916');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Hrlica','917');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Nitrianske Hrn�iarovce','918');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Hrn�iarovce nad Parnou','919');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Hrn�iarska Ves','920');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Hrn�iarske Zalu�any','921');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Doln� �t�l','922');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Hrocho�','923');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Hromo�','924');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Hronec','925');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hronovce','926');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Hronsek','927');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Hronsk� Breznica','928');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Hronsk� D�brava','929');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hronsk� K�a�any','930');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Hronsk� Kosihy','931');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Hronsk� Be�adik','932');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Hru�ov','933');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Hru�ov','934');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Hru�ovany','935');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hru�ovo','936');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Hru�t�n','937');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Hrub� Bor�a','938');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Hrub� ��r','939');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Hrubo�ovo','940');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Hrubov','941');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Hubice','942');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Hubina','943');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Hubo�ovce','944');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Hubov�','945');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Hubovo','946');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Huc�n','947');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Hudcovce','948');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Hul','949');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Humenn�','950');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Huncovce','951');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Hunkovce','952');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Hurbanova Ves','953');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Hurbanovo','954');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Hus�k','955');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Husin�','956');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Hutka','957');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Huty','958');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Hviezdoslavov','959');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Hvozdnica','960');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Hybe','961');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','I�a','962');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','I�a�ovce','963');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','I�a','964');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','I�ipovce','965');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','I�kovce','966');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Igram','967');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ih�any','968');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Ihr��','969');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Ilava','970');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Ilia�ovce','971');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Ilija','972');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Ime�','973');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Inovce','974');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ipe�sk� ھany','975');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ipe�sk� Predmostie','976');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ipe�sk� Sokolec','977');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Istebn�','978');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Ivachnov�','979');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Ivan�in�','980');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ivanice','981');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ivanka pri Nitre','982');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Ivanka pri Dunaji','983');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Ivanovce','984');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','J�novce','985');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Jablo�','986');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Jablo�ovce','987');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Jablonec','988');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Jablonica','989');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Jablonka','990');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Jablonov','991');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Jablonov nad Tur�ou','992');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Jablonov�','993');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Jablonov�','994');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Jacovce','995');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Jahodn�','996');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Jaklovce','997');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Jakovany','998');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Jaku�ovce','999');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Jakubany','1000');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Jakubov','1001');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Jakubova Vo�a','1002');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Jakubovany','1003');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Jakubovany','1004');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Jal�ov�','1005');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Jal�ov�k','1006');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Jalov�','1007');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Jalovec','1008');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Jalovec','1009');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Jamn�k','1010');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Jamn�k','1011');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Jan�k','1012');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Jan�ky','1013');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Janice','1014');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Jankovce','1015');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Janov','1016');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Janov�k','1017');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Janova Lehota','1018');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Janovce','1019');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','J�novce','1020');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Jarab�','1021');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Jarabina','1022');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Jarok','1023');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Jarovnice','1024');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Jasenica','1025');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Jasenie','1026');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Jasenov','1027');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Jasenov','1028');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Jasenov�','1029');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Jasenov�','1030');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Jasenovce','1031');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Jasenovo','1032');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Jaslovsk� Bohunice','1033');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Jasov','1034');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Jasov�','1035');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Jastrab�','1036');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Jastrabie nad Top�ou','1037');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Jastrabie pri Michalovciach','1038');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Jatov','1039');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Tatransk� Javorina','1040');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Javorina','1041');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Jazernica','1042');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Je�kova Ves','1043');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Jed�ov� Kosto�any','1044');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Jedlinka','1045');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Jel�ava','1046');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Jel�ovce','1047');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Jel�ovec','1048');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Jelenec','1049');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Jelka','1050');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Jenkovce','1051');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Jesensk�','1052');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Jesensk�','1053');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Jestice','1054');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Jezersko','1055');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Jovice','1056');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Jovsa','1057');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Jur nad Hronom','1058');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Sv�t� Jur','1059');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Jurkov� Vo�a','1060');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Jurov�','1061');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Jursk�','1062');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Juskova Vo�a','1063');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','K�lnica','1064');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','K�tlovce','1065');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','K�tov','1066');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','K���ovec','1067');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','K�a�any','1068');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','K�a�e','1069');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','K�a�no','1070');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','K�ak','1071');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','K�u�ov','1072');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','K�inn�','1073');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','K�tniky','1074');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','K�ty','1075');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ka�anov','1076');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Ka�amenov�','1077');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Ka�ava','1078');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ka�ov','1079');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Kajal','1080');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kal�a','1081');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Kalameny','1082');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Kalinkovo','1083');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Kalinov','1084');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Kalinovo','1085');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Kaln� nad Hronom','1086');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Kaln� Roztoka','1087');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kalni�te','1088');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kalo�a','1089');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Kalonda','1090');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kalu�a','1091');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Kamanov�','1092');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Kame�any','1093');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Kamen�n','1094');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Kamenec pod Vt��nikom','1095');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Kameni�any','1096');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Kameni�n�','1097');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Kamenica','1098');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Kamenica nad Cirochou','1099');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Kamenica nad Hronom','1100');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Kamenn� Poruba','1101');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Kamenn� Poruba','1102');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kamenn� Kosihy','1103');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Kamenn� Most','1104');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Kamienka','1105');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Kamienka','1106');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Kanianka','1107');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kapi�ov�','1108');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Kapince','1109');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Kaplna','1110');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Kapu�any','1111');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kapu�ianske K�a�any','1112');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Karlov�','1113');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Karn�','1114');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Kazim�r','1115');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ke�kovce','1116');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ke�ovo','1117');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ke�marok','1118');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kecerovce','1119');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kecerovsk� Lipovec','1120');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kechnec','1121');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Kendice','1122');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kesovce','1123');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kiarov','1124');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Kl�tor pod Znievom','1125');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Kl�tova Nov� Ves','1126');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Kl�ov','1127');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Kl�ska Nem�','1128');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Kladzany','1129');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Klasov','1130');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kle�any','1131');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Klenov','1132');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Klenov�','1133');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Klenovec','1134');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Klie�tina','1135');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Klin','1136');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Klin nad Bodrogom','1137');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Kloko�','1138');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Kloko�ov','1139');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kloko�ov','1140');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Klubina','1141');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Kluknava','1142');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Kme�ovo','1143');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ko��n-Lan��r','1144');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Ko�ovce','1145');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ko�u�','1146');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Ko�','1147');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Ko��any nad Turcom','1148');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Ko��ty','1149');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Ko�arisk�','1150');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ko�arovce','1151');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Ko�eca','1152');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Ko�eck� Podhradie','1153');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ko�ick� Bel�','1154');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ko�ick� Polianka','1155');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ko�ick� O��any','1156');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ko�ick� Kle�enov','1157');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ko�kovce','1158');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Ko�oln�','1159');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ko�any','1160');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ko�uchov','1161');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Ko�uchovce','1162');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kobeliarovo','1163');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kobylnice','1164');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kobyly','1165');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Kocurany','1166');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Koce�ovce','1167');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kochanovce','1168');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Kochanovce','1169');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kociha','1170');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Koj�ov','1171');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Kojatice','1172');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kok�ov-Bak�a','1173');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Kokava nad Rimavicou','1174');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Koko�ovce','1175');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Kol�rovice','1176');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Kol�rovo','1177');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kol�re','1178');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Kol��any','1179');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Kola�kov','1180');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Kola�no','1181');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Kolbasov','1182');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Kolbovce','1183');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Kolibabovce','1184');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Kolinovce','1185');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Kolonica','1186');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Kolta','1187');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Kom�rany','1188');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Kom�rno','1189');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kom�rov','1190');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kom�rovce','1191');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Komjatice','1192');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Komjatn�','1193');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Komo�a','1194');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Koniarovce','1195');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Konr�dovce','1196');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Konsk�','1197');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Konsk�','1198');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Zempl�nske Kop�any','1199');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Kop�any','1200');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Kopernica','1201');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Koplotovce','1202');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Koprivnica','1203');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Kor�a','1204');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Kord�ky','1205');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Korejovce','1206');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Korom�a','1207');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Korunkov�','1208');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Koryt�rky','1209');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Korytn�','1210');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kosihovce','1211');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kosihy nad Ip�om','1212');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Kosor�n','1213');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kosto�any nad Horn�dom','1214');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Kosto�any pod Tribe�om','1215');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Kostolec','1216');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Kostoli�te','1217');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Kostoln� pri Dunaji','1218');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Kostoln� Ves','1219');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Kostoln�-Z�rie�ie','1220');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Kostoln�','1221');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Kostoln� Kra�any','1222');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Kote�ov�','1223');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Kotr�in� L��ka','1224');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Kov��ov�','1225');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kov��ov�','1226');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Kov��ovce','1227');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Kov�lov','1228');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Kov�lovec','1229');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Kovarce','1230');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Koz�rovce','1231');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Koz� Vrbovok','1232');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Kozeln�k','1233');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kr�','1234');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Kr�ov Brod','1235');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Kr�ova Lehota','1236');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Kr�ov� nad V�hom','1237');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Kr�ov� pri Senci','1238');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kr�ovce','1239');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Kr�ovce-Krni�ov','1240');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Kr�ovi�ove Kra�any','1241');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Kr�ovsk� Chlmec','1242');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Kr�liky','1243');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Kr�sna L�ka','1244');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Kr�sna Ves','1245');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Kr�sno','1246');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Kr�sno nad Kysucou','1247');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kr�snohorsk� Dlh� L�ka','1248');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kr�snohorsk� Podhradie','1249');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kr�snovce','1250');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Kr�sny Brod','1251');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Kr�ava','1252');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kr�e','1253');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Kr�ov� Ves','1254');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Kr�ovany','1255');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Kr�kany','1256');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kra��novce','1257');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Kra�ovany','1258');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Krahule','1259');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Krajn� Bystr�','1260');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Krajn� Po�ana','1261');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Krajn� Por�bka','1262');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Krajn�','1263');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Krajn� �ierno','1264');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Krakovany','1265');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Kras�any','1266');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kraskovo','1267');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Kravany','1268');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Kravany','1269');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Kravany nad Dunajom','1270');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Kremn�','1271');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Kremnica','1272');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Kremnick� Bane','1273');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Kri��ovce','1274');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kri�ovsk� Lieskov�','1275');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Kri�ovany nad Dudv�hom','1276');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Kristy','1277');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Kriv�','1278');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Kriv��','1279');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kriv�','1280');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Krivany','1281');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Krivokl�t','1282');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Krivos�d-Bodovka','1283');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Krn�','1284');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Krn�a','1285');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Krokava','1286');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Krompachy','1287');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Krpe�any','1288');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Krtovce','1289');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Kru�etnica','1290');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Kru�inec','1291');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Kru�ovce','1292');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kru�lov','1293');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kru�lov�','1294');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kru�n�','1295');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kru�no','1296');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Krupina','1297');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ku��n','1298');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Ku��n','1299');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Kub��ovo','1300');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Kuchy�a','1301');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Kuklov','1302');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kukov�','1303');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Kuku��nov','1304');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Kune�ov','1305');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Kunerad','1306');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Kunova Teplica','1307');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Kura�any','1308');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kurima','1309');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Kurimany','1310');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Kurimka','1311');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Kurov','1312');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Kus�n','1313');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Kuzmice','1314');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Kuzmice','1315');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Kva�any','1316');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Kva�any','1317');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Kva�ov','1318');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Kvakovce','1319');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ke�','1320');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Kvetoslavov','1321');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Kyjatice','1322');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Kyjov','1323');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Kynce�ov�','1324');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Kysak','1325');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Kyselica','1326');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Kysta','1327');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Kysuck� Nov� Mesto','1328');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Kysuck� Lieskovec','1329');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','L�b','1330');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','L�tky','1331');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','L�� na Ostrove','1332');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','L��ina','1333');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','L��ka','1334');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','L��ka','1335');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','L��ka','1336');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','L��ka','1337');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','L��ky','1338');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','L��ky','1339');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','L��nica nad �itavou','1340');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','L�ka','1341');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','L�ky','1342');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','La�kovce','1343');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Lackov','1344');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Lackov�','1345');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Lackovce','1346');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Lada','1347');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Ladce','1348');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Ladice','1349');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ladmovce','1350');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Ladomersk� Vieska','1351');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Ladomirov','1352');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ladomirov�','1353');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Ladzany','1354');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Lak��rska Nov� Ves','1355');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lascov','1356');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Lask�r','1357');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Lastom�r','1358');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Lastovce','1359');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Lazany','1360');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Lazisko','1361');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Lazy pod Makytou','1362');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Le�� (vojensk� obvod)','1363');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Le�tiny','1364');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Le�iachov','1365');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Lechnica','1366');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Lednica','1367');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Lednick� Rovne','1368');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Lefantovce','1369');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Legnava','1370');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Leh�tka','1371');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Leh�tka pod Brehmi','1372');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Lehnice','1373');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Lehota','1374');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Lehota nad Rimavicou','1375');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Lehota pod Vt��nikom','1376');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Lek�rovce','1377');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Le�a','1378');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Leles','1379');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Leme�any','1380');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lenartov','1381');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Lenartovce','1382');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Lendak','1383');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Lenka','1384');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Lentvora','1385');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Leopoldov','1386');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Les��ek','1387');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Lesenice','1388');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Lesn�','1389');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Lesnica','1390');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Letanovce','1391');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Letni�ie','1392');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Levice','1393');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Levku�ka','1394');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Levo�a','1395');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Li�artovce','1396');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Li�ov','1397');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Libichava','1398');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Licince','1399');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Lie��any','1400');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Lie�no','1401');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Liesek','1402');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Lieskovany','1403');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Lieskovec','1404');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Lieskovec','1405');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Lietava','1406');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Lietavsk� L��ka','1407');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Likavka','1408');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Limbach','1409');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Lipany','1410');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Lipn�k','1411');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Lipn�ky','1412');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lipov�','1413');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Lipov�','1414');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Lipov�','1415');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Lipovany','1416');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Lipovce','1417');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Lipovec','1418');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Lipovec','1419');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Lipovn�k','1420');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Lipovn�k','1421');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� �tiavnica','1422');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Anna','1423');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Kokava','1424');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� L��na','1425');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� Osada','1426');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Por�bka','1427');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Sielnica','1428');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� Tepl�','1429');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Liptovsk� Tepli�ka','1430');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Beharovce','1431');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� K�a�any','1432');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Matia�ovce','1433');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� Rev�ce','1434');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Hr�dok','1435');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� J�n','1436');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� Michal','1437');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Mikul�','1438');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Ondrej','1439');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Peter','1440');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Liptovsk� Trnovec','1441');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liskov�','1442');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Litava','1443');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Litmanov�','1444');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Livina','1445');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Livinsk� Opatovce','1446');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Livov','1447');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Livovsk� Huta','1448');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Lo�onec','1449');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Lo��n','1450');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Lodno','1451');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Lok','1452');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Lokca','1453');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Lom nad Rimavicou','1454');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Lomn�','1455');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Lomn�','1456');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Lomni�ka','1457');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Lontov','1458');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lop�chov','1459');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Lopa�ov','1460');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Lopu�n� Pa�ite','1461');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Lov�a','1462');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Lov�ica-Trub�n','1463');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Lovce','1464');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Lovinoba�a','1465');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Lozorno','1466');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Lu�at�n','1467');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Lu�enec','1468');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Lu�ivn�','1469');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Lu�any','1470');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Lu�any pri Topli','1471');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Lu�ianky','1472');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Luben�k','1473');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Lubina','1474');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Ludanice','1475');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Ludrov�','1476');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Luhy�a','1477');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Luk��ovce','1478');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Luka�ovce','1479');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lukavica','1480');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Lukavica','1481');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Lukov','1482');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Lukovi�tia','1483');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Lula','1484');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Lupo�','1485');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Luti�e','1486');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Lutila','1487');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Lys� pod Makytou','1488');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Lysica','1489');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','M�la�','1490');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','M�linec','1491');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','M�l�a','1492');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','M�tna','1493');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','M�tne Ludany','1494');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','M�to pod �umbierom','1495');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Ma�a','1496');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ma�kov�','1497');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ma�kovce','1498');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ma�ovsk� Vojkovce','1499');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Machulince','1500');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Macov','1501');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Madunice','1502');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Magnezitovce','1503');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Majcichov','1504');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Majere','1505');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Majerovce','1506');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Makov','1507');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Makovce','1508');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Mal� �alomija','1509');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Mal� �ausa','1510');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Mal� �ierna','1511');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Mal� Doma�a','1512');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Mal� Frankov�','1513');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Mal� Hradn�','1514');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Mal� Ida','1515');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Mal� Lehota','1516');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Mal� Lodina','1517');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Mal� Ma�a','1518');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Mal� nad Hronom','1519');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Mal� Po�ana','1520');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Mal� T��a','1521');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Mal�ice','1522');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Mal� Borov�','1523');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Mal� Chyndice','1524');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Mal� Dvorn�ky','1525');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Mal� Hoste','1526');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Mal� Kosihy','1527');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Mal� Kozm�lovce','1528');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Mal� Kr�te�any','1529');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Mal� Lednice','1530');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Mal� Lev�re','1531');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Mal� Ludince','1532');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Mal� Ozorovce','1533');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Mal� Ra�kovce','1534');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Mal� Rip�any','1535');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Mal� Straciny','1536');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Mal� Trakany','1537');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Mal� Uherce','1538');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Mal� Vozokany','1539');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Mal� Z�lu�ie','1540');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Mal� Zlievce','1541');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Mal� �ep��n','1542');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Mal� �ari�','1543');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Mal� Cet�n','1544');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Mal� Hore�','1545');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Mal� Kamenec','1546');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Mal� Krt�','1547');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Mal� Lap�','1548');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Mal� Lipn�k','1549');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Mal� Slavkov','1550');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Mal� Slivn�k','1551');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Mal�enice','1552');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Malachov','1553');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Malacky','1554');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Malat�ny','1555');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Malatin�','1556');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Malcov','1557');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Malinov�','1558');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Malinovo','1559');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Malu�in�','1560');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Mankovce','1561');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Mar�ov�-Ra�ov','1562');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Marcelov�','1563');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Margecany','1564');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Marha�','1565');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Marianka','1566');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Markovce','1567');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Marku�ka','1568');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Marku�ovce','1569');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Martin','1570');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Martin nad �itavou','1571');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Martin�ek','1572');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Martinov�','1573');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Martovce','1574');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Mat��kovo','1575');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Matejovce nad Horn�dom','1576');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Matia�ka','1577');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Matia�ovce','1578');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Matovce','1579');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Matysov�','1580');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Medovarce','1581');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Medve�ov','1582');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Medvedie','1583');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Medzany','1584');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Medzev','1585');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Medzianky','1586');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Medzibrod','1587');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Medzibrodie nad Oravou','1588');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Medzilaborce','1589');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Mel�ice-Lieskov�','1590');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Melek','1591');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Meliata','1592');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Mengusovce','1593');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Mera�ice','1594');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Mern�k','1595');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Meste�ko','1596');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Mestisko','1597');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Mi�akovce','1598');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Mi�ovce','1599');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Micha�any','1600');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Michajlov','1601');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Michal na Ostrove','1602');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Michal nad �itavou','1603');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Michalkov�','1604');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Michalok','1605');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Michalov�','1606');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Michalovce','1607');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Mierovo','1608');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Miezgovce','1609');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Miklu�ovce','1610');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Mikov�','1611');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Miku�ovce','1612');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Miku�ovce','1613');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Mikul�ov�','1614');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Ve�k� K�r','1615');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Milhos�','1616');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Miloslavov','1617');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Milpo�','1618');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Mirkovce','1619');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Miro�a','1620');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Ml�dzovo','1621');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Mlyn�rovce','1622');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Mlyn�eky','1623');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Mlynica','1624');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Mlynky','1625');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Mn�ek nad Hnilcom','1626');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Mn�ek nad Popradom','1627');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Mn�chova Lehota','1628');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Mo�a','1629');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Mo�iar','1630');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Mo�kovec','1631');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Mo�ovce','1632');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Mo�tenica','1633');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Mo�urov','1634');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Modr� Kame�','1635');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Modra','1636');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Modra nad Cirochou','1637');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Modrany','1638');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Modrov�','1639');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Modrovka','1640');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Moj�','1641');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Mojm�rovce','1642');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Mojt�n','1643');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Mojzesovo','1644');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mokr� L�ka','1645');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Mokr� H�j','1646');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Mokrance','1647');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Mokroluh','1648');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Moldava nad Bodvou','1649');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Moravany','1650');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Moravany nad V�hom','1651');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Moravsk� Lieskov�','1652');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Moravsk� Sv�t� J�n','1653');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Most pri Bratislave','1654');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Mostov�','1655');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Mote�ice','1656');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Moty�ky','1657');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Mr�zovce','1658');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Mu��n','1659');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Mu�a','1660');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Mu�la','1661');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Mudro�ovo','1662');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Mudrovce','1663');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mur��','1664');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mur�nska Dlh� L�ka','1665');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mur�nska Huta','1666');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mur�nska Lehota','1667');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Mur�nska Zdychava','1668');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','M�tne','1669');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Myjava','1670');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Myslina','1671');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','N�lepkovo','1672');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','N�mestovo','1673');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','N�na','1674');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','N�rovce','1675');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Nacina Ves','1676');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Nadlice','1677');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Nah��','1678');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Nandra�','1679');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Nechv�lova Polianka','1680');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Necpaly','1681');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Neda�ovce','1682');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Nedanovce','1683');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Neded','1684');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Nededza','1685');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nedo�ery-Brezany','1686');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Nem�i�any','1687');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Nem�ice','1688');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Nem�ov�','1689');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Nemce','1690');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Nemcovce','1691');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Nemcovce','1692');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Neme�ky','1693');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Neme�any','1694');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Nemeck�','1695');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Nenince','1696');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Neporadza','1697');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Neporadza','1698');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Neslu�a','1699');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Neverice','1700');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nevidzany','1701');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Nevidzany','1702');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Nevo�n�','1703');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Nezbudsk� L��ka','1704');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Ni�n�','1705');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ni�n�','1706');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Ni�n� Boca','1707');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� Hutka','1708');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ni�n� Jablonka','1709');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ni�n� Jed�ov�','1710');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� Kamenica','1711');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� My��a','1712');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Ni�n� Ol�ava','1713');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ni�n� Pisan�','1714');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ni�n� Polianka','1715');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ni�n� Rybnica','1716');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ni�n� Sitnica','1717');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ni�n� Slan�','1718');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ni�n� Vo�a','1719');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ni�n� Ladi�kovce','1720');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ni�n� Nemeck�','1721');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Ni�n� Repa�e','1722');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Ni�n� Ru�bachy','1723');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� �aj','1724');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ni�n� �ipov','1725');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Ni�n� Hrabovec','1726');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Ni�n� Hru�ov','1727');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� Kl�tov','1728');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ni�n� Kom�rnik','1729');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Ni�n� Kru�ov','1730');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ni�n� L�nec','1731');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ni�n� Miro�ov','1732');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Ni�n� Orl�k','1733');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ni�n� Sk�lnik','1734');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ni�n� Slavkov','1735');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ni�n� Tvaro�ec','1736');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Nimnica','1737');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Nitra nad Ip�om','1738');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Nitrianska Blatnica','1739');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Nitrianska Streda','1740');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nitrianske Pravno','1741');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nitrianske Rudno','1742');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nitrianske Su�any','1743');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nitrica','1744');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Nol�ovo','1745');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Norovce','1746');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Nov� �ubov�a','1747');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Nov� Ba�a','1748');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Nov� Ba�ta','1749');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Nov� Bo��ca','1750');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Nov� Bystrica','1751');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Nov� Dedina','1752');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Nov� Dedinka','1753');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Nov� Dubnica','1754');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Nov� Kel�a','1755');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Nov� Lehota','1756');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Nov� Lesn�','1757');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Nov� Polhora','1758');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Nov� Polianka','1759');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Nov� Sedlica','1760');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Nov� Ves','1761');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Nov� Ves nad �itavou','1762');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Nov� Ves nad V�hom','1763');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Nov� Vieska','1764');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Nov��any','1765');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Nov�ky','1766');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Nov� Hony','1767');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Nov� Mesto nad V�hom','1768');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Nov� Sady','1769');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Nov� Z�mky','1770');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Nov� �ivot','1771');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Nov� Ruskov','1772');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Nov� Sala�','1773');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Nov� Svet','1774');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Nov� Tekov','1775');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Novo�','1776');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Novosad','1777');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','O�kov','1778');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','O�ov�','1779');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','O��avka','1780');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','O��inkov','1781');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','O��ov','1782');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','O�dza','1783');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','O�ka','1784');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','O��adnica','1785');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','O��any','1786');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Obeckov','1787');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Obi�ovce','1788');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Obid','1789');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Obor�n','1790');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Obru�n�','1791');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Obyce','1792');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Ochodnica','1793');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ochtin�','1794');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Odor�n','1795');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Ohrady','1796');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ohradzany','1797');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Oko�','1798');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Okoli�n� na Ostrove','1799');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Okr�hle','1800');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Okru�n�','1801');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','O��avce','1802');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','O��avica','1803');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','O��avka','1804');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ol�ovany','1805');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Olcnava','1806');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Ole�n�','1807');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Olejn�kov','1808');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Olov�ry','1809');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Om�enie','1810');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Omastin�','1811');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ondavka','1812');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Ondavsk� Matia�ovce','1813');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Ondra�ov�','1814');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ondra�ovce','1815');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ondrejovce','1816');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Op�tka','1817');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Opatovce','1818');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Opatovce nad Nitrou','1819');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Opatovsk� Nov� Ves','1820');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Opava','1821');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Opin�','1822');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Opoj','1823');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Oponice','1824');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Or�vka','1825');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Oravce','1826');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Oravsk� Jasenica','1827');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Oravsk� Lesn�','1828');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Oravsk� Polhora','1829');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Oravsk� Poruba','1830');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Oravsk� Vesel�','1831');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Oravsk� Biely Potok','1832');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Oravsk� Podz�mok','1833');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Ordzovany','1834');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Ore�any','1835');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Orechov�','1836');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Orechov� Pot��','1837');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Vieska','1838');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Oresk�','1839');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Oresk�','1840');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Orlov','1841');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Orovnica','1842');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Ortu�ov�','1843');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Os�dka','1844');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Osadn�','1845');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Osikov','1846');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Oslany','1847');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Osrblie','1848');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Ostr� L�ka','1849');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Ostr� Gr��','1850');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Ostratice','1851');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ostrov','1852');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ostrov','1853');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ostrovany','1854');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ostur�a','1855');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Osusk�','1856');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Otrh�nky','1857');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Otro�ok','1858');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Ov�iarsko','1859');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ov�ie','1860');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Ozd�n','1861');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','P�rnica','1862');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','P�olin�','1863');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','P�la','1864');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','P�la','1865');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','P�la','1866');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','P�tor','1867');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','P�chov','1868');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Pa�a','1869');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Pa�a','1870');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Pa�ovce','1871');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Pa�kov�','1872');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Pa�tina Z�vada','1873');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Pa�i�','1874');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Pad��','1875');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Padarovce','1876');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Pakostov','1877');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Pal�rikovo','1878');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Pal�n','1879');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Sap','1880');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Palota','1881');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Panick� Dravce','1882');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Pap�n','1883');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Papradno','1884');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Parchovany','1885');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Parihuzovce','1886');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Partiz�nska �up�a','1887');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Partiz�nske','1888');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Pata�','1889');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Pastovce','1890');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Pastuchov','1891');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Pata','1892');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Patince','1893');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Pav�ina Lehota','1894');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Pav�any','1895');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Pavlice','1896');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Pavlov�','1897');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Pavlova Ves','1898');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Pavlovce','1899');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Pavlovce','1900');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Pavlovce nad Uhom','1901');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Pe�e�ady','1902');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Pe�e�any','1903');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Pe�enice','1904');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Pe�ovsk� Nov� Ves','1905');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Peder','1906');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Per�n-Chym','1907');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Pernek','1908');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Petkovce','1909');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Petrikovce','1910');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Petrov�','1911');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Petrova Lehota','1912');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Petrova Ves','1913');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Petrovany','1914');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Petrovce','1915');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Petrovce','1916');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Petrovce','1917');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Petrovce nad Laborcom','1918');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Petrovice','1919');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Petrovo','1920');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Pezinok','1921');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Pichne','1922');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Pie��any','1923');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Pincin�','1924');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Pinkovce','1925');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Piskorovce','1926');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Pitelov�','1927');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Pl᚝ovce','1928');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Plav� Vozokany','1929');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Plave�','1930');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Plaveck� Podhradie','1931');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Plaveck� �tvrtok','1932');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Plaveck� Mikul�','1933');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Plaveck� Peter','1934');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Plavnica','1935');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ple�','1936');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Sv�tu�e','1937');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ple�ivec','1938');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Plechotice','1939');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Plevn�k-Drienov�','1940');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Plie�ovce','1941');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Plosk�','1942');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Plosk�','1943');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Po��vadlo','1944');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Po�arov�','1945');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Po�anovce','1946');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Po�any','1947');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Po�n� Kesov','1948');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Po�a','1949');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Pobedim','1950');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Pochabany','1951');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Podbiel','1952');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Podbran�','1953');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Podbrezov�','1954');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Podh�jska','1955');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Podhorany','1956');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Podhorany','1957');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Podhorany','1958');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Podhorie','1959');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Podhorie','1960');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Podhoro�','1961');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Podhrad�k','1962');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Podhradie','1963');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Podhradie','1964');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Podhradie','1965');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Podkonice','1966');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Podkriv��','1967');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Podkylava','1968');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Podlu�any','1969');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Podlu�any','1970');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Podol�nec','1971');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Podolie','1972');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Podre�any','1973');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Podskalie','1974');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Podture�','1975');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Podvysok�','1976');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Podz�m�ok','1977');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Pohorel�','1978');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Pohranice','1979');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Pohronsk� Polhora','1980');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Pohronsk� Bukovec','1981');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Pohronsk� Ruskov','1982');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Pokryv��','1983');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Polichno','1984');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Poliakovce','1985');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Polianka','1986');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Polina','1987');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Poloma','1988');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Polomka','1989');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Polt�r','1990');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Poluvsie','1991');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Pongr�covce','1992');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Poniky','1993');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Poprad','1994');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Popro�','1995');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Popro�','1996');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Popudinsk� Mo�id�any','1997');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Por��','1998');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Por�bka','1999');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Por�bka','2000');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Por�bka','2001');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Poriadie','2002');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Porostov','2003');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Poruba','2004');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Poruba pod Vihorlatom','2005');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Por�bka','2006');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Pot��ky','2007');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Potok','2008');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Potok','2009');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Potoky','2010');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Potvorice','2011');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Pova�any','2012');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Pova�sk� Bystrica','2013');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Povina','2014');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Povrazn�k','2015');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Pozba','2016');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Pozdi�ovce','2017');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Pr�znovce','2018');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Pr�belce','2019');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Pr�bovce','2020');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Pr�kra','2021');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Pr�a','2022');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Pra�ice','2023');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Pra�n�k','2024');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Praha','2025');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Prakovce','2026');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Pravenec','2027');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Pravica','2028');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Pravotice','2029');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Pre��n','2030');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Pre�ov','2031');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Predajn�','2032');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Predmier','2033');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Pren�ov','2034');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Prese�any','2035');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Prestavlky','2036');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Priben�k','2037');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Pribeta','2038');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Pribi�','2039');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Pribylina','2040');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Priechod','2041');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Priekopa','2042');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Priepasn�','2043');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Prietr�','2044');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Prietr�ka','2045');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Prievaly','2046');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Prievidza','2047');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Prihradzany','2048');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Pr�slop','2049');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Pritu�any','2050');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Pro�','2051');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Prochot','2052');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Prosa�ov','2053');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Prosiek','2054');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Pru�ina','2055');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Prusk�','2056');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Prusy','2057');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Pstrin�','2058');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Pti�ie','2059');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ptruk�a','2060');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Pu�ovce','2061');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Pucov','2062');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Pukanec','2063');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Pust� �emern�','2064');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Pust� ھany','2065');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Pust� Pole','2066');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Pust� Sady','2067');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','R�ko�','2068');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','R�ko�','2069');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','R�zto�no','2070');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','R�ztoka','2071');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','R�ba�','2072');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Ra�ice','2073');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ra��any','2074');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Rab�a','2075');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Rab�ice','2076');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Rad','2077');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Rad�stka','2078');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Radatice','2079');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Radava','2080');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Radimov','2081');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Radnovce','2082');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Rado�a','2083');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Rado�ina','2084');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Rado�ovce','2085');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Rado�ovce','2086');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Radobica','2087');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Radoma','2088');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Radva� nad Dunajom','2089');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Radva� nad Laborcom','2090');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Radvanovce','2091');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Radzovce','2092');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Rafajovce','2093');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Raj�any','2094');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Rajec','2095');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Rajeck� Lesn�','2096');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Rajeck� Teplice','2097');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Rak�a','2098');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Rak�sy','2099');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Rakov�','2100');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Rakov��k','2101');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Rakovec nad Ondavou','2102');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Rakovice','2103');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Rakovnica','2104');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Rakovo','2105');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rakytn�k','2106');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Rankovce','2107');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Rapovce','2108');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Raslavice','2109');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Rastislavice','2110');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ratka','2111');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Ratkov�','2112');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Ratkovce','2113');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Ratkovo','2114');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ratkovsk� Lehota','2115');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ratkovsk� Such�','2116');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Ratkovsk� Bystr�','2117');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ratnovce','2118');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ratvaj','2119');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Re�ov','2120');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Re�ica','2121');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Re�ov','2122');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Reca','2123');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Regetovka','2124');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Rejdov�','2125');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Remeniny','2126');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Remetsk� H�mre','2127');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ren�i�ov','2128');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Repejov','2129');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Repi�te','2130');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Rev�ca','2131');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Rev�cka Lehota','2132');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ri��ovce','2133');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Richnava','2134');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Richvald','2135');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rie�ka','2136');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Rie�ka','2137');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Ba�a','2138');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Se�','2139');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Sobota','2140');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Brezovo','2141');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Janovce','2142');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rimavsk� Zalu�any','2143');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Ro�kovce','2144');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ro�t�r','2145');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ro��ava','2146');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Ro��avsk� Bystr�','2147');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Ro�kovany','2148');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Rochovce','2149');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Roho�n�k','2150');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Roho�n�k','2151');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Rohov','2152');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Rohovce','2153');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Rokycany','2154');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Rokytov','2155');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Rokytov pri Humennom','2156');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Rokytovce','2157');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Rosina','2158');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Rov�any','2159');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Rovensko','2160');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Rovinka','2161');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Rovn�','2162');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rovn�','2163');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Rovn�','2164');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Rozhanovce','2165');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Rozlo�n�','2166');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Roztoky','2167');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ru�in�','2168');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Ru�indol','2169');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Ru�omberok','2170');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Rud�any','2171');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Rudina','2172');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Rudinka','2173');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Rudinsk�','2174');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Rudlov','2175');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Rudn�','2176');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Rudn�k','2177');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Rudn�k','2178');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Rudnianska Lehota','2179');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Rudno','2180');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Rudno nad Hronom','2181');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Rumanov�','2182');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Rumince','2183');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Runina','2184');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Rusk�','2185');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Rusk� Bystr�','2186');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Rusk� Kaj�a','2187');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Rusk� Nov� Ves','2188');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Rusk� Poruba','2189');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Rusk� Vo�a','2190');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Rusk� Vo�a nad Popradom','2191');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Rusk� Volov�','2192');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Rusk� Hrabovec','2193');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vy�n� Kazim�r','2194');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Kru�ov','2195');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Rusk� Potok','2196');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ruskov','2197');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ruskovce','2198');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Ruskovce','2199');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Rybany','2200');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Rybky','2201');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Rybn�k','2202');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Rybn�k','2203');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Rykyn�ice','2204');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','S�do�n�','2205');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','S�sa','2206');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','S�sa','2207');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','S�a�any','2208');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','S��ov-Hradn�','2209');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','S�dovce','2210');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','S�lovce','2211');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','S�tor','2212');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Sa�urov','2213');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Sabinov','2214');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Sady nad Torysou','2215');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Salka','2216');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Santovka','2217');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Sasinkovo','2218');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Sazdice','2219');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Se�','2220');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Se�ianky','2221');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Se�ovce','2222');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Se�ovsk� Polianka','2223');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Se�any','2224');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Se�a','2225');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Sebechleby','2226');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Sebed�n-Be�ov','2227');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Sebedra�ie','2228');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Sedliacka Dubov�','2229');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Sedlice','2230');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Sedlisk�','2231');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Sedmerovec','2232');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Sejkov','2233');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Sekule','2234');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Selce','2235');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Selce','2236');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Selce','2237');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Selec','2238');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Selice','2239');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Semerovo','2240');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Senec','2241');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Seniakovce','2242');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Senica','2243');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Senn�','2244');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Senn�','2245');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Senohrad','2246');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Sere�','2247');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Sielnica','2248');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Siheln�','2249');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Sihla','2250');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Sikeni�ka','2251');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Siladice','2252');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Silica','2253');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Silick� Brezov�','2254');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Silick� Jablonica','2255');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Sirk','2256');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Sirn�k','2257');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Sk�ro�','2258');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Sk�cov','2259');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Ska�any','2260');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Skalica','2261');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Skalit�','2262');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Skalka nad V�hom','2263');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Skere�ovo','2264');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Sklabi�a','2265');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Sklabin�','2266');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Sklabinsk� Podz�mok','2267');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Sklen�','2268');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Sklen� Teplice','2269');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Skrabsk�','2270');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Mo�enok','2271');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Sl�dkovi�ovo','2272');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Slavkovce','2273');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Slan��k','2274');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Slanec','2275');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Slansk� Huta','2276');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Slansk� Nov� Mesto','2277');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Slask�','2278');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Slatina','2279');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Slatina nad Bebravou','2280');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Slatinka nad Bebravou','2281');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Slatinsk� Lazy','2282');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Slatvina','2283');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Slavec','2284');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Slavnica','2285');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Slavo�ka','2286');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Slavo�ovce','2287');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Slep�any','2288');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Slia�','2289');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Liptovsk� Slia�e','2290');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Sliepkovce','2291');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Slivn�k','2292');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Slizk�','2293');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Slopn�','2294');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Slovany','2295');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Slovensk� �up�a','2296');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Slovensk� Kaj�a','2297');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Slovensk� Nov� Ves','2298');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Slovensk� Ves','2299');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Slovensk� Volov�','2300');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Slovensk� �armoty','2301');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Slovensk� K�a�any','2302');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Slovensk� Kriv�','2303');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Slovensk� Nov� Mesto','2304');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Slovensk� Pravno','2305');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Slovensk� Grob','2306');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Slovinky','2307');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Smi�any','2308');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Smilno','2309');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Smolenice','2310');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Smolinsk�','2311');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Smoln�cka Huta','2312');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Smoln�k','2313');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Smrd�ky','2314');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Smre�any','2315');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Snakov','2316');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('36','Sne�nica','2317');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Snina','2318');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','So�','2319');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','So�n�k','2320');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','So�ni�ka','2321');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Soblahov','2322');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Sobo�','2323');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Soboti�te','2324');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Sobrance','2325');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Socovce','2326');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Soko�','2327');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Soko�any','2328');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Sokolce','2329');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Sokolovce','2330');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Sol�any','2331');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Sol�ianky','2332');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Solo�nica','2333');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Somotor','2334');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Sopkovce','2335');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Spi�sk� Bel�','2336');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Spi�sk� Nov� Ves','2337');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Spi�sk� Star� Ves','2338');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Spi�sk� Teplica','2339');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Spi�sk� Bystr�','2340');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Spi�sk� Hanu�ovce','2341');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Spi�sk� Podhradie','2342');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Spi�sk� Tom�ovce','2343');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Spi�sk� Vlachy','2344');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Spi�sk� �tiavnik','2345');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Spi�sk� �tvrtok','2346');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Spi�sk� Hrhov','2347');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Spi�sk� Hru�ov','2348');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Sta�kov','2349');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Sta�kovce','2350');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Stak��n','2351');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Stak��nska Roztoka','2352');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Stan�a','2353');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Stankovany','2354');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Stankovce','2355');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Star� �ubov�a','2356');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Star� Ba�ta','2357');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Star� Bystrica','2358');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Star� Hali�','2359');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Star� Huta','2360');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Star� Kremni�ka','2361');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Star� Lehota','2362');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Star� Lesn�','2363');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Star� Myjava','2364');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Star� Tur�','2365');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Star� Voda','2366');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Star�','2367');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Star� Hory','2368');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Star� Hr�dok','2369');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Star� Tekov','2370');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Starina','2371');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Stebn�cka Huta','2372');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Stebn�k','2373');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','Sto�ok','2374');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Str��any','2375');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Str��avy','2376');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Str�a','2377');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Str�ne','2378');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Str�ske','2379');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Str�ne pod Tatrami','2380');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Str�nska','2381');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Str�nske','2382');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Straten�','2383');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Stre�no','2384');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Stre�enice','2385');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Streda nad Bodrogom','2386');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Stredn� Plachtince','2387');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Strekov','2388');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Streln�ky','2389');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Lev�re','2390');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Stretava','2391');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Stretavka','2392');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Strihovce','2393');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Stro��n','2394');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Stropkov','2395');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Stu�any','2396');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Studen�','2397');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Studenec','2398');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Studienka','2399');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Stupava','2400');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Stupn�','2401');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Su�any','2402');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Su�any','2403');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Such� Dolina','2404');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Such� Hora','2405');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Such� nad Parnou','2406');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Such��','2407');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Such�','2408');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Such� Brezovo','2409');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Suchohrad','2410');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Sukov','2411');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Sul�n','2412');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Sv�t� Kr�','2413');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Sv�toplukovo','2414');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Sv�tu�','2415');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Svedern�k','2416');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Sver�ov','2417');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Sverepec','2418');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Svetlice','2419');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Svidn�k','2420');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Svidni�ka','2421');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Svinia','2422');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Svinica','2423');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Svinice','2424');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Svinn�','2425');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Svit','2426');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Svod�n','2427');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Svr�inovec','2428');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Svrbice','2429');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','T��','2430');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','T�nie','2431');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ta�u�a','2432');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Tachty','2433');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Tajn�','2434');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Tajov','2435');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Tarnov','2436');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Te�ed�kovo','2437');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tehla','2438');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Tekol�any','2439');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Tekovsk� Breznica','2440');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tekovsk� Lu�any','2441');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Tekovsk� Nemce','2442');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tekovsk� Hr�dok','2443');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Telince','2444');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Teme�','2445');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Tepl� Vrch','2446');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Tepli�ka','2447');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Tepli�ka nad V�hom','2448');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Tepli�ky','2449');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ter�a','2450');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Terany','2451');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Terchov�','2452');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Teriakovce','2453');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Tes�re','2454');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Tes�rske Mly�any','2455');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Tibava','2456');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Tich� Potok','2457');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Timoradza','2458');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Tisinec','2459');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Tisovec','2460');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tlma�e','2461');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','To�nica','2462');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Tokaj�k','2463');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Tom�ikovo','2464');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Tom�ov','2465');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Tom�ovce','2466');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Tom�ovce','2467');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Topo��any','2468');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Topo��ianky','2469');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Topo�a','2470');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Topo�n�ky','2471');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Topo�nica','2472');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','��rad','2473');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Topo�ovka','2474');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Toporec','2475');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Torysa','2476');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Torysky','2477');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Tovarnianska Polianka','2478');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Tovarn�','2479');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Tovarn�ky','2480');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Tr�vnica','2481');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Tr�vnik','2482');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('12','Trakovice','2483');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Trebatice','2484');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Trebe�ovce','2485');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Trebejov','2486');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Trebi�ov','2487');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Trebichava','2488');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Trebostovo','2489');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Trebu�ovce','2490');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Tren�','2491');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren��n','2492');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianska Tepl�','2493');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianska Turn�','2494');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Tren�ianske Bohuslavice','2495');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianske Jastrabie','2496');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianske Mitice','2497');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianske Stankovce','2498');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Tren�ianske Teplice','2499');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Trhov� Hradsk�','2500');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Trhovi�te','2501');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Trn�vka','2502');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Trn�vka','2503');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Trnav� Hora','2504');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Trnava','2505');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Trnava pri Laborci','2506');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Trnkov','2507');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Trnovec','2508');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Trnovec nad V�hom','2509');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Trnovo','2510');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Tro�any','2511');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Trp�n','2512');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Trs�any','2513');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Trst�n','2514');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Trsten�','2515');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Trsten� na Ostrove','2516');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Trsten�','2517');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Trsten� pri Horn�de','2518');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Trstice','2519');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Tu�ice','2520');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Tu�ick� Nov� Ves','2521');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Tu�ina','2522');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Tuchy�a','2523');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Tuh�r','2524');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Tuhrina','2525');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Tul��k','2526');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tup�','2527');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Tur�','2528');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Tur�ek','2529');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Tur�ianky','2530');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Tur�ianska �tiavni�ka','2531');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Tur�ianske Jaseno','2532');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Tur�ianske K�a�any','2533');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Tur�ianske Teplice','2534');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Tur�iansky �ur','2535');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Tur�iansky Peter','2536');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Tur�ok','2537');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Tur�k','2538');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Turany','2539');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Turany nad Ondavou','2540');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Turcovce','2541');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Ture�','2542');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Tureck�','2543');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Turie','2544');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Tur�a nad Bodvou','2545');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Turnianska Nov� Ves','2546');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Turov�','2547');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Tvaro�n�','2548');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Tvrdo��n','2549');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Tvrdo�ovce','2550');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Tvrdomestice','2551');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','ھany nad �itavou','2552');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','U�at�n','2553');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Ub�a','2554');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Udavsk�','2555');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Udi�a','2556');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Uhlisk�','2557');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Uhorsk� Ves','2558');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Uhorsk�','2559');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Uhrovec','2560');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Uhrovsk� Podhradie','2561');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Uli�','2562');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Uli�sk� Kriv�','2563');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Ulo�a','2564');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Un�n','2565');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Urmince','2566');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Utek��','2567');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Uzovce','2568');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Uzovsk� Panica','2569');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Uzovsk� Pek�any','2570');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Uzovsk� �algov','2571');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','V�hovce','2572');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','V�pen�k','2573');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','V�elince','2574');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','V�az','2575');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','V�g�a�','2576');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('46','V�g�a�sk� Huta-Kalinka','2577');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','V�tkovce','2578');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Vrbnica','2579');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','V�born�','2580');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','V�chodn�','2581');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','V�rava','2582');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Va�ovce','2583');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Va�kov�a','2584');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Valkovce','2585');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Va�ec','2586');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vagrinec','2587');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vajkovce','2588');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Val�a','2589');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Valaliky','2590');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Valask�','2591');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Valask� Bel�','2592');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('40','Valask� Dubov�','2593');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Valentovce','2594');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Valice','2595');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Vani�kovce','2596');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Var�n','2597');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Varadka','2598');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Varechovce','2599');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Varha�ovce','2600');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Vasi�ov','2601');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Vavre�ka','2602');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Vavri�ovo','2603');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vavrinec','2604');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ve�elkov','2605');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�aty','2606');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� �alomija','2607');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Ve�k� �ausa','2608');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Ve�k� �ierna','2609');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ve�k� Dolina','2610');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ve�k� Frankov�','2611');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Ve�k� Hradn�','2612');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ve�k� Ida','2613');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Ve�k� L�ka','2614');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Ve�k� Lehota','2615');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Ve�k� Lesn�','2616');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Ve�k� Lodina','2617');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ve�k� Lomnica','2618');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Ve�k� Ma�a','2619');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ve�k� nad Ip�om','2620');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Ve�k� Paka','2621');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�k� T��a','2622');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Ve�k� Ves','2623');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� Ves nad Ip�om','2624');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Ve�k� ھany','2625');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Ve�k� Bierovce','2626');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Ve�k� Blahovo','2627');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Ve�k� Borov�','2628');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Ve�k� Chlievany','2629');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ve�k� Chyndice','2630');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Ve�k� Dr�kovce','2631');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Ve�k� Dravce','2632');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Ve�k� Dvorany','2633');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Ve�k� Dvorn�ky','2634');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Ve�k� Hoste','2635');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ve�k� Kapu�any','2636');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Ve�k� Kosihy','2637');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ve�k� Kosto�any','2638');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ve�k� Kozm�lovce','2639');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Ve�k� Kr�te�any','2640');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Ve�k� Lev�re','2641');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Ve�k� Lovce','2642');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ve�k� Ludince','2643');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Ve�k� Orvi�te','2644');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�k� Ozorovce','2645');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Ve�k� Pole','2646');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ve�k� Ra�kovce','2647');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Ve�k� Rip�any','2648');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Ve�k� Rovn�','2649');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Ve�k� Slemence','2650');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� Straciny','2651');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ve�k� Teriakovce','2652');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�k� Trakany','2653');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ve�k� Turovce','2654');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Ve�k� Uherce','2655');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Ve�k� Vozokany','2656');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ve�k� Z�lu�ie','2657');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� Zlievce','2658');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('41','Ve�k� �ep��n','2659');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Ve�k� �ur','2660');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ve�k� �ari�','2661');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Ve�k� Biel','2662');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Ve�k� Blh','2663');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ve�k� Cet�n','2664');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Ve�k� Folkmar','2665');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Ve�k� Grob','2666');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�k� Hore�','2667');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Ve�k� Kamenec','2668');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('21','Ve�k� Kl�','2669');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� Krt�','2670');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Ve�k� Lap�','2671');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Ve�k� Lipn�k','2672');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Ve�k� Lom','2673');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Ve�k� Slavkov','2674');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ve�k� Slivn�k','2675');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Ve�krop','2676');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Ve�opolie','2677');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vechec','2678');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Vel�ice','2679');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Veli�n�','2680');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Velu�ovce','2681');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Vern�r','2682');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Vesel�','2683');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Vetern� Poruba','2684');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Vi��ov','2685');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('50','Vi��ov�','2686');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Vi��ov�','2687');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Vi��ov�','2688');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Vi�tuk','2689');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','V�azovce','2690');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('48','Vidin�','2691');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Vieska','2692');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Vieska nad �itavou','2693');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Vieska nad Blhom','2694');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Vikartovce','2695');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Vini�ky','2696');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Vini�n�','2697');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Vinica','2698');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Vinn�','2699');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Vinodol','2700');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Vinohrady nad V�hom','2701');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('7','Vinosady','2702');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Virt','2703');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Vislanka','2704');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vislava','2705');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Visolaje','2706');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Vitanov�','2707');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('29','Vl�any','2708');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Vl�kovce','2709');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vla�a','2710');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Vlachovo','2711');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Vlachy','2712');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vladi�a','2713');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('43','Vlkanov�','2714');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Vlkas','2715');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Vlkov�','2716');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Vlkovce','2717');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Vlky','2718');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Vlky�a','2719');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Vo�a','2720');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Voderady','2721');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Voj�ice','2722');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Voj�any','2723');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Vojany','2724');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Vojka','2725');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Vojka nad Dunajom','2726');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('78','Vojkovce','2727');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Vojnatina','2728');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','B�torove Kosihy','2729');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vojtovce','2730');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Volica','2731');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Volkovce','2732');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('54','Voznica','2733');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Vozokany','2734');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Vozokany','2735');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Vr�ble','2736');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('15','Vr�di�te','2737');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Vr�cko','2738');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Vr�atsk� Podhradie','2739');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Vr�tky','2740');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Vrak��','2741');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vranov nad Top�ou','2742');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Vrbov','2743');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Vrbov� nad V�hom','2744');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('13','Vrbov�','2745');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('19','Vrbovce','2746');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Vrbovka','2747');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Vrchtepl�','2748');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vt��kovce','2749');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','V��apy-Opatovce','2750');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vy�kovce','2751');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Vy�kovce nad Ip�om','2752');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Vy�n� �ebastov�','2753');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Vy�n� Boca','2754');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� Hutka','2755');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Vy�n� Jablonka','2756');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vy�n� Jed�ov�','2757');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� Kamenica','2758');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� My��a','2759');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vy�n� Ol�ava','2760');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vy�n� Pisan�','2761');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Vy�n� Polianka','2762');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Vy�n� Rybnica','2763');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Vy�n� Sitnica','2764');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('76','Vy�n� Slan�','2765');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Vy�n� Vo�a','2766');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Vy�n� Ladi�kovce','2767');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Vy�n� nad Hronom','2768');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Vy�n� Nemeck�','2769');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Vy�n� Remety','2770');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Vy�n� Repa�e','2771');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Vy�n� Ru�bachy','2772');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Vy�n� Valice','2773');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� �aj','2774');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Vy�n� �ipov','2775');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('66','Vy�n� Hrabovec','2776');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Vy�n� Hru�ov','2777');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� Kl�tov','2778');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vy�n� Kom�rnik','2779');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Vy�n� Kru�ov','2780');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Vy�n� Kub�n','2781');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Vy�n� Medzev','2782');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vy�n� Miro�ov','2783');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Vy�n� Orl�k','2784');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Vy�n� Sk�lnik','2785');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('60','Vy�n� Slavkov','2786');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Vy�n� Tvaro�ec','2787');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Vydrany','2788');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Vydrn�','2789');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Vydrn�k','2790');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('55','Vyhne','2791');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Vyso�any','2792');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('44','Vysok�','2793');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('63','Vysok�','2794');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Vysok� nad Kysucou','2795');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Vysok� nad Uhom','2796');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Vysok� pri Morave','2797');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Z�biedovo','2798');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Z�borie','2799');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Z�borsk�','2800');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Z�diel','2801');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Z�dor','2802');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Z�hor','2803');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Z�horce','2804');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Z�horie','2805');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Z�horsk� Ves','2806');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Z�hradn�','2807');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('8','Z�lesie','2808');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Z�lesie','2809');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Z�mutov','2810');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Z�rie�ie','2811');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('22','Z�skalie','2812');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('37','Z�va�n� Poruba','2813');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('30','Z�vada','2814');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Z�vada','2815');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Z�vada','2816');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Z�vadka','2817');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Z�vadka','2818');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('74','Z�vadka','2819');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('45','Z�vadka nad Hronom','2820');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Z�vod','2821');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('51','Zacharovce','2822');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Z�kamenn�','2823');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Zalaba','2824');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Zalu�ice','2825');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('16','Zamarovce','2826');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zat�n','2827');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Zavar','2828');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zbeh�ov','2829');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Zbehy','2830');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Zboj','2831');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Zbojn�','2832');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Zbrojn�ky','2833');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Zborov','2834');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Zborov nad Bystricou','2835');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('61','Zbudsk� Bel�','2836');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Zbudsk� Dlh�','2837');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Zbudza','2838');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Zby�ov','2839');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Zelene�','2840');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Zemianska Ol�a','2841');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('23','Zemianske Kosto�any','2842');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('20','Zemianske Podhradie','2843');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('11','Zemianske Sady','2844');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('47','Zemiansky Vrbovok','2845');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('28','Zemn�','2846');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�n','2847');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('75','Zempl�nska �irok�','2848');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�nska Nov� Ves','2849');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�nska Teplica','2850');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('64','Zempl�nske H�mre','2851');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�nske Hradi�te','2852');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�nske Jastrabie','2853');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Zempl�nsky Bran�','2854');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Zlat� Ba�a','2855');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Zlat� Idka','2856');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('57','Zlat�','2857');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Zlat� Klasy','2858');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Zlat� Moravce','2859');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Zlatn� na Ostrove','2860');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','Zlatn�k','2861');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('17','Zlatn�ky','2862');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('49','Zlatno','2863');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('31','Zlatno','2864');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('18','Zliechov','2865');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('6','Zohor','2866');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('52','Zombor','2867');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('24','Zub�k','2868');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('42','Zuberec','2869');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Zubn�','2870');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('39','Zubrohlava','2871');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Zvolen','2872');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Zvolensk� Slatina','2873');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('9','Zvon��n','2874');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava-Podunajsk� Biskupice','2875');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-�aca','2876');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-�ebastovce','2877');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Barca','2878');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Juh','2879');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-Kave�any','2880');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('71','Ko�ice-Ko�ick� Nov� Ves','2881');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Kr�sna','2882');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Lorin��k','2883');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Myslava','2884');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Z�pad','2885');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Po�ov','2886');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-Sever','2887');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-Star� Mesto','2888');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','�adca','2889');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-�ahanovce','2890');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('1','Bratislava','2891');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava','2892');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('3','Bratislava','2893');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava','2894');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-Dev�nska Nov� Ves','2895');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice V','2896');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava-Rusovce','2897');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('3','Bratislava-Vajnory','2898');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-Z�horsk� Bystrica','2899');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava-Vraku�a','2900');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava-�unovo','2901');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava-Jarovce','2902');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('3','Bratislava-Ra�a','2903');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava-Petr�alka','2904');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-Karlova Ves','2905');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-Dev�n','2906');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-Lama�','2907');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava-D�bravka','2908');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava-Ru�inov','2909');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava-Prievoz','2910');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('3','Bratislava-Nov� Mesto','2911');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('1','Bratislava-Star� Mesto','2912');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','La�any','2913');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Mad','2914');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('58','Vala�kovce','2915');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Nitra','2916');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Turzovka','2917');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('34','Z�kop�ie','2918');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('77','Ve�k� Revi�tia','2919');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice','2920');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice','2921');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('71','Ko�ice','2922');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice','2923');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('35','Z�zriv�','2924');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava','2925');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('73','Dvorn�ky-V�el�re','2926');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('32','Lietavsk� Svinn�-Babkov','2927');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('27','Sikenica','2928');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('79','Sv�t� M�ria','2929');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-D�ung�a','2930');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice-S�dlisko �ahanovce','2931');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Lun�k IX','2932');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-Pere�','2933');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice-S�dlisko KVP','2934');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('71','Ko�ice-Dargovsk�ch hrdinov','2935');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Nad Jazerom','2936');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Vy�n� Op�tske','2937');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Povoda','2938');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('62','Vysok� Tatry','2939');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Podsadek','2940');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','P�urnovice','2941');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Hrabov�','2942');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Doln� Hlbok�','2943');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Horn� Hlbok�','2944');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','�ubick� K�pele','2945');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Zoln�','2946');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','M��ov�','2947');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Kr�ov�','2948');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Lukov�','2949');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Solivar','2950');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ari�sk� L�ky','2951');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ni�n� �ebastov�','2952');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','So�n� Ba�a','2953');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�v�by','2954');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�algov�k','2955');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ruskinovce','2956');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�emern�','2957');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','���ov','2958');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Kunov','2959');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Hlbok�','2960');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Prietr�','2961');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Mo�id�any','2962');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Zemianska Dedina','2963');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Bratislava-D�bravka','2964');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Mn�ek nad Hnilcom','2965');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava','2966');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('5','Bratislava','2967');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('1','Bratislava','2968');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('3','Bratislava','2969');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('4','Bratislava','2970');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Bratislava-D�bravka','2971');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('2','Bratislava-Prievoz','2972');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('68','�emern�','2973');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Doln� Hlbok�','2974');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Horn� Hlbok�','2975');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','Hrabov�','2976');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('69','Ko�ice','2977');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('70','Ko�ice','2978');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('71','Ko�ice','2979');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice','2980');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice V','2981');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Kr�ov�','2982');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('25','Lefantovce','2983');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','�ubick� K�pele','2984');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Lukov�','2985');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Mn�ek nad Hnilcom','2986');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Mo�id�any','2987');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','M��ov�','2988');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Ni�n� �ebastov�','2990');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('65','Podsadek','2991');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('33','P�urnovice','2992');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('59','Ruskinovce','2993');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','Solivar','2994');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','So�n� Ba�a','2995');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�algov�k','2996');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�ari�sk� L�ky','2997');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('56','�v�by','2998');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Zemianska Dedina','2999');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('53','Zoln�','3000');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Sver�ov','3001');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Sver�ov','3002');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Hlbok�','3003');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Prietr�','3004');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','���ov','3005');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('14','Kunov','3006');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('38','Turany','3007');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('10','Gab��kovo','3008');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('72','Ko�ice-Nad jazerom','3009');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('67','Jurkova Vo�a','3010');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Nesvady','3011');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('26','Nesvady','3012');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Ve�k� Po�ana','3013');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Rusk�','3014');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Smoln�k','3015');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Zvala','3016');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Ostru�nica','3017');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Starina','3018');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Dara','3019');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Ve�k� Po�ana','3020');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Rusk�','3021');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Smoln�k','3022');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Zvala','3023');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Ostru�nica','3024');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Starina','3025');
Insert into SYSTEM.MESTO (ID_OKRES,NAZOV,ID_MESTO) values ('80','Dara','3026');
REM INSERTING into SYSTEM.NEMOCNICA
SET DEFINE OFF;
Insert into SYSTEM.NEMOCNICA (ID_NEM,NAZOV,MOBIL,ULICA,URL_STRANKA,ID_MESTO) values ('1','Fakultn� nemocnica s poliklinikou �ilina','421415110111','Vojtecha Spanyola 43','https://www.fnspza.sk/sk/uvod','228');
Insert into SYSTEM.NEMOCNICA (ID_NEM,NAZOV,MOBIL,ULICA,URL_STRANKA,ID_MESTO) values ('2','Poliklinika Kysuck� Nov� Mesto','041/4207373','Belansk�ho 773',null,'1328');
REM INSERTING into SYSTEM.OBLAST_URCENIA
SET DEFINE OFF;
Insert into SYSTEM.OBLAST_URCENIA (ID_OBLAST,NAZOV) values ('1','hor��ka');
Insert into SYSTEM.OBLAST_URCENIA (ID_OBLAST,NAZOV) values ('2','boles�');
REM INSERTING into SYSTEM.ODDELENIE
SET DEFINE OFF;
Insert into SYSTEM.ODDELENIE (ID_ODDEL,ID_NEM,ID_PRIMAR,NAZOV_ODD) values ('1','1',null,'Gastroenterol�gia');
Insert into SYSTEM.ODDELENIE (ID_ODDEL,ID_NEM,ID_PRIMAR,NAZOV_ODD) values ('2','2',null,'V�eobecn� lek�r');
REM INSERTING into SYSTEM.OKRES
SET DEFINE OFF;
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('1','1','Bratislava I');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('2','1','Bratislava II');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('3','1','Bratislava III');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('4','1','Bratislava IV');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('5','1','Bratislava V');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('6','1','Malacky');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('7','1','Pezinok');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('8','1','Senec');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('9','2','Trnava');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('10','2','Dunajsk� Streda');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('11','2','Galanta');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('12','2','Hlohovec');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('13','2','Pie��any');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('14','2','Senica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('15','2','Skalica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('16','3','Tren��n');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('17','3','B�novce nad Bebravou');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('18','3','Ilava');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('19','3','Myjava');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('20','3','Nov� Mesto nad V�hom');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('21','3','Partiz�nske');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('22','3','Pova�sk� Bystrica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('23','3','Prievidza');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('24','3','P�chov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('25','4','Nitra');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('26','4','Kom�rno');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('27','4','Levice');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('28','4','Nov� Z�mky');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('29','4','�a�a');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('30','4','Topo��any');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('31','4','Zlat� Moravce');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('32','5','�ilina');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('33','5','Byt�a');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('34','5','�adca');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('35','5','Doln� Kub�n');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('36','5','Kysuck� Nov� Mesto');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('37','5','Liptovsk� Mikul�');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('38','5','Martin');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('39','5','N�mestovo');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('40','5','Ru�omberok');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('41','5','Tur�ianske Teplice');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('42','5','Tvrdo��n');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('43','6','Bansk� Bystrica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('44','6','Bansk� �tiavnica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('45','6','Brezno');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('46','6','Detva');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('47','6','Krupina');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('48','6','Lu�enec');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('49','6','Polt�r');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('50','6','Rev�ca');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('51','6','Rimavsk� Sobota');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('52','6','Ve�k� Krt�');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('53','6','Zvolen');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('54','6','�arnovica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('55','6','�iar nad Hronom');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('56','7','Pre�ov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('57','7','Bardejov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('58','7','Humenn�');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('59','7','Ke�marok');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('60','7','Levo�a');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('61','7','Medzilaborce');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('62','7','Poprad');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('63','7','Sabinov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('64','7','Snina');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('65','7','Star� �ubov�a');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('66','7','Stropkov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('67','7','Svidn�k');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('68','7','Vranov nad Top�ou');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('69','8','Ko�ice I');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('70','8','Ko�ice II');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('71','8','Ko�ice III');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('72','8','Ko�ice IV');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('73','8','Ko�ice-okolie');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('74','8','Gelnica');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('75','8','Michalovce');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('76','8','Ro��ava');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('77','8','Sobrance');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('78','8','Spi�sk� Nov� Ves');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('79','8','Trebi�ov');
Insert into SYSTEM.OKRES (ID_OKRES,ID_KRAJ,NAZOV) values ('80','8','Ko�ice - okolie');
REM INSERTING into SYSTEM.PACIENT
SET DEFINE OFF;
REM INSERTING into SYSTEM.POISTOVNA
SET DEFINE OFF;
Insert into SYSTEM.POISTOVNA (ID_POISTOVNA,NAZOV,KONTAKT_MOBIL,LOGO_URL,ODKAZ_URL) values ('1','D�VERA zdravotn� pois�ov�a','0850 850 850','https://poistovne.sk/data/images/17669.jpg','http://www.dovera.sk');
Insert into SYSTEM.POISTOVNA (ID_POISTOVNA,NAZOV,KONTAKT_MOBIL,LOGO_URL,ODKAZ_URL) values ('2','Union zdravotn� pois�ov�a, a.s.','0850 003 333','https://poistovne.sk/data/images/65.jpg','https://www.union.sk/zdravotna-poistovna/');
Insert into SYSTEM.POISTOVNA (ID_POISTOVNA,NAZOV,KONTAKT_MOBIL,LOGO_URL,ODKAZ_URL) values ('3','V�eobecn� zdravotn� pois�ov�a, a.s.','0850 003 003','https://poistovne.sk/data/images/66.jpg','http://www.vszp.sk');
REM INSERTING into SYSTEM.PREDP_LIECBA
SET DEFINE OFF;
REM INSERTING into SYSTEM.PRIZNAKY
SET DEFINE OFF;
REM INSERTING into SYSTEM.RECEPT
SET DEFINE OFF;
REM INSERTING into SYSTEM."RoleClaims"
SET DEFINE OFF;
REM INSERTING into SYSTEM."Roles"
SET DEFINE OFF;
Insert into SYSTEM."Roles" ("Id","Name","NormalizedName","ConcurrencyStamp") values ('3','Pacient','PACIENT','5180f88f-92cf-469e-8be9-ee68fa05b67b');
Insert into SYSTEM."Roles" ("Id","Name","NormalizedName","ConcurrencyStamp") values ('1','Spravca','SPRAVCA','893937e0-3175-4d89-895c-5b14a9940fb1');
Insert into SYSTEM."Roles" ("Id","Name","NormalizedName","ConcurrencyStamp") values ('2','Lekar','LEKAR','771f9cf4-38a4-4273-9532-fdb42b1a872d');
REM INSERTING into SYSTEM.SQLPLUS_PRODUCT_PROFILE
SET DEFINE OFF;
REM INSERTING into SYSTEM.TYP_LEKARA
SET DEFINE OFF;
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('49','Pediater','detsk� lek�r, venuje sa starostlivosti o die�a a to od jeho narodenia a� po dosiahnutie dospelosti, lek�rska starostlivos� o deti zahr�uje prevenciu, diagnostiku i lie�bu ich ochoren�');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('50','Plastick� chirurg','chirurg zaoberaj�ci sa chirurgickou n�pravou vroden�ch �i z�skan�ch tvarov�ch, ve�kostn�ch a funk�n�ch odchyliek jednotliv�ch �ast� �udsk�ho tela, od norm�lu');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('51','Pneumol�g','lek�r, ktor� sa zaober� v�skumom, diagn�zou a lie�bou p��cnych ochoren�');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('52','Praktick� lek�r','lek�r so v�eobecnou praxou (na rozdiel od odborn�ho, �pecializovan�ho), ktor� zais�uje prim�rnu lie�ebn� a prevent�vnu starostlivos� o dospel� popul�ciu, m��e zais�ova� i starostlivos� o deti a dorast');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('53','Psychiater','lek�r, ktor� sa zaober� rozpozn�van�m, prevenciou a lie�bou du�evn�ch por�ch');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('54','Psychol�g','"vysoko�kolsky �tudovan� �lovek, ktor� sa zaober� ""du�ou"""');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('55','Radiol�g','lek�r zaoberaj�ci sa r�diodiagnostikou (diagnostikou pomocou r�ntgenov�ch met�d), zaoberaj�ci sa i �al��mi zobrazovac�mi met�dami, ako s� vy�etrenia ultrazvukom alebo pomocou magnetickej rezonancie, pr�p. denzitometriou');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('56','R�dioterapeut','lek�r zaoberaj�ci sa r�dioterapiou - o�arovan�m');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('57','Rehabilita�n� lek�r','zaober� sa obnoven�m p�vodn�ho stavu a schopnost� pacienta (jeho pohyblivos�ou, v�konnos�ou, pracovnou schopnos�ou)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('58','Reumatol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou a lie�bou z�palov�ch i nez�palov�ch reumatick�ch ochoren� k�bov, �liach, svalov a pr�buzn�ch �trukt�r');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('59','Sexuol�g','lek�r zaoberaj�ci sa �udskou sexualitou, �t�diom, diagnostikou a lie�bou sexu�lnych por�ch');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('60','Stomatol�g','zubn� lek�r alebo stomatol�g sa zaober� funkciou zubov, kost� a m�kk�ch tkan�v v �stnej dutine.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('61','Toxikol�g','lek�r, odborn� pracovn�k zaoberaj�ci sa toxikol�giou. N�ukou o jedoch a liekoch.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('62','Traumatol�g','chirurg zaoberaj�ci sa komplexnou lie�bou poranen�, najm� pohybov�ho �strojenstva ( �razov� lek�rstvo )');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('63','Urol�g','lek�r � chirurg � zaoberaj�ci sa ochoren�m mo�ov�ho syst�mu a mu�sk�ch pohlavn�ch org�nov a ich lie�bou, v�etne opera�nej lie�by');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('64','Venerol�g','odborn�k zaoberaj�ci sa pohlavn�mi chorobami');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('65','V�eobecn� lek�r pre deti a dorast','praktick� lek�r prv�ho kontaktu, ktor� sa venuje de�om a dorastencom od 0 - 25 rokov');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('66','V�eobecn� lek�r pre dospel�ch','in� n�zov pre praktick�ho lek�ra, ktor� sa venuje �u�om star��m ako 18, respekt�ve 25 rokov');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('33','Kardiol�g','lek�r zaboberaj�ci sa ochoren�m srdca a ciev, celkovo sa vy�le�uje s odboru vn�torn�ho alebo intern�ho lek�rstva. Oblas� zah��a diagnostiku vroden�ch srdcov�ch ch�b, ischemick� choroby, srdcov� zlyhania a ostatn� ochorenia srdca a ciev.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('34','Klinick� a dopravn� psychol�g','Zaober� sa dopravnou psychol�giou. Testuje vodi�ov.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('35','Klinick� biochemik','je lek�r v odbore klinick� bioch�mia, ktor� sa zaober� biochemick�mi poruchami a anal�zami telesn�ch tekut�n, buniek a tkan�v ako aj interpret�ciou z�skan�ch v�sledkov v zdrav� a chorobe.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('36','Logop�d','zaober� sa prevenciou a n�pravou por�ch re�i u det� i dospel�ch.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('37','Mamol�g','mamol�gia je medic�nsky odbor, ktor� sa zaober� problematikou ochoren� prsn�kov. Ide o multidisciplin�rny odbor, preto�e v sebe zah��a diagnostiku, chirurgiu, patol�giu a lie�bu ochoren� mlie�nej ��azy.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('38','Mikrobiol�g','odborn�k, ktor� sk�ma jednobunkov� mikroorganizmy, nebunkov� organizmy a subv�rov� patog�ny');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('39','Nefrol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou a lie�bou chor�b obli�iek, vr�tane hemo � dial�zy.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('40','Neonatol�g','lek�r venuj�ci sa problematike novorodeneck�ho obdobia, lek�r, ktor� spad� do podoboru pediatrie,');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('41','Neurochirurg','chirurg, ktor� sa zaober� opera�nou lie�bou ochoren� nervov�ho syst�mu, medzi ktor� patria n�dory �i �razy mozgu a miechy, perif�rnych ne');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('42','Neurol�g','lek�r zaoberaj�ca sa �t�diom, diagnostikou a neopera�nou lie�bou chor�b nervov�ho syst�mu (mozgu, miechy, nervov a nimi inervovan�ch svalov)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('43','Nozol�g','odborn�k, ktor� sa zaober� trieden�m chor�b a systematick�m opisom chor�b');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('44','Oftalmol�g','o�n� lek�r, zaober� sa v�skumom, diagn�zou, prevenciou a lie�bou o�n�ch chor�b vzh�adom k skute�nosti, �e o�n� lek�ri prev�dzaj� oper�cie o��, s� pova�ovan� za lek�rov a chirurgov.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('45','Onkol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou a lie�bou n�dorov�ch ochoren� (rakoviny), vr�tane r�dioterapie (lie�ba �iaren�m)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('46','Ortop�d',' lek�r zaoberaj�ci sa prevenciou, zis�ovan�m a lie�en�m vroden�ch alebo z�skan�ch ch�b, chor�b a �razov pohybov�ho �stroja');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('47','Otorinolaryngol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou, prevenciou a lie�bou chor�b : u�n�ch, nosn�ch a kr�n�ch. Pracovisko kde p�sob� otorinolaringol�g sa be�ne ozna�uje ORL');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('48','Patol�g','lek�r zaoberaj�ci sa n�ukou o chorob�ch (o chorobn�ch pochodoch a zmen�ch v �udskom tele)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('1','Akupunkturista','lek�r zaoberaj�ci sa akupukt�rou. Akupunkt�ra je medic�nska met�da poch�dzaj�ca z ��ny.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('2','Alergol�g a imunol�g','lek�r zaoberaj�cim sa �t�diom, diagnostikou, lie�bou a prevenciou chor�b, ktor� s� vyvol�van� poruchami imunity (napr. alergia, imunodeficitn� stavy a pod.)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('3','Algeziol�g','lek�r, ktor� sa zaober� lie�en�m ak�tnej, chronickej a n�dorovej bolesti');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('4','Anest�ziol�g','lek�r zaoberaj�ci sa anest�ziou (znecitliven�m), staraj�ci sa o spr�vne uspatie pacienta pri oper�ci�');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('5','Angiochirurg','cievny chirurg');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('6','Angiol�g','lek�r z oboru vn�torn�ho lek�rstva, tj. internista, zaoberaj�ci sa �t�diom, diagnostikou, lie�bou a prevenciou ochoren� ciev');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('7','Audiol�g','lek�r zaoberaj�ci sa sluchom a jeho poruchami, lek�rsky odbor spojen� s ORL, odbor lek�rstva zaoberaj�ci sa sluchom a poruchami sluchu');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('8','Chirurg','lek�r zaoberaj�ci sa opera�nou lie�bou ochoren� r�znych org�nov vr�tane poranen�(napr. kardiochirurg, plastick� chirurg a pod.)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('9','Cytol�g','odborn�k v oblasti cytol�gie');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('10','Dermatol�g - ko�n� lek�r','ko�n� lek�r, zaober� sa v�skumom, diagn�zou a lie�bou ko�n�ch chor�b');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('11','Dermatovenerol�g','odborn� lek�r zaoberaj�ci sa, diagnostikou a lie�bou ko�n�ch a pohlavn�ch chor�b');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('12','Diabetol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou, prevenciou a lie�bou cukrovky (odborne: diabetes mellitus) a jej komplik�ciami');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('13','Diagnostik','lek�r, ktor� ur�uje choroby (diagn�zy). Tento odbor sa m��e zlu�ova� s �al��mi.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('14','Endokrinol�g','lek�r zaoberaj�ci sa �t�diom �liaz s vn�tornou sekr�ciou a ich produktov (horm�nov), diagnostikuje a lie�i ich poruchy');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('15','Epidemiol�g','lek�r, odborn�k, ktor� �tuduje v popul�ci� v�skyt a rozlo�enie ur�it�ch ochoren�, �i znakov a javov so vz�ahom k zdraviu, medzi ne patria choroby infek�n�ho alebo chronick�(napr. srdcov� cievne)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('16','Foniatrik','lek�r zaoberaj�ci sa foniatriou. Foniatria (z gr�ck�ho slova phoniatria) je lek�rskym odborom, ktor� se zaober� vy�etrovan�m funkci�: hlasu, re�i a sluchu,');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('17','Ftizeol�g','lek�r zaoberaj�ci sa prevenciou, diagnostikou a lie�bou tuberkul�zy');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('18','Fyzioterapeut','fyzioterapeut pom�ha rehabilitova� �ud�, ktor� sa zotavuj� po zraneniach, oper�ci�ch, alebo ktor� trpia ochoreniami svalstva alebo k�bov.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('19','Gastroenterol�g','lek�r zaoberaj�ci sa v�skumom, diagn�zou a lie�bou chor�b tr�viaceho syst�mu (�al�dka, �riev, slinivky bru�nej, dvan�storn�ka.)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('20','Genetik','lek�r zaoberaj�ci sa n�ukou o dedi�nosti, tj. v�skumom, diagnostikou, lie�bou a prevenciou dedi�n�ch por�ch a chor�b.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('21','Geriater','lek�r, ktor� sa zaober� prevenciou, diagnostikou, lie�bou a rehabilit�ciou seniorov, t.j. os�b vo veku nad 65 rokov.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('22','Gerontol�g','je lek�r, ktor� sa zaober� procesom starnutia a ochoren� t�kaj�cich sa starnutia.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('23','Gynekol�g - Reproduk�n� medic�na','Reproduk�n� medic�na je lek�rsky odbor, ktor� sa zaober� fyziol�giou a odch�lkami reproduk�n�ho syst�mu �loveka, so zameran�m na lie�bu por�ch a ochoren� reproduk�n�ho syst�mu �eny.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('24','Gynekol�g a p�rodn�k','lek�r zaoberaj�ci sa v�skumom, diagn�zou, lie�bou a prevenciou chor�b �ensk�ch pohlavn�ch org�nov, jeho n�pl�ou je tie� starostlivos� o �enu v obdob� tehotenstva, v priebehu p�rodu i po �om');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('25','Hematol�g','lek�r, ktor� �tuduje krv');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('26','Hepatol�g',' lek�r zaoberaj�ci sa �t�diom, diagn�zou a lie�en�m pe�e�ov�ch ochoren�');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('27','Histol�g','lek�r, ktor� sa zaober� �t�diom mikroskopickej �trukt�ry org�nov a tkan�v. Histol�gia naj�astej�ie pou��va sveteln� mikroskop a r�zne farbiace techniky.');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('28','Homeopat','lek�r, ktor� si svoje lek�rske vzdelanie doplnil �t�diom homeopatie');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('29','Hygienik','lek�r zaoberaj�ci sa n�ukou o zdravom sp�sobe �ivota jedinca i spolo�nosti, opatreniami, ktor� zabezpe�uj� ochranu zdravia, �alej dodr�ovan�m hygienick�ch z�sad, noriem a predpisov');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('30','Infektol�g','lek�r zaoberaj�ci sa diagnostikou, lie�en�m a v�skumom infek�n�ch ochoren�');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('31','Internista','lek�r zaoberaj�ci sa diagn�zou a nechirurgickou lie�bou chor�b vn�torn�ch org�nov (srdca, p��c, tr�viaceho �strojenstva, �liaz s vn�tornou sekr�ciou at�.)');
Insert into SYSTEM.TYP_LEKARA (ID_TYP,NAZOV,POPIS) values ('32','Kardiochirurg','chirurg, ktor� sa venuje opera�nej lie�be ochoren� srdca, medzi ktor� patr� vroden� alebo z�skan� vady chlopn�, aortokoron�rny bypass, transplant�cia srdca a in�.');
REM INSERTING into SYSTEM.TYP_SYMPTOM
SET DEFINE OFF;
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('1','svrbenie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('2','ko�n� vyr�ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('3','uzlina na poko�ke');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('4','nepretr�it� k�chanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('5','tria�ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('6','zimnica');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('7','boles� k�bov');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('8','boles� brucha');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('9','kyslos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('10','vredy na jazyku');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('11','ochabovanie svalov');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('12','vracanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('13','p�lenie_mixovanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('14','�ast� mo�enie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('15','�nava');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('16','priberanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('17','�zkos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('18','studen� ruky a nohy');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('19','v�kyvy n�lad');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('20','strata v�hy');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('21','nepokoj');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('22','letargia');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('23','n�ivky v hrdle');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('24','hladina nepravideln�ho cukru');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('25','ka�e�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('26','vysok� hor��ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('27','potopen�_ o�i');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('28','d�chavi�nos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('29','potenie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('30','dehydrat�cia');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('31','poruchy tr�venia');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('32','boles� hlavy');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('33','�ltkast� ko�a');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('34','tmav� mo�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('35','nevo�nos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('36','strata chuti do jedla');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('37','boles� v zadnej �asti oka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('38','boles� chrbta');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('39','z�pcha');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('40','boles� brucha');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('41','hna�ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('42','mierna hor��ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('43','�lt� mo�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('44','za�ltnut� o�i');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('45','ak�tne �ivotn� zlyhanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('46','pre�a�enie tekutinou');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('47','opuch �al�dka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('48','zva�en� uzliny v hrdle');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('49','mal�tnos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('50','rozmazan� a zkreslen� videnie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('51','hlien');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('52','hrdlo_dr�denie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('53','za�ervenan� o�i');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('54','s�nusov� tlak');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('55','st�le soplenie ');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('56','pre�a�enie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('57','boles� v hrudi');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('58','slabosti v kostiach');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('59','r�chly srdcov� tep');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('60','bolestiv� pohyby');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('61','boles� v oblasti kone�n�ka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('62','krv v stolici');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('63','podr�denie_v_anuse');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('64','boles� krku');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('65','z�vrat');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('66','k��e');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('67','podliatiny');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('68','obezita');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('69','opuchnut� nohy');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('70','opuch ��l');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('71','opuch tv�re a o��');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('72','zv��en�_�t�tna ��aza');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('73','krechk� nechty');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('74','nadmern� opuch ');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('75','nadmern� hlad');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('76','�ast� sexualny kontakt');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('77','su�enie_a_mrav�anie_pier');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('78','nezrozumite�n� prejav');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('79','boles� kolena');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('80','boles� bedrov�ho k�bu');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('81','svalov�_slabos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('82','stuhnut� krk');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('83','opuch k�bov');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('84','z�vraty');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('85','to�enie pri pohybe');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('86','strata stability');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('87','nestabilita');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('88','oslaben� jedna strana tela');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('89','strata �uchu');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('90','nepr�jemn� pocit v oblasti mo�ov�ho mech�ra');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('91','z�pach v mo�i');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('92','�ast� pocit na mo�enie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('93','"nad�vanie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('94','vn�torn� svrbenie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('95','toxick� v�zor(T�fus)');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('96','depresia');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('97','podr�denos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('98','svalov� boles�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('99','zmenena pozornosti');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('100','�erven� bodky na tele');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('101','bolest brucha');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('102','abnorm�lna men�tru�cia');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('103','farboslepos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('104','slzenie o��');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('105','zv��en� chu� do jedla');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('106','poly�ria');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('107','rodinn� hist�ria');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('108','vnutorn� kyselina');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('109','hlie�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('110','nedostatok koncentr�cie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('111','vizu�lne poruchy');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('112','pr�jem krvnej transf�zie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('113','prij�manie nesterilnych injekci�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('114','k�ma');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('115','krv�canie zo �al�dka');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('116','roztiahnutie bru�nej dutiny');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('117','pozostatok alkoholu ');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('118','pre�a�enie tekutinou');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('119','krv v hlieni');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('120','opuch ��l na l�tku');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('121','b��enie srdca');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('122','bolestiv� ch�dza');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('123','hnisav� vyr�ky');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('124','�ierne bodky');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('125','�kr�panie');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('126','odlup�vanie ko�e');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('127','bledos�');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('128','mal� jamky v nechtoch');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('129','z�palov� nechty');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('130','p�uzgier');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('131','�erven� opuch nosa');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('132','�ltkast� k�ra na tv�ri');
Insert into SYSTEM.TYP_SYMPTOM (ID_SYMPTOM,NAZOV) values ('133','progn�za');
REM INSERTING into SYSTEM.UCINNA_LATKA
SET DEFINE OFF;
Insert into SYSTEM.UCINNA_LATKA (ID_LATKA,ID_LIEK,UCINNA_LATKA,UCINNA_LATKA_GRAMAZ) values ('1','1','Paracetamol','500');
REM INSERTING into SYSTEM."UserClaims"
SET DEFINE OFF;
REM INSERTING into SYSTEM."UserLogins"
SET DEFINE OFF;
REM INSERTING into SYSTEM."UserRoles"
SET DEFINE OFF;
Insert into SYSTEM."UserRoles" ("UserId","RoleId") values ('1','1');
Insert into SYSTEM."UserRoles" ("UserId","RoleId") values ('2','2');
Insert into SYSTEM."UserRoles" ("UserId","RoleId") values ('3','3');
REM INSERTING into SYSTEM."Users"
SET DEFINE OFF;
Insert into SYSTEM."Users" ("Registrovany","Meno","Priezvisko","RodPriezvisko","RodCislo","DatNarodenia","Email","Mobil","PoslednePrihlasenie","Pohlavie","Id","AccessFailedCount","ConcurrencyStamp","EmailConfirmed","LockoutEnabled","LockoutEnd","NormalizedEmail","NormalizedUserName","PhoneNumber","PhoneNumberConfirmed","SecurityStamp","TwoFactorEnabled","UserName","PasswordHash") values (to_timestamp('12.10.21 14:47:28,577188000','DD.MM.RR HH24:MI:SSXFF'),'admin','x',null,'x          ',to_date('24.11.98','DD.MM.RR'),'admin@gmail.com','x',to_timestamp('12.10.21 14:47:28,577197600','DD.MM.RR HH24:MI:SSXFF'),'M','1','0','72c3f3d4-fd4b-4fdc-9a72-ee95a00b7c28','0','1',null,'ADMIN@GMAIL.COM','ADMIN',null,'0','IC3DQFUHPHTNE2RUVXASTOCWLLXMN7JX','0','admin','AQAAAAEAACcQAAAAEES2X0sfXvBIGcuaUbtt86dFqf89uzVn0xeYnEk2j4/JsqeDoSrbi1Xuadx4RLsbvA==');
Insert into SYSTEM."Users" ("Registrovany","Meno","Priezvisko","RodPriezvisko","RodCislo","DatNarodenia","Email","Mobil","PoslednePrihlasenie","Pohlavie","Id","AccessFailedCount","ConcurrencyStamp","EmailConfirmed","LockoutEnabled","LockoutEnd","NormalizedEmail","NormalizedUserName","PhoneNumber","PhoneNumberConfirmed","SecurityStamp","TwoFactorEnabled","UserName","PasswordHash") values (to_timestamp('13.10.21 12:36:57,172821400','DD.MM.RR HH24:MI:SSXFF'),'Mudr. Peter','Stanik',null,'801124/4169',to_date('24.11.80','DD.MM.RR'),'motivationgajdy@gmail.com','421414207370',to_timestamp('13.10.21 12:36:57,172831400','DD.MM.RR HH24:MI:SSXFF'),'M','2','0','e92bb80e-ce48-4418-9535-90ac8833da79','0','1',null,'MOTIVATIONGAJDY@GMAIL.COM','MOTIVATIONGAJDY',null,'0','OKAIL4BDLV46ELNFPPUWSGBXXMYBM346','0','motivationgajdy','AQAAAAEAACcQAAAAEOUwtdQMJJei8U7bBMUalZRgQ/ySRU0DbW+ErUBuNp2uH0RqDfNYj/aqyD6EW+SdTg==');
Insert into SYSTEM."Users" ("Registrovany","Meno","Priezvisko","RodPriezvisko","RodCislo","DatNarodenia","Email","Mobil","PoslednePrihlasenie","Pohlavie","Id","AccessFailedCount","ConcurrencyStamp","EmailConfirmed","LockoutEnabled","LockoutEnd","NormalizedEmail","NormalizedUserName","PhoneNumber","PhoneNumberConfirmed","SecurityStamp","TwoFactorEnabled","UserName","PasswordHash") values (to_timestamp('17.10.21 21:38:25,545974300','DD.MM.RR HH24:MI:SSXFF'),'Martin','Gajdos','Gajdos','901124/4168',to_date('24.11.90','DD.MM.RR'),'martingajdos.zs@gmail.com','421904362907',to_timestamp('17.10.21 21:38:25,545977900','DD.MM.RR HH24:MI:SSXFF'),'M','3','0','8a8ba8f3-315f-4326-860b-1e81d06391dc','0','1',null,'MARTINGAJDOS.ZS@GMAIL.COM','MARTINGAJDOS.ZS',null,'0','ZYBJKU4JIV6IKKWWP5S3ZEP25VZS65XH','0','martingajdos.zs','AQAAAAEAACcQAAAAEK7fdoSJz3XjRMd0sD5wL72Ojw9nZAR3u4GvqWTRsjhA7b+ysjW6+ADX+o1Z9dWq6Q==');
REM INSERTING into SYSTEM."UserTokens"
SET DEFINE OFF;
REM INSERTING into SYSTEM.VYK_VYSETRENIA
SET DEFINE OFF;
REM INSERTING into SYSTEM.ZAP_CHOROBY
SET DEFINE OFF;
REM INSERTING into SYSTEM.ZDRAV_KARTA_POVOLENIA
SET DEFINE OFF;
REM INSERTING into SYSTEM.ZDRAV_POISTENIE
SET DEFINE OFF;
REM INSERTING into SYSTEM.ZDRAVOTNA_KARTA
SET DEFINE OFF;
REM INSERTING into SYSTEM.ZIADANKA
SET DEFINE OFF;
Insert into SYSTEM.ZIADANKA (ID_PACIENT,ID_LEKAR,VYTVORENA,AKCEPTOVANA) values ('3','1',to_date('17.10.21','DD.MM.RR'),null);
--------------------------------------------------------
--  DDL for Index PK___EFMigrationsHistory
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK___EFMigrationsHistory" ON "SYSTEM"."__EFMigrationsHistory" ("MigrationId") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ATESTACIE_LEKAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ATESTACIE_LEKAR" ON "SYSTEM"."ATESTACIE_LEKAR" ("ID_ATESTACIA", "ID_LEKAR", "ID_TYP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP29
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP29" ON "SYSTEM"."BYDLISKO" ("ID_POUZIVATEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP102
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP102" ON "SYSTEM"."BYDLISKO" ("ID_MESTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_BYDLISKO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_BYDLISKO" ON "SYSTEM"."BYDLISKO" ("ID_BYDLISKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_FOTKA_POUZIVATEL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_FOTKA_POUZIVATEL" ON "SYSTEM"."FOTKA_POUZIVATEL" ("ID_POUZIVATEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_CHOROBA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_CHOROBA" ON "SYSTEM"."CHOROBA" ("CIS_CHOROBA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_KRAJ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_KRAJ" ON "SYSTEM"."KRAJ" ("ID_KRAJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP72
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP72" ON "SYSTEM"."L_BALENIE" ("ID_LIEK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_L_BALENIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_L_BALENIE" ON "SYSTEM"."L_BALENIE" ("KOD_BALENIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP16
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP16" ON "SYSTEM"."LEKAR" ("ID_POUZIVATEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP51
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP51" ON "SYSTEM"."LEKAR" ("ID_ODDEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LEKAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_LEKAR" ON "SYSTEM"."LEKAR" ("ID_LEKAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LIEK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_LIEK" ON "SYSTEM"."LIEK" ("ID_LIEK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LIEK_APLIKACIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_LIEK_APLIKACIA" ON "SYSTEM"."LIEK_APLIKACIA" ("ID_LIEK", "ID_OBLAST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_LIEK_UCINNA_LATKA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_LIEK_UCINNA_LATKA" ON "SYSTEM"."LIEK_UCINNA_LATKA" ("ID_LIEK", "ID_LATKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_MESTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_MESTO" ON "SYSTEM"."MESTO" ("ID_MESTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP70
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP70" ON "SYSTEM"."MESTO" ("ID_OKRES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP100
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP100" ON "SYSTEM"."NEMOCNICA" ("ID_MESTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_NEMOCNICA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_NEMOCNICA" ON "SYSTEM"."NEMOCNICA" ("ID_NEM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_OBLAST_URCENIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_OBLAST_URCENIA" ON "SYSTEM"."OBLAST_URCENIA" ("ID_OBLAST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP49
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP49" ON "SYSTEM"."ODDELENIE" ("ID_NEM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP61
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP61" ON "SYSTEM"."ODDELENIE" ("ID_PRIMAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ODDELENIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ODDELENIE" ON "SYSTEM"."ODDELENIE" ("ID_ODDEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP1" ON "SYSTEM"."OKRES" ("ID_KRAJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_OKRES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_OKRES" ON "SYSTEM"."OKRES" ("ID_OKRES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP33
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP33" ON "SYSTEM"."PACIENT" ("ID_VSEOBECNY_LEKAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP10
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP10" ON "SYSTEM"."PACIENT" ("ID_POUZIVATEL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PACIENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_PACIENT" ON "SYSTEM"."PACIENT" ("ID_PACIENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_POISTOVNA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_POISTOVNA" ON "SYSTEM"."POISTOVNA" ("ID_POISTOVNA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PREDP_LIECBA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_PREDP_LIECBA" ON "SYSTEM"."PREDP_LIECBA" ("ID_LIEK", "OD", "ID_VYSETRENIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_PRIZNAKY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_PRIZNAKY" ON "SYSTEM"."PRIZNAKY" ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA", "ID_SYMPTOM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP35
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP35" ON "SYSTEM"."RECEPT" ("ID_VYSETRENIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP41
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP41" ON "SYSTEM"."RECEPT" ("ID_LIEK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_RECEPT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_RECEPT" ON "SYSTEM"."RECEPT" ("ID_RECEPT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_RoleClaims
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_RoleClaims" ON "SYSTEM"."RoleClaims" ("Id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_Roles
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_Roles" ON "SYSTEM"."Roles" ("Id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_TYP_LEKARA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_TYP_LEKARA" ON "SYSTEM"."TYP_LEKARA" ("ID_TYP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_TYP_SYMPTOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_TYP_SYMPTOM" ON "SYSTEM"."TYP_SYMPTOM" ("ID_SYMPTOM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_UCINNA_LATKA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_UCINNA_LATKA" ON "SYSTEM"."UCINNA_LATKA" ("ID_LATKA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_UserClaims
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_UserClaims" ON "SYSTEM"."UserClaims" ("Id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_UserLogins
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_UserLogins" ON "SYSTEM"."UserLogins" ("UserId") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_UserRoles
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_UserRoles" ON "SYSTEM"."UserRoles" ("RoleId", "UserId") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_UserRoles_UserId
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_UserRoles_UserId" ON "SYSTEM"."UserRoles" ("UserId") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_Users
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_Users" ON "SYSTEM"."Users" ("Id") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_UserTokens
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_UserTokens" ON "SYSTEM"."UserTokens" ("UserId") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP23
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP23" ON "SYSTEM"."VYK_VYSETRENIA" ("ID_LEKAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP36
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP36" ON "SYSTEM"."VYK_VYSETRENIA" ("ID_PACIENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_VYK_VYSETRENIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_VYK_VYSETRENIA" ON "SYSTEM"."VYK_VYSETRENIA" ("ID_VYSETRENIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP32
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP32" ON "SYSTEM"."ZAP_CHOROBY" ("ID_VYSETRENIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ZAP_CHOROBY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ZAP_CHOROBY" ON "SYSTEM"."ZAP_CHOROBY" ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ZDRAV_KARTA_POVOLENIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ZDRAV_KARTA_POVOLENIA" ON "SYSTEM"."ZDRAV_KARTA_POVOLENIA" ("OD", "ID_LEKAR", "ID_PACIENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ZDRAV_POISTENIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ZDRAV_POISTENIE" ON "SYSTEM"."ZDRAV_POISTENIE" ("ID_POISTOVNA", "ID_PACIENT", "OD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ZDRAVOTNA_KARTA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ZDRAVOTNA_KARTA" ON "SYSTEM"."ZDRAVOTNA_KARTA" ("ID_PACIENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_RELATIONSHIP104
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_RELATIONSHIP104" ON "SYSTEM"."ZDRAVOTNA_KARTA" ("ID_MESTO_NARODENIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PK_ZIADANKA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_ZIADANKA" ON "SYSTEM"."ZIADANKA" ("ID_PACIENT", "ID_LEKAR", "VYTVORENA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_ZIADANKA_ID_LEKAR
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_ZIADANKA_ID_LEKAR" ON "SYSTEM"."ZIADANKA" ("ID_LEKAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_ZIADANKA_ID_PACIENT
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_ZIADANKA_ID_PACIENT" ON "SYSTEM"."ZIADANKA" ("ID_PACIENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table __EFMigrationsHistory
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."__EFMigrationsHistory" MODIFY ("MigrationId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."__EFMigrationsHistory" MODIFY ("ProductVersion" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."__EFMigrationsHistory" ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ATESTACIE_LEKAR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" MODIFY ("ID_LEKAR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" MODIFY ("ID_TYP" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" MODIFY ("ID_ATESTACIA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" MODIFY ("ATESTACIA_OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" ADD CONSTRAINT "PK_ATESTACIE_LEKAR" PRIMARY KEY ("ID_ATESTACIA", "ID_LEKAR", "ID_TYP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BYDLISKO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BYDLISKO" MODIFY ("ID_MESTO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BYDLISKO" MODIFY ("ID_BYDLISKA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BYDLISKO" MODIFY ("ULICA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BYDLISKO" MODIFY ("ADRESA_OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BYDLISKO" MODIFY ("TRVALE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BYDLISKO" ADD CONSTRAINT "PK_BYDLISKO" PRIMARY KEY ("ID_BYDLISKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FOTKA_POUZIVATEL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FOTKA_POUZIVATEL" MODIFY ("ID_POUZIVATEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FOTKA_POUZIVATEL" MODIFY ("FOTKA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FOTKA_POUZIVATEL" ADD CONSTRAINT "PK_FOTKA_POUZIVATEL" PRIMARY KEY ("ID_POUZIVATEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHOROBA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CHOROBA" MODIFY ("CIS_CHOROBA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CHOROBA" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CHOROBA" MODIFY ("VALID_OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CHOROBA" ADD CHECK (obm_pohlavie in ('Z','M','D','V','A')) ENABLE;
  ALTER TABLE "SYSTEM"."CHOROBA" ADD CONSTRAINT "PK_CHOROBA" PRIMARY KEY ("CIS_CHOROBA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KRAJ
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KRAJ" MODIFY ("ID_KRAJ" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KRAJ" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KRAJ" ADD CONSTRAINT "PK_KRAJ" PRIMARY KEY ("ID_KRAJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table L_BALENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."L_BALENIE" MODIFY ("KOD_BALENIA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."L_BALENIE" MODIFY ("SPOSOB_UHRADY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."L_BALENIE" MODIFY ("CENA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."L_BALENIE" MODIFY ("DOPLATOK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."L_BALENIE" MODIFY ("POCET_KS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."L_BALENIE" ADD CHECK (sposob_uhrady in ('I','S','A')
) ENABLE;
  ALTER TABLE "SYSTEM"."L_BALENIE" ADD CONSTRAINT "PK_L_BALENIE" PRIMARY KEY ("KOD_BALENIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LEKAR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LEKAR" MODIFY ("ID_LEKAR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEKAR" MODIFY ("ID_POUZIVATEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LEKAR" ADD CONSTRAINT "PK_LEKAR" PRIMARY KEY ("ID_LEKAR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIEK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LIEK" MODIFY ("ID_LIEK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK" MODIFY ("REZIM_VYDAJA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK" MODIFY ("LIEK_FORMA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK" ADD CHECK (rezim_vydaja in ('F','R','Rx')) ENABLE;
  ALTER TABLE "SYSTEM"."LIEK" ADD CONSTRAINT "PK_LIEK" PRIMARY KEY ("ID_LIEK")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIEK_APLIKACIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LIEK_APLIKACIA" MODIFY ("ID_LIEK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK_APLIKACIA" MODIFY ("ID_OBLAST" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK_APLIKACIA" ADD CONSTRAINT "PK_LIEK_APLIKACIA" PRIMARY KEY ("ID_LIEK", "ID_OBLAST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIEK_UCINNA_LATKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LIEK_UCINNA_LATKA" MODIFY ("ID_LIEK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK_UCINNA_LATKA" MODIFY ("ID_LATKA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LIEK_UCINNA_LATKA" ADD CONSTRAINT "PK_LIEK_UCINNA_LATKA" PRIMARY KEY ("ID_LIEK", "ID_LATKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MESTO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MESTO" MODIFY ("ID_OKRES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MESTO" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MESTO" MODIFY ("ID_MESTO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MESTO" ADD CONSTRAINT "PK_MESTO" PRIMARY KEY ("ID_MESTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NEMOCNICA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."NEMOCNICA" MODIFY ("ID_NEM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NEMOCNICA" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NEMOCNICA" MODIFY ("MOBIL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NEMOCNICA" MODIFY ("ULICA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NEMOCNICA" ADD CONSTRAINT "PK_NEMOCNICA" PRIMARY KEY ("ID_NEM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."NEMOCNICA" MODIFY ("ID_MESTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OBLAST_URCENIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."OBLAST_URCENIA" MODIFY ("ID_OBLAST" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."OBLAST_URCENIA" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."OBLAST_URCENIA" ADD CONSTRAINT "PK_OBLAST_URCENIA" PRIMARY KEY ("ID_OBLAST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ODDELENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ODDELENIE" MODIFY ("ID_ODDEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ODDELENIE" MODIFY ("ID_NEM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ODDELENIE" MODIFY ("NAZOV_ODD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ODDELENIE" ADD CONSTRAINT "PK_ODDELENIE" PRIMARY KEY ("ID_ODDEL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OKRES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."OKRES" MODIFY ("ID_OKRES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."OKRES" MODIFY ("ID_KRAJ" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."OKRES" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."OKRES" ADD CONSTRAINT "PK_OKRES" PRIMARY KEY ("ID_OKRES")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PACIENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PACIENT" MODIFY ("ID_PACIENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PACIENT" MODIFY ("ID_POUZIVATEL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PACIENT" MODIFY ("ID_VSEOBECNY_LEKAR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PACIENT" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PACIENT" ADD CONSTRAINT "PK_PACIENT" PRIMARY KEY ("ID_PACIENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POISTOVNA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."POISTOVNA" MODIFY ("ID_POISTOVNA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."POISTOVNA" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."POISTOVNA" MODIFY ("KONTAKT_MOBIL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."POISTOVNA" MODIFY ("LOGO_URL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."POISTOVNA" ADD CONSTRAINT "PK_POISTOVNA" PRIMARY KEY ("ID_POISTOVNA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PREDP_LIECBA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PREDP_LIECBA" MODIFY ("ID_LIEK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PREDP_LIECBA" MODIFY ("ID_VYSETRENIE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PREDP_LIECBA" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PREDP_LIECBA" MODIFY ("DAVKOVANIE_POCET" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PREDP_LIECBA" ADD CONSTRAINT "PK_PREDP_LIECBA" PRIMARY KEY ("ID_LIEK", "OD", "ID_VYSETRENIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRIZNAKY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PRIZNAKY" MODIFY ("CIS_CHOROBA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRIZNAKY" MODIFY ("ID_ZDRAVOTNA_KARTA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRIZNAKY" MODIFY ("ID_SYMPTOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRIZNAKY" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PRIZNAKY" ADD CONSTRAINT "PK_PRIZNAKY" PRIMARY KEY ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA", "ID_SYMPTOM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECEPT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."RECEPT" MODIFY ("ID_RECEPT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RECEPT" MODIFY ("ID_VYSETRENIE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RECEPT" MODIFY ("ID_LIEK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RECEPT" MODIFY ("BALENIE_KS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RECEPT" MODIFY ("VYSTAVENIE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RECEPT" ADD CONSTRAINT "PK_RECEPT" PRIMARY KEY ("ID_RECEPT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RoleClaims
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."RoleClaims" MODIFY ("Id" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RoleClaims" MODIFY ("RoleId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."RoleClaims" ADD CONSTRAINT "PK_RoleClaims" PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Roles
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."Roles" MODIFY ("Id" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Roles" ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SQLPLUS_PRODUCT_PROFILE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SQLPLUS_PRODUCT_PROFILE" MODIFY ("PRODUCT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYP_LEKARA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TYP_LEKARA" MODIFY ("ID_TYP" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TYP_LEKARA" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TYP_LEKARA" ADD CONSTRAINT "PK_TYP_LEKARA" PRIMARY KEY ("ID_TYP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TYP_SYMPTOM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TYP_SYMPTOM" MODIFY ("ID_SYMPTOM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TYP_SYMPTOM" MODIFY ("NAZOV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TYP_SYMPTOM" ADD CONSTRAINT "PK_TYP_SYMPTOM" PRIMARY KEY ("ID_SYMPTOM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UCINNA_LATKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UCINNA_LATKA" MODIFY ("ID_LATKA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UCINNA_LATKA" MODIFY ("UCINNA_LATKA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UCINNA_LATKA" ADD CONSTRAINT "PK_UCINNA_LATKA" PRIMARY KEY ("ID_LATKA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UserClaims
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UserClaims" MODIFY ("Id" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserClaims" MODIFY ("UserId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserClaims" ADD CONSTRAINT "PK_UserClaims" PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UserLogins
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UserLogins" MODIFY ("UserId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserLogins" ADD CONSTRAINT "PK_UserLogins" PRIMARY KEY ("UserId")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table UserRoles
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UserRoles" MODIFY ("UserId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserRoles" MODIFY ("RoleId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserRoles" ADD CONSTRAINT "PK_UserRoles" PRIMARY KEY ("RoleId", "UserId")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table Users
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."Users" MODIFY ("Registrovany" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("Meno" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("Priezvisko" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("Email" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("Id" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("Pohlavie" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("AccessFailedCount" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("EmailConfirmed" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("LockoutEnabled" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("PhoneNumberConfirmed" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" MODIFY ("TwoFactorEnabled" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."Users" ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."Users" MODIFY ("DatNarodenia" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UserTokens
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UserTokens" MODIFY ("UserId" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."UserTokens" ADD CONSTRAINT "PK_UserTokens" PRIMARY KEY ("UserId")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VYK_VYSETRENIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" MODIFY ("ID_VYSETRENIE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" MODIFY ("DATUM_VYS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" MODIFY ("VYSLEDOK" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" ADD CONSTRAINT "PK_VYK_VYSETRENIA" PRIMARY KEY ("ID_VYSETRENIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZAP_CHOROBY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" MODIFY ("ID_ZDRAVOTNA_KARTA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" MODIFY ("CIS_CHOROBA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" MODIFY ("ID_VYSETRENIE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" ADD CONSTRAINT "PK_ZAP_CHOROBY" PRIMARY KEY ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZDRAV_KARTA_POVOLENIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" MODIFY ("ID_LEKAR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" MODIFY ("ID_PACIENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" ADD CONSTRAINT "PK_ZDRAV_KARTA_POVOLENIA" PRIMARY KEY ("OD", "ID_LEKAR", "ID_PACIENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZDRAV_POISTENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" MODIFY ("ID_POISTOVNA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" MODIFY ("ID_PACIENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" MODIFY ("OD" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" ADD CONSTRAINT "PK_ZDRAV_POISTENIE" PRIMARY KEY ("ID_POISTOVNA", "ID_PACIENT", "OD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZDRAVOTNA_KARTA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" MODIFY ("ID_PACIENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" MODIFY ("ID_MESTO_NARODENIA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" MODIFY ("KRV_SKUPINA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" ADD CHECK (krv_skupina in ('A+','B+','AB+','0+','A-','B-','AB-','0-')) ENABLE;
  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" ADD CONSTRAINT "PK_ZDRAVOTNA_KARTA" PRIMARY KEY ("ID_PACIENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZIADANKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZIADANKA" MODIFY ("ID_PACIENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZIADANKA" MODIFY ("ID_LEKAR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZIADANKA" MODIFY ("VYTVORENA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZIADANKA" ADD CONSTRAINT "PK_ZIADANKA" PRIMARY KEY ("ID_PACIENT", "ID_LEKAR", "VYTVORENA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ATESTACIE_LEKAR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" ADD CONSTRAINT "RELATIONSHIP62" FOREIGN KEY ("ID_LEKAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
  ALTER TABLE "SYSTEM"."ATESTACIE_LEKAR" ADD CONSTRAINT "RELATIONSHIP63" FOREIGN KEY ("ID_TYP")
	  REFERENCES "SYSTEM"."TYP_LEKARA" ("ID_TYP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BYDLISKO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BYDLISKO" ADD CONSTRAINT "RELATIONSHIP103" FOREIGN KEY ("ID_MESTO")
	  REFERENCES "SYSTEM"."MESTO" ("ID_MESTO") ENABLE;
  ALTER TABLE "SYSTEM"."BYDLISKO" ADD CONSTRAINT "RELATIONSHIP29" FOREIGN KEY ("ID_POUZIVATEL")
	  REFERENCES "SYSTEM"."Users" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FOTKA_POUZIVATEL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FOTKA_POUZIVATEL" ADD CONSTRAINT "RELATIONSHIP55" FOREIGN KEY ("ID_POUZIVATEL")
	  REFERENCES "SYSTEM"."Users" ("Id") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table L_BALENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."L_BALENIE" ADD CONSTRAINT "RELATIONSHIP72" FOREIGN KEY ("ID_LIEK")
	  REFERENCES "SYSTEM"."LIEK" ("ID_LIEK") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LEKAR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LEKAR" ADD CONSTRAINT "RELATIONSHIP16" FOREIGN KEY ("ID_POUZIVATEL")
	  REFERENCES "SYSTEM"."Users" ("Id") ENABLE;
  ALTER TABLE "SYSTEM"."LEKAR" ADD CONSTRAINT "RELATIONSHIP51" FOREIGN KEY ("ID_ODDEL")
	  REFERENCES "SYSTEM"."ODDELENIE" ("ID_ODDEL") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIEK_APLIKACIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LIEK_APLIKACIA" ADD CONSTRAINT "RELATIONSHIP75" FOREIGN KEY ("ID_LIEK")
	  REFERENCES "SYSTEM"."LIEK" ("ID_LIEK") ENABLE;
  ALTER TABLE "SYSTEM"."LIEK_APLIKACIA" ADD CONSTRAINT "RELATIONSHIP76" FOREIGN KEY ("ID_OBLAST")
	  REFERENCES "SYSTEM"."OBLAST_URCENIA" ("ID_OBLAST") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIEK_UCINNA_LATKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LIEK_UCINNA_LATKA" ADD CONSTRAINT "RELATIONSHIP73" FOREIGN KEY ("ID_LIEK")
	  REFERENCES "SYSTEM"."LIEK" ("ID_LIEK") ENABLE;
  ALTER TABLE "SYSTEM"."LIEK_UCINNA_LATKA" ADD CONSTRAINT "RELATIONSHIP74" FOREIGN KEY ("ID_LATKA")
	  REFERENCES "SYSTEM"."UCINNA_LATKA" ("ID_LATKA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MESTO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MESTO" ADD CONSTRAINT "RELATIONSHIP70" FOREIGN KEY ("ID_OKRES")
	  REFERENCES "SYSTEM"."OKRES" ("ID_OKRES") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NEMOCNICA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."NEMOCNICA" ADD CONSTRAINT "RELATIONSHIP101" FOREIGN KEY ("ID_MESTO")
	  REFERENCES "SYSTEM"."MESTO" ("ID_MESTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ODDELENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ODDELENIE" ADD CONSTRAINT "RELATIONSHIP49" FOREIGN KEY ("ID_NEM")
	  REFERENCES "SYSTEM"."NEMOCNICA" ("ID_NEM") ENABLE;
  ALTER TABLE "SYSTEM"."ODDELENIE" ADD CONSTRAINT "RELATIONSHIP61" FOREIGN KEY ("ID_PRIMAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PACIENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PACIENT" ADD CONSTRAINT "RELATIONSHIP10" FOREIGN KEY ("ID_POUZIVATEL")
	  REFERENCES "SYSTEM"."Users" ("Id") ENABLE;
  ALTER TABLE "SYSTEM"."PACIENT" ADD CONSTRAINT "RELATIONSHIP33" FOREIGN KEY ("ID_VSEOBECNY_LEKAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PREDP_LIECBA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PREDP_LIECBA" ADD CONSTRAINT "RELATIONSHIP6" FOREIGN KEY ("ID_LIEK")
	  REFERENCES "SYSTEM"."LIEK" ("ID_LIEK") ENABLE;
  ALTER TABLE "SYSTEM"."PREDP_LIECBA" ADD CONSTRAINT "RELATIONSHIP39" FOREIGN KEY ("ID_VYSETRENIE")
	  REFERENCES "SYSTEM"."VYK_VYSETRENIA" ("ID_VYSETRENIE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRIZNAKY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PRIZNAKY" ADD CONSTRAINT "RELATIONSHIP68" FOREIGN KEY ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA")
	  REFERENCES "SYSTEM"."ZAP_CHOROBY" ("CIS_CHOROBA", "OD", "ID_ZDRAVOTNA_KARTA") ENABLE;
  ALTER TABLE "SYSTEM"."PRIZNAKY" ADD CONSTRAINT "RELATIONSHIP69" FOREIGN KEY ("ID_SYMPTOM")
	  REFERENCES "SYSTEM"."TYP_SYMPTOM" ("ID_SYMPTOM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECEPT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."RECEPT" ADD CONSTRAINT "RELATIONSHIP35" FOREIGN KEY ("ID_VYSETRENIE")
	  REFERENCES "SYSTEM"."VYK_VYSETRENIA" ("ID_VYSETRENIE") ENABLE;
  ALTER TABLE "SYSTEM"."RECEPT" ADD CONSTRAINT "RELATIONSHIP41" FOREIGN KEY ("ID_LIEK")
	  REFERENCES "SYSTEM"."LIEK" ("ID_LIEK") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table UserRoles
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."UserRoles" ADD CONSTRAINT "FK_UserRoles_Roles_RoleId" FOREIGN KEY ("RoleId")
	  REFERENCES "SYSTEM"."Roles" ("Id") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."UserRoles" ADD CONSTRAINT "FK_UserRoles_Users_UserId" FOREIGN KEY ("UserId")
	  REFERENCES "SYSTEM"."Users" ("Id") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VYK_VYSETRENIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" ADD CONSTRAINT "RELATIONSHIP23" FOREIGN KEY ("ID_LEKAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
  ALTER TABLE "SYSTEM"."VYK_VYSETRENIA" ADD CONSTRAINT "RELATIONSHIP36" FOREIGN KEY ("ID_PACIENT")
	  REFERENCES "SYSTEM"."ZDRAVOTNA_KARTA" ("ID_PACIENT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZAP_CHOROBY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" ADD CONSTRAINT "RELATIONSHIP7" FOREIGN KEY ("ID_ZDRAVOTNA_KARTA")
	  REFERENCES "SYSTEM"."ZDRAVOTNA_KARTA" ("ID_PACIENT") ENABLE;
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" ADD CONSTRAINT "RELATIONSHIP8" FOREIGN KEY ("CIS_CHOROBA")
	  REFERENCES "SYSTEM"."CHOROBA" ("CIS_CHOROBA") ENABLE;
  ALTER TABLE "SYSTEM"."ZAP_CHOROBY" ADD CONSTRAINT "RELATIONSHIP32" FOREIGN KEY ("ID_VYSETRENIE")
	  REFERENCES "SYSTEM"."VYK_VYSETRENIA" ("ID_VYSETRENIE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZDRAV_KARTA_POVOLENIA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" ADD CONSTRAINT "RELATIONSHIP53" FOREIGN KEY ("ID_PACIENT")
	  REFERENCES "SYSTEM"."ZDRAVOTNA_KARTA" ("ID_PACIENT") ENABLE;
  ALTER TABLE "SYSTEM"."ZDRAV_KARTA_POVOLENIA" ADD CONSTRAINT "RELATIONSHIP54" FOREIGN KEY ("ID_LEKAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZDRAV_POISTENIE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" ADD CONSTRAINT "RELATIONSHIP64" FOREIGN KEY ("ID_POISTOVNA")
	  REFERENCES "SYSTEM"."POISTOVNA" ("ID_POISTOVNA") ENABLE;
  ALTER TABLE "SYSTEM"."ZDRAV_POISTENIE" ADD CONSTRAINT "RELATIONSHIP65" FOREIGN KEY ("ID_PACIENT")
	  REFERENCES "SYSTEM"."PACIENT" ("ID_PACIENT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZDRAVOTNA_KARTA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" ADD CONSTRAINT "RELATIONSHIP105" FOREIGN KEY ("ID_MESTO_NARODENIA")
	  REFERENCES "SYSTEM"."MESTO" ("ID_MESTO") ENABLE;
  ALTER TABLE "SYSTEM"."ZDRAVOTNA_KARTA" ADD CONSTRAINT "RELATIONSHIP42" FOREIGN KEY ("ID_PACIENT")
	  REFERENCES "SYSTEM"."PACIENT" ("ID_PACIENT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZIADANKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZIADANKA" ADD CONSTRAINT "RELATIONSHIP201" FOREIGN KEY ("ID_PACIENT")
	  REFERENCES "SYSTEM"."Users" ("Id") ENABLE;
  ALTER TABLE "SYSTEM"."ZIADANKA" ADD CONSTRAINT "RELATIONSHIP200" FOREIGN KEY ("ID_LEKAR")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ENABLE;
    exit;
