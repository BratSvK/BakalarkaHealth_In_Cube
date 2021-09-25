/*
Created: 28. 6. 2021
Modified: 24. 9. 2021
Model: Oracle 19c
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table pacient

CREATE TABLE pacient(
  id_pacient Integer NOT NULL,
  id_pouzivatel Integer NOT NULL,
  id_vseobecny_lekar Integer NOT NULL,
  od Date NOT NULL,
  do Date
)
/

-- Create indexes for table pacient

CREATE INDEX IX_Relationship33 ON pacient (id_vseobecny_lekar)
/

CREATE INDEX IX_Relationship10 ON pacient (id_pouzivatel)
/

-- Add keys for table pacient

ALTER TABLE pacient ADD CONSTRAINT PK_pacient PRIMARY KEY (id_pacient)
/

-- Table lekar

CREATE TABLE lekar(
  id_lekar Integer NOT NULL,
  id_pouzivatel Integer NOT NULL,
  id_oddel Integer,
  do Date
)
/

-- Create indexes for table lekar

CREATE INDEX IX_Relationship16 ON lekar (id_pouzivatel)
/

CREATE INDEX IX_Relationship51 ON lekar (id_oddel)
/

-- Add keys for table lekar

ALTER TABLE lekar ADD CONSTRAINT PK_lekar PRIMARY KEY (id_lekar)
/

-- Table liek

CREATE TABLE liek(
  id_liek Integer NOT NULL,
  nazov Varchar2(255 ) NOT NULL,
  rezim_vydaja Char(2 ) NOT NULL
        CHECK (rezim_vydaja in {'F','R','Rx'}),
  liek_forma Varchar2(30 ) NOT NULL,
  id_oblast Integer NOT NULL
)
/

-- Create indexes for table liek

CREATE INDEX IX_Relationship71 ON liek (id_oblast)
/

-- Add keys for table liek

ALTER TABLE liek ADD CONSTRAINT PK_liek PRIMARY KEY (id_liek)
/

-- Table liek1

CREATE TABLE liek1(
  id_liek Integer NOT NULL,
  id_oblast Integer,
  nazov Varchar2(255 ) NOT NULL,
  rezim_vydaja Char(2 ) NOT NULL
        CHECK (rezim_vydaja in {'F','R','Rx'}),
  liek_forma Varchar2(30 ) NOT NULL
)
/

-- Create indexes for table liek1

CREATE INDEX IX_Relationship9 ON liek1 (id_oblast)
/

-- Add keys for table liek1

ALTER TABLE liek1 ADD CONSTRAINT PK_liek1 PRIMARY KEY (id_liek)
/

-- Table recept

CREATE TABLE recept(
  id_recept Integer NOT NULL,
  id_vysetrenie Integer NOT NULL,
  id_liek Integer NOT NULL,
  balenie_ks Number(2,0) NOT NULL,
  vystavenie Date NOT NULL,
  cena Number(10,2),
  vybranie Date
)
/

-- Create indexes for table recept

CREATE INDEX IX_Relationship35 ON recept (id_vysetrenie)
/

CREATE INDEX IX_Relationship41 ON recept (id_liek)
/

-- Add keys for table recept

ALTER TABLE recept ADD CONSTRAINT PK_recept PRIMARY KEY (id_recept)
/

-- Table zdravotna_karta

CREATE TABLE zdravotna_karta(
  id_pacient Integer NOT NULL,
  mesto_narodenia Char(5 ) NOT NULL,
  krv_skupina Varchar2(3 ) NOT NULL
        CHECK (krv_skupina in {'A+','B+','AB+','0+','A-','B-','AB-','0-'})
)
/

-- Create indexes for table zdravotna_karta

CREATE INDEX IX_Relationship42 ON zdravotna_karta ()
/

CREATE INDEX IX_Relationship66 ON zdravotna_karta (mesto_narodenia)
/

-- Add keys for table zdravotna_karta

ALTER TABLE zdravotna_karta ADD CONSTRAINT PK_zdravotna_karta PRIMARY KEY (id_pacient)
/

-- Table pouzivatel

CREATE TABLE pouzivatel(
  id_pouzivatel Integer NOT NULL,
  id_typ Integer NOT NULL,
  registrovany Date NOT NULL,
  meno Varchar2(15 ) NOT NULL,
  priezvisko Varchar2(15 ) NOT NULL,
  rod_priezvisko Varchar2(15 ),
  rod_cislo Char(11 ),
  dat_narodenia Date,
  email Varchar2(255 ) NOT NULL,
  mobil Varchar2(12 ),
  posledne_prihlasenie Date,
  pohlavie Char(1 )
)
/

-- Create indexes for table pouzivatel

CREATE INDEX IX_Relationship52 ON pouzivatel (id_typ)
/

-- Add keys for table pouzivatel

ALTER TABLE pouzivatel ADD CONSTRAINT PK_pouzivatel PRIMARY KEY (id_pouzivatel)
/

-- Table and Columns comments section

COMMENT ON COLUMN pouzivatel.pohlavie IS 'M-muz
Z-zena'
/

-- Table vyk_vysetrenia

CREATE TABLE vyk_vysetrenia(
  id_vysetrenie Integer NOT NULL,
  id_pacient Integer,
  id_lekar Integer,
  datum_vys Date NOT NULL,
  vysledok Varchar2(150 ) NOT NULL,
  priloha Blob
)
/

-- Create indexes for table vyk_vysetrenia

CREATE INDEX IX_Relationship23 ON vyk_vysetrenia (id_lekar)
/

CREATE INDEX IX_Relationship36 ON vyk_vysetrenia (id_pacient)
/

-- Add keys for table vyk_vysetrenia

ALTER TABLE vyk_vysetrenia ADD CONSTRAINT PK_vyk_vysetrenia PRIMARY KEY (id_vysetrenie)
/

-- Table choroba

CREATE TABLE choroba(
  cis_choroba Char(4 ) NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  sk_ochoreni Char(20 ),
  obm_vek_od Number(2,0),
  obm_vek_do Number(2,0),
  obm_pohlavie Char(1 )
        CHECK (obm_pohlavie in {'Z','M','D','V','A'}),
  valid_od Date NOT NULL,
  valid_do Date,
  dopl_info_patri Varchar2(100 ),
  dopl_info_nepatri Varchar2(100 )
)
/

-- Add keys for table choroba

ALTER TABLE choroba ADD CONSTRAINT PK_choroba PRIMARY KEY (cis_choroba)
/

-- Table and Columns comments section

COMMENT ON COLUMN choroba.cis_choroba IS 'A00-B99
Infekčné a parazitové choroby
A00- Cholera '
/

-- Table bydlisko

CREATE TABLE bydlisko(
  id_bydliska Integer NOT NULL,
  id_pouzivatel Integer,
  psc Char(5 ) NOT NULL,
  ulica Varchar2(100 ) NOT NULL,
  adresa_od Date NOT NULL,
  adresa_do Date,
  trvale Char(1 ) NOT NULL
)
/

-- Create indexes for table bydlisko

CREATE INDEX IX_Relationship29 ON bydlisko (id_pouzivatel)
/

CREATE INDEX IX_Relationship58 ON bydlisko (psc)
/

-- Add keys for table bydlisko

ALTER TABLE bydlisko ADD CONSTRAINT PK_bydlisko PRIMARY KEY (id_bydliska)
/

-- Table and Columns comments section

COMMENT ON COLUMN bydlisko.trvale IS 'T-true 
F-false'
/

-- Table predp_liecba

CREATE TABLE predp_liecba(
  id_liek Integer NOT NULL,
  id_vysetrenie Integer NOT NULL,
  od Date NOT NULL,
  davkovanie_pocet Number(3,0) NOT NULL,
  do Date
)
/

-- Add keys for table predp_liecba

ALTER TABLE predp_liecba ADD CONSTRAINT PK_predp_liecba PRIMARY KEY (id_liek,od,id_vysetrenie)
/

-- Table and Columns comments section

COMMENT ON COLUMN predp_liecba.davkovanie_pocet IS '101
rano,poobede,vecer '
/

-- Table zap_choroby

CREATE TABLE zap_choroby(
  id_zdravotna_karta Integer NOT NULL,
  cis_choroba Char(4 ) NOT NULL,
  od Date NOT NULL,
  id_vysetrenie Integer NOT NULL,
  do Date
)
/

-- Create indexes for table zap_choroby

CREATE INDEX IX_Relationship32 ON zap_choroby (id_vysetrenie)
/

-- Add keys for table zap_choroby

ALTER TABLE zap_choroby ADD CONSTRAINT PK_zap_choroby PRIMARY KEY (cis_choroba,od,id_zdravotna_karta)
/

-- Table typ_lekara

CREATE TABLE typ_lekara(
  id_typ Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  popis Varchar2(255 )
)
/

-- Add keys for table typ_lekara

ALTER TABLE typ_lekara ADD CONSTRAINT PK_typ_lekara PRIMARY KEY (id_typ)
/

-- Table atestacie_lekar

CREATE TABLE atestacie_lekar(
  id_lekar Integer NOT NULL,
  id_typ Integer NOT NULL,
  id_atestacia Integer NOT NULL,
  atestacia_od Date NOT NULL
)
/

-- Add keys for table atestacie_lekar

ALTER TABLE atestacie_lekar ADD CONSTRAINT PK_atestacie_lekar PRIMARY KEY (id_atestacia,id_lekar,id_typ)
/

-- Table poistovna

CREATE TABLE poistovna(
  id_poistovna Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  kontakt_mobil Varchar2(12 ) NOT NULL,
  logo_url Varchar2(30 ) NOT NULL,
  odkaz_url Varchar2(50 )
)
/

-- Add keys for table poistovna

ALTER TABLE poistovna ADD CONSTRAINT PK_poistovna PRIMARY KEY (id_poistovna)
/

-- Table zdrav_karta_povolenia

CREATE TABLE zdrav_karta_povolenia(
  id_lekar Integer NOT NULL,
  id_pacient Integer NOT NULL,
  od Date NOT NULL,
  do Date
)
/

-- Add keys for table zdrav_karta_povolenia

ALTER TABLE zdrav_karta_povolenia ADD CONSTRAINT PK_zdrav_karta_povolenia PRIMARY KEY (od,id_lekar,id_pacient)
/

-- Table and Columns comments section

COMMENT ON COLUMN zdrav_karta_povolenia.do IS 'Vseobecny lekar -> pacientov lekar -> neobmedzeny pristup ku karte 
ostatni sa musi nastavit -> podla vybrania uzivatela '
/

-- Table zdrav_poistenie

CREATE TABLE zdrav_poistenie(
  id_poistovna Integer NOT NULL,
  id_pacient Integer NOT NULL,
  od Date NOT NULL,
  do Date
)
/

-- Add keys for table zdrav_poistenie

ALTER TABLE zdrav_poistenie ADD CONSTRAINT PK_zdrav_poistenie PRIMARY KEY (id_poistovna,id_pacient,od)
/

-- Table l_balenie

CREATE TABLE l_balenie(
  kod_balenia Char(5 ) NOT NULL,
  id_liek Integer,
  sposob_uhrady Char(1 ) NOT NULL
        CHECK (sposob_uhrady in {'I','S','A'}
),
  cena Number(10,2) NOT NULL,
  doplatok Number(10,2) NOT NULL,
  pocet_ks Number(3,0) NOT NULL
)
/

-- Create indexes for table l_balenie

CREATE INDEX IX_Relationship43 ON l_balenie ()
/

CREATE INDEX IX_Relationship72 ON l_balenie (id_liek)
/

-- Add keys for table l_balenie

ALTER TABLE l_balenie ADD CONSTRAINT PK_l_balenie PRIMARY KEY (kod_balenia)
/

-- Table and Columns comments section

COMMENT ON COLUMN l_balenie.kod_balenia IS '00643'
/

-- Table Rola

CREATE TABLE Rola(
  id_typ Integer NOT NULL,
  nazov Char(20 ) NOT NULL
)
/

-- Add keys for table Rola

ALTER TABLE Rola ADD CONSTRAINT PK_Rola PRIMARY KEY (id_typ)
/

-- Table and Columns comments section

COMMENT ON COLUMN Rola.id_typ IS '0-spravca celeho systemu
1-spravca nemocnice
2-lekar
3-pacient'
/

-- Table nemocnica

CREATE TABLE nemocnica(
  id_nem Integer NOT NULL,
  psc Char(5 ) NOT NULL,
  nazov Varchar2(150 ) NOT NULL,
  mobil Varchar2(12 ) NOT NULL,
  ulica Varchar2(30 ) DEFAULT 100 NOT NULL,
  url_stranka Varchar2(300 )
)
/

-- Create indexes for table nemocnica

CREATE INDEX IX_Relationship59 ON nemocnica (psc)
/

-- Add keys for table nemocnica

ALTER TABLE nemocnica ADD CONSTRAINT PK_nemocnica PRIMARY KEY (id_nem)
/

-- Table oddelenie

CREATE TABLE oddelenie(
  id_oddel Integer NOT NULL,
  id_nem Integer NOT NULL,
  id_primar Integer,
  nazov_odd Varchar2(200 ) NOT NULL
)
/

-- Create indexes for table oddelenie

CREATE INDEX IX_Relationship49 ON oddelenie (id_nem)
/

CREATE INDEX IX_Relationship61 ON oddelenie (id_primar)
/

-- Add keys for table oddelenie

ALTER TABLE oddelenie ADD CONSTRAINT PK_oddelenie PRIMARY KEY (id_oddel)
/

-- Table fotka_pouzivatel

CREATE TABLE fotka_pouzivatel(
  id_pouzivatel Integer NOT NULL,
  fotka Blob NOT NULL
)
/

-- Add keys for table fotka_pouzivatel

ALTER TABLE fotka_pouzivatel ADD CONSTRAINT PK_fotka_pouzivatel PRIMARY KEY (id_pouzivatel)
/

-- Table mesto

CREATE TABLE mesto(
  psc Char(5 ) NOT NULL,
  id_kraj Integer NOT NULL,
  nazov Varchar2(150 ) NOT NULL
)
/

-- Create indexes for table mesto

CREATE INDEX IX_Relationship70 ON mesto (id_kraj)
/

-- Add keys for table mesto

ALTER TABLE mesto ADD CONSTRAINT PK_mesto PRIMARY KEY (psc)
/

-- Table typ_symptom

CREATE TABLE typ_symptom(
  id_symptom Integer NOT NULL,
  nazov Varchar2(100 ) NOT NULL
)
/

-- Add keys for table typ_symptom

ALTER TABLE typ_symptom ADD CONSTRAINT PK_typ_symptom PRIMARY KEY (id_symptom)
/

-- Table priznaky

CREATE TABLE priznaky(
  cis_choroba Char(4 ) NOT NULL,
  id_zdravotna_karta Integer NOT NULL,
  id_symptom Integer NOT NULL,
  od Date NOT NULL
)
/

-- Add keys for table priznaky

ALTER TABLE priznaky ADD CONSTRAINT PK_priznaky PRIMARY KEY (cis_choroba,od,id_zdravotna_karta,id_symptom)
/

-- Table kraj

CREATE TABLE kraj(
  id_kraj Integer NOT NULL,
  nazov Varchar2(25 ) NOT NULL
)
/

-- Add keys for table kraj

ALTER TABLE kraj ADD CONSTRAINT PK_kraj PRIMARY KEY (id_kraj)
/

-- Table okres

CREATE TABLE okres(
  id_kraj1 Integer NOT NULL,
  id_kraj Integer NOT NULL,
  nazov Varchar2(150 ) NOT NULL
)
/

-- Create indexes for table okres

CREATE INDEX IX_Relationship1 ON okres (id_kraj)
/

-- Add keys for table okres

ALTER TABLE okres ADD CONSTRAINT PK_okres PRIMARY KEY (id_kraj1)
/

-- Table oblast_urcenia

CREATE TABLE oblast_urcenia(
  id_oblast Integer NOT NULL,
  nazov Varchar2(100 ) NOT NULL
)
/

-- Add keys for table oblast_urcenia

ALTER TABLE oblast_urcenia ADD CONSTRAINT PK_oblast_urcenia PRIMARY KEY (id_oblast)
/

-- Table ucinna_latka

CREATE TABLE ucinna_latka(
  id_latka Integer NOT NULL,
  id_liek Integer,
  ucinna_latka Varchar2(30 ) NOT NULL,
  ucinna_latka_gramaz Number(6,0)
)
/

-- Create indexes for table ucinna_latka

CREATE INDEX IX_Relationship72 ON ucinna_latka (id_liek)
/

-- Add keys for table ucinna_latka

ALTER TABLE ucinna_latka ADD CONSTRAINT PK_ucinna_latka PRIMARY KEY (id_latka)
/

-- Table and Columns comments section

COMMENT ON COLUMN ucinna_latka.ucinna_latka_gramaz IS 'vsetko bude v mg'
/

-- Table liek_ucinna_latka

CREATE TABLE liek_ucinna_latka(
  id_liek Integer NOT NULL,
  id_latka Integer NOT NULL
)
/

-- Add keys for table liek_ucinna_latka

ALTER TABLE liek_ucinna_latka ADD CONSTRAINT PK_liek_ucinna_latka PRIMARY KEY (id_liek,id_latka)
/

-- Table liek_ucinna_latka

CREATE TABLE liek_ucinna_latka(
  id_liek Integer NOT NULL,
  id_latka Integer NOT NULL
)
/

-- Add keys for table liek_ucinna_latka

ALTER TABLE liek_ucinna_latka ADD CONSTRAINT PK_liek_ucinna_latka PRIMARY KEY (id_liek,id_latka)
/

-- Table liek_aplikacia

CREATE TABLE liek_aplikacia(
  id_liek Integer NOT NULL,
  id_oblast Integer NOT NULL
)
/

-- Add keys for table liek_aplikacia

ALTER TABLE liek_aplikacia ADD CONSTRAINT PK_liek_aplikacia PRIMARY KEY (id_liek,id_oblast)
/




-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE predp_liecba ADD CONSTRAINT Relationship6 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship7 FOREIGN KEY (id_zdravotna_karta) REFERENCES zdravotna_karta (id_pacient)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship8 FOREIGN KEY (cis_choroba) REFERENCES choroba (cis_choroba)
/



ALTER TABLE pacient ADD CONSTRAINT Relationship10 FOREIGN KEY (id_pouzivatel) REFERENCES pouzivatel (id_pouzivatel)
/



ALTER TABLE lekar ADD CONSTRAINT Relationship16 FOREIGN KEY (id_pouzivatel) REFERENCES pouzivatel (id_pouzivatel)
/



ALTER TABLE vyk_vysetrenia ADD CONSTRAINT Relationship23 FOREIGN KEY (id_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE bydlisko ADD CONSTRAINT Relationship29 FOREIGN KEY (id_pouzivatel) REFERENCES pouzivatel (id_pouzivatel)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship32 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE pacient ADD CONSTRAINT Relationship33 FOREIGN KEY (id_vseobecny_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE recept ADD CONSTRAINT Relationship35 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE vyk_vysetrenia ADD CONSTRAINT Relationship36 FOREIGN KEY (id_pacient) REFERENCES zdravotna_karta (id_pacient)
/



ALTER TABLE predp_liecba ADD CONSTRAINT Relationship39 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE recept ADD CONSTRAINT Relationship41 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE zdravotna_karta ADD CONSTRAINT Relationship42 FOREIGN KEY (id_pacient) REFERENCES pacient (id_pacient)
/



ALTER TABLE oddelenie ADD CONSTRAINT Relationship49 FOREIGN KEY (id_nem) REFERENCES nemocnica (id_nem)
/



ALTER TABLE lekar ADD CONSTRAINT Relationship51 FOREIGN KEY (id_oddel) REFERENCES oddelenie (id_oddel)
/



ALTER TABLE pouzivatel ADD CONSTRAINT Relationship52 FOREIGN KEY (id_typ) REFERENCES Rola (id_typ)
/



ALTER TABLE zdrav_karta_povolenia ADD CONSTRAINT Relationship53 FOREIGN KEY (id_pacient) REFERENCES zdravotna_karta (id_pacient)
/



ALTER TABLE zdrav_karta_povolenia ADD CONSTRAINT Relationship54 FOREIGN KEY (id_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE fotka_pouzivatel ADD CONSTRAINT Relationship55 FOREIGN KEY (id_pouzivatel) REFERENCES pouzivatel (id_pouzivatel)
/



ALTER TABLE bydlisko ADD CONSTRAINT Relationship58 FOREIGN KEY (psc) REFERENCES mesto (psc)
/



ALTER TABLE nemocnica ADD CONSTRAINT Relationship59 FOREIGN KEY (psc) REFERENCES mesto (psc)
/



ALTER TABLE oddelenie ADD CONSTRAINT Relationship61 FOREIGN KEY (id_primar) REFERENCES lekar (id_lekar)
/



ALTER TABLE atestacie_lekar ADD CONSTRAINT Relationship62 FOREIGN KEY (id_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE atestacie_lekar ADD CONSTRAINT Relationship63 FOREIGN KEY (id_typ) REFERENCES typ_lekara (id_typ)
/



ALTER TABLE zdrav_poistenie ADD CONSTRAINT Relationship64 FOREIGN KEY (id_poistovna) REFERENCES poistovna (id_poistovna)
/



ALTER TABLE zdrav_poistenie ADD CONSTRAINT Relationship65 FOREIGN KEY (id_pacient) REFERENCES pacient (id_pacient)
/



ALTER TABLE zdravotna_karta ADD CONSTRAINT Relationship66 FOREIGN KEY (mesto_narodenia) REFERENCES mesto (psc)
/



ALTER TABLE priznaky ADD CONSTRAINT Relationship68 FOREIGN KEY (cis_choroba, od, id_zdravotna_karta) REFERENCES zap_choroby (cis_choroba, od, id_zdravotna_karta)
/



ALTER TABLE priznaky ADD CONSTRAINT Relationship69 FOREIGN KEY (id_symptom) REFERENCES typ_symptom (id_symptom)
/



ALTER TABLE okres ADD CONSTRAINT  FOREIGN KEY (id_kraj) REFERENCES kraj (id_kraj)
/



ALTER TABLE mesto ADD CONSTRAINT Relationship70 FOREIGN KEY (id_kraj) REFERENCES okres (id_kraj1)
/



ALTER TABLE liek1 ADD CONSTRAINT 1 FOREIGN KEY (id_oblast) REFERENCES oblast_urcenia (id_oblast)
/



ALTER TABLE liek_ucinna_latka ADD CONSTRAINT 3 FOREIGN KEY (id_latka) REFERENCES ucinna_latka (id_latka)
/



ALTER TABLE liek_ucinna_latka ADD CONSTRAINT ab FOREIGN KEY (id_liek) REFERENCES liek1 (id_liek)
/



ALTER TABLE liek ADD CONSTRAINT Relationship71 FOREIGN KEY (id_oblast) REFERENCES oblast_urcenia (id_oblast)
/



ALTER TABLE l_balenie ADD CONSTRAINT Relationship72 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE liek_ucinna_latka ADD CONSTRAINT Relationship73 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE liek_ucinna_latka ADD CONSTRAINT Relationship74 FOREIGN KEY (id_latka) REFERENCES ucinna_latka (id_latka)
/



ALTER TABLE liek_aplikacia ADD CONSTRAINT Relationship75 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE liek_aplikacia ADD CONSTRAINT Relationship76 FOREIGN KEY (id_oblast) REFERENCES oblast_urcenia (id_oblast)
/




