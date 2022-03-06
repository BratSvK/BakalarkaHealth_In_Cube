--------------------------------------------------------
--  File created - Štvrtok-marca-03-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SPRIEVODKA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SPRIEVODKA" 
   (	"IdPacient" NUMBER(38,0), 
	"IdLekar" NUMBER(38,0), 
	"TerminOd" DATE, 
	"IdTypVysetrenia" NUMBER(10,0), 
	"TerminDo" DATE, 
	"IsDeactivated" NUMBER(1,0) DEFAULT 0, 
	"ZrusenieDovod" NVARCHAR2(2000)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.SPRIEVODKA
SET DEFINE OFF;
Insert into SYSTEM.SPRIEVODKA ("IdPacient","IdLekar","TerminOd","IdTypVysetrenia","TerminDo","IsDeactivated","ZrusenieDovod") values ('1','2',to_date('11-MAR-22 07:00:00','DD-MON-RR HH24:MI:SS'),'44',to_date('11-MAR-22 07:30:00','DD-MON-RR HH24:MI:SS'),'0',null);
Insert into SYSTEM.SPRIEVODKA ("IdPacient","IdLekar","TerminOd","IdTypVysetrenia","TerminDo","IsDeactivated","ZrusenieDovod") values ('2','2',to_date('11-MAR-22 07:30:00','DD-MON-RR HH24:MI:SS'),'44',to_date('11-MAR-22 08:00:00','DD-MON-RR HH24:MI:SS'),'0',null);
--------------------------------------------------------
--  DDL for Index PK_SPRIEVODKA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PK_SPRIEVODKA" ON "SYSTEM"."SPRIEVODKA" ("IdLekar", "IdPacient", "TerminOd") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_SPRIEVODKA_IdPacient
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_SPRIEVODKA_IdPacient" ON "SYSTEM"."SPRIEVODKA" ("IdPacient") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_SPRIEVODKA_IdLekar
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_SPRIEVODKA_IdLekar" ON "SYSTEM"."SPRIEVODKA" ("IdLekar") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index IX_SPRIEVODKA_IdTypVysetrenia
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."IX_SPRIEVODKA_IdTypVysetrenia" ON "SYSTEM"."SPRIEVODKA" ("IdTypVysetrenia") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger TRIG_ZAPIS_TERMIN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."TRIG_ZAPIS_TERMIN" 
after insert on SPRIEVODKA
for each row
begin
    insert into vystaveny_termin("IdPacient", "IdLekar", "DayOfYear")
     values(:new."IdPacient", :new."IdLekar", to_number(TO_CHAR(:new."TerminOd", 'DDD')));

     insert into zdrav_karta_povolenia(Id_Lekar, Id_Pacient,OD,DO)
        values(:new."IdLekar", :new."IdPacient",:new."TerminOd", :new."TerminDo");
end;

/
ALTER TRIGGER "SYSTEM"."TRIG_ZAPIS_TERMIN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ON_DELETE_SPRIEVODKA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."ON_DELETE_SPRIEVODKA" 
before delete on sprievodka
for each row
begin

delete from vystaveny_termin vys
 where vys."IdLekar" = :old."IdLekar" and 
       vys."IdPacient" = :old."IdPacient" and
       vys."DayOfYear" = to_number(to_char(:old."TerminOd", 'DDD'));

delete from zdrav_karta_povolenia zd
where zd.id_lekar = :old."IdLekar" and 
       zd.id_pacient = :old."IdPacient" and
       zd.od = :old."TerminOd";
end;

/
ALTER TRIGGER "SYSTEM"."ON_DELETE_SPRIEVODKA" ENABLE;
--------------------------------------------------------
--  Constraints for Table SPRIEVODKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("IdPacient" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("IdLekar" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("TerminOd" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("IdTypVysetrenia" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("TerminDo" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SPRIEVODKA" ADD CONSTRAINT "PK_SPRIEVODKA" PRIMARY KEY ("IdLekar", "IdPacient", "TerminOd")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."SPRIEVODKA" MODIFY ("IsDeactivated" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SPRIEVODKA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SPRIEVODKA" ADD CONSTRAINT "FK_SPRIEVODKA_LEKAR_IdLekar" FOREIGN KEY ("IdLekar")
	  REFERENCES "SYSTEM"."LEKAR" ("ID_LEKAR") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."SPRIEVODKA" ADD CONSTRAINT "FK_SPRIEVODKA_PACIENT_IdPacient" FOREIGN KEY ("IdPacient")
	  REFERENCES "SYSTEM"."PACIENT" ("ID_PACIENT") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."SPRIEVODKA" ADD CONSTRAINT "FK_SPRIEVODKA_TYP_LEKARA_IdTypVysetrenia" FOREIGN KEY ("IdTypVysetrenia")
	  REFERENCES "SYSTEM"."TYP_LEKARA" ("ID_TYP") ON DELETE CASCADE ENABLE;
