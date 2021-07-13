/*
Created: 28. 06. 2021
Modified: 12. 07. 2021
Model: Oracle 19c
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table pacient

CREATE TABLE pacient(
  id_pacient Integer NOT NULL,
  rod_cislo Char(11 ) NOT NULL,
  id_poistovna Integer NOT NULL,
  vseobec_lekar Integer NOT NULL,
  heslo Raw(16) NOT NULL
)
/

-- Create indexes for table pacient

CREATE INDEX IX_Relationship10 ON pacient (rod_cislo)
/

CREATE INDEX IX_Relationship31 ON pacient (id_poistovna)
/

CREATE INDEX IX_Relationship33 ON pacient (vseobec_lekar)
/

-- Add keys for table pacient

ALTER TABLE pacient ADD CONSTRAINT PK_pacient PRIMARY KEY (id_pacient)
/

-- Table lekar

CREATE TABLE lekar(
  id_lekar Integer NOT NULL,
  rod_cislo Char(11 ) NOT NULL,
  id_typ Integer NOT NULL,
  od Date NOT NULL,
  heslo Raw(16) NOT NULL,
  do Integer
)
/

-- Create indexes for table lekar

CREATE INDEX IX_Relationship16 ON lekar (rod_cislo)
/

CREATE INDEX IX_Relationship22 ON lekar (id_typ)
/

-- Add keys for table lekar

ALTER TABLE lekar ADD CONSTRAINT PK_lekar PRIMARY KEY (id_lekar)
/

-- Table liek

CREATE TABLE liek(
  id_liek Integer NOT NULL,
  nazov Varchar2(255 ) NOT NULL,
  pocet_ks Number(2,0) NOT NULL,
  ucin_latka Varchar2(15 ) NOT NULL,
  ucin_latka_gramaz Number(5,0) NOT NULL
)
/

-- Add keys for table liek

ALTER TABLE liek ADD CONSTRAINT PK_liek PRIMARY KEY (id_liek)
/

-- Table recept

CREATE TABLE recept(
  id_recept Integer NOT NULL,
  id_vysetrenie Integer NOT NULL,
  id_liek Integer NOT NULL,
  balenie_ks Number(2,0) NOT NULL,
  vystavenie Date NOT NULL,
  cena Number(5,4) NOT NULL,
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
  id_karta Integer NOT NULL,
  id_pacient Integer NOT NULL,
  miesto_narodenia Char(5 ) NOT NULL,
  krv_skupina Varchar2(3 ) NOT NULL
        CHECK (krv_skupina in {'A+','B+','AB+','0+','A-','B-','AB-','0-'}),
  skrin_kod Char(7 ) NOT NULL
)
/

-- Create indexes for table zdravotna_karta

CREATE INDEX IX_Relationship21 ON zdravotna_karta (miesto_narodenia)
/

CREATE INDEX IX_Relationship42 ON zdravotna_karta (id_pacient)
/

-- Add keys for table zdravotna_karta

ALTER TABLE zdravotna_karta ADD CONSTRAINT PK_zdravotna_karta PRIMARY KEY (id_karta)
/

-- Table os_udaje

CREATE TABLE os_udaje(
  rod_cislo Char(11 ) NOT NULL,
  meno Varchar2(15 ) NOT NULL,
  priezvisko Varchar2(15 ) NOT NULL,
  email Varchar2(255 ) NOT NULL,
  mobil Varchar2(12 )
)
/

-- Add keys for table os_udaje

ALTER TABLE os_udaje ADD CONSTRAINT PK_os_udaje PRIMARY KEY (rod_cislo)
/

-- Table vyk_vysetrenia

CREATE TABLE vyk_vysetrenia(
  id_vysetrenie Integer NOT NULL,
  id_lekar Integer NOT NULL,
  id_karta Integer NOT NULL,
  datum_vys Date NOT NULL,
  vysledok Varchar2(150 ) NOT NULL,
  priloha Blob
)
/

-- Create indexes for table vyk_vysetrenia

CREATE INDEX IX_Relationship23 ON vyk_vysetrenia (id_lekar)
/

CREATE INDEX IX_Relationship36 ON vyk_vysetrenia (id_karta)
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
        CHECK (obm_pohlavie in {'Z','M','D'})
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
  rod_cislo Char(11 ) NOT NULL,
  psc Char(5 ) NOT NULL,
  ulica Varchar2(30 ) NOT NULL,
  adresa_od Date NOT NULL,
  adresa_do Date
)
/

-- Create indexes for table bydlisko

CREATE INDEX IX_Relationship29 ON bydlisko (rod_cislo)
/

CREATE INDEX IX_Relationship30 ON bydlisko (psc)
/

-- Add keys for table bydlisko

ALTER TABLE bydlisko ADD CONSTRAINT PK_bydlisko PRIMARY KEY (id_bydliska)
/

-- Table mesto

CREATE TABLE mesto(
  psc Char(5 ) NOT NULL,
  nazov Varchar2(30 ) NOT NULL
)
/

-- Add keys for table mesto

ALTER TABLE mesto ADD CONSTRAINT PK_mesto PRIMARY KEY (psc)
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
  id_karta Integer NOT NULL,
  cis_choroba Char(4 ) NOT NULL,
  od Date NOT NULL,
  id_vysetrenie Integer NOT NULL,
  sympton Varchar2(255 ) NOT NULL,
  do Date
)
/

-- Create indexes for table zap_choroby

CREATE INDEX IX_Relationship32 ON zap_choroby (id_vysetrenie)
/

-- Add keys for table zap_choroby

ALTER TABLE zap_choroby ADD CONSTRAINT PK_zap_choroby PRIMARY KEY (id_karta,cis_choroba,od)
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

-- Table poistovna

CREATE TABLE poistovna(
  id_poistovna Integer NOT NULL,
  nazov Varchar2(30 ) NOT NULL,
  kontakt_mobil Varchar2(12 ) NOT NULL
)
/

-- Add keys for table poistovna

ALTER TABLE poistovna ADD CONSTRAINT PK_poistovna PRIMARY KEY (id_poistovna)
/




-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE predp_liecba ADD CONSTRAINT Relationship6 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship7 FOREIGN KEY (id_karta) REFERENCES zdravotna_karta (id_karta)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship8 FOREIGN KEY (cis_choroba) REFERENCES choroba (cis_choroba)
/



ALTER TABLE pacient ADD CONSTRAINT Relationship10 FOREIGN KEY (rod_cislo) REFERENCES os_udaje (rod_cislo)
/



ALTER TABLE lekar ADD CONSTRAINT Relationship16 FOREIGN KEY (rod_cislo) REFERENCES os_udaje (rod_cislo)
/



ALTER TABLE zdravotna_karta ADD CONSTRAINT Relationship21 FOREIGN KEY (miesto_narodenia) REFERENCES mesto (psc)
/



ALTER TABLE lekar ADD CONSTRAINT Relationship22 FOREIGN KEY (id_typ) REFERENCES typ_lekara (id_typ)
/



ALTER TABLE vyk_vysetrenia ADD CONSTRAINT Relationship23 FOREIGN KEY (id_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE bydlisko ADD CONSTRAINT Relationship29 FOREIGN KEY (rod_cislo) REFERENCES os_udaje (rod_cislo)
/



ALTER TABLE bydlisko ADD CONSTRAINT Relationship30 FOREIGN KEY (psc) REFERENCES mesto (psc)
/



ALTER TABLE pacient ADD CONSTRAINT Relationship31 FOREIGN KEY (id_poistovna) REFERENCES poistovna (id_poistovna)
/



ALTER TABLE zap_choroby ADD CONSTRAINT Relationship32 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE pacient ADD CONSTRAINT Relationship33 FOREIGN KEY (vseobec_lekar) REFERENCES lekar (id_lekar)
/



ALTER TABLE recept ADD CONSTRAINT Relationship35 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE vyk_vysetrenia ADD CONSTRAINT Relationship36 FOREIGN KEY (id_karta) REFERENCES zdravotna_karta (id_karta)
/



ALTER TABLE predp_liecba ADD CONSTRAINT Relationship39 FOREIGN KEY (id_vysetrenie) REFERENCES vyk_vysetrenia (id_vysetrenie)
/



ALTER TABLE recept ADD CONSTRAINT Relationship41 FOREIGN KEY (id_liek) REFERENCES liek (id_liek)
/



ALTER TABLE zdravotna_karta ADD CONSTRAINT Relationship42 FOREIGN KEY (id_pacient) REFERENCES pacient (id_pacient)
/




