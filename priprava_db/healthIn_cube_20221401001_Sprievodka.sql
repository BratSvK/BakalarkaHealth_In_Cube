select * from "Roles";
select * from "UserRoles";
select * from lekar;
desc zdravotna_karta;
desc "UserLogins";
--- pridanie zoznam dni 
select * from zoznam_den;
commit;
insert into "UserRoles" u
values(7,2);

insert into zoznam_den 
 values(0,'Nedela');
 
 insert into zoznam_den 
 values(1,'Pondelok');
 
 insert into zoznam_den 
 values(2,'Utorok');
 
 insert into zoznam_den 
 values(3,'Streda');
 
 insert into zoznam_den 
 values(4,'ätvrtok');
 
 insert into zoznam_den 
 values(5,'Piatok');
 
 insert into zoznam_den 
 values(6,'Sobota');
 -------------------------
 
 desc lekar;
 
 select * from prac_doba;
 
 select * from typ_lekara
 order by id_typ;
 
 desc sprievodka;
 
 select * from sprievodka;
 
 desc sprievodka;
 
 select * from vystaveny_termin;
 
desc sprievodka;

select * from sprievodka;
 
select to_number(to_char(to_date('2022-01-10','YYYY-MM-DD'),'WW')) from dual;

select GetWeekNumber(s."TerminOd") from sprievodka s;
commit;

insert into sprievodka
values(1,1,TO_DATE('2022-01-14 08:30:00', 'yyyy-mm-dd hh24:mi:ss'),66,TO_DATE('2022-01-14 09:00:00', 'yyyy-mm-dd hh24:mi:ss'));

create or replace function GETWEEKNUMBER(p_start_week_of date)
return integer
is 
dayOfWeek integer;
begin
select to_number(to_char(p_start_week_of,'WW')) into dayOfWeek from dual;
 return dayOfWeek;
end;
/
commit;

select sysdate from dual;

variable dayOfWeek number;
exec :dayOfWeek := GetWeekNumber('2022-01-10');
print dayOfWeek;


 select * from sprievodka;

 
 
 select * from pacient;
 
 select * from "Users";
 
 desc sprievodka;
 desc vystaveny_termin;
 select * from vystaveny_termin;
 
 desc prac_doba;
 
 select * from zoznam_den;
 
 delete from zoznam_den;
 
 desc "Users";
 
 select * from "Roles";
 
 select * from prac_doba;
 
 select * from nemocnica;
 
 select * from oddelenie;
 
 insert into oddelenie
 values(3,2,null,'OftalmolÛgia (oËnÈ)');
 
 select * from lekar;
 
 select * from atestacie_lekar;

 desc lekar;
 
 select * from mesto m
 where m.nazov like '%Kysu%';
 
 select * from bydlisko;
 ------------------ vytvorenie lekar---
select * from bydlisko;
select * from lekar; 
select * from "Users";
select * from prac_doba;
select * from atestacie_lekar;

select *from typ_lekara;

desc atestacie_lekar;
insert into atestacie_lekar
values(2, 44, 2, sysdate);


--zly register
select * from "UserRoles";
select * from "Roles";
select * from fotka_pouzivatel;

delete from "Users" u
where u."Id" = 7;

delete from "UserRoles" r
where r."UserId" = 7;

delete from bydlisko b
where b.id_bydliska = 28;
 
commit;
 
desc sprievodka;
desc zdrav_karta_povolenia;
desc vystaveny_termin;
-- ked sa vytvori sprievodka pridat do termin tabulky zaznam na cislenik 
create or replace trigger trig_zapis_termin
after insert on SPRIEVODKA
for each row
begin
    insert into vystaveny_termin("IdPacient", "IdLekar", "DayOfYear")
     values(:new."IdPacient", :new."IdLekar", to_number(TO_CHAR(:new."TerminOd", 'DDD')));
     
     insert into zdrav_karta_povolenia(Id_Lekar, Id_Pacient,OD,DO)
        values(:new."IdLekar", :new."IdPacient",:new."TerminOd", :new."TerminDo");
end;
/


desc vystaveny_termin;

SELECT to_number(TO_CHAR(SYSDATE, 'DD')) from DUAL;

select * from vystaveny_termin v
order by v."Id";

select * from sprievodka;

select * from vystaveny_termin;

select * from zdrav_karta_povolenia;

select * from typ_lekara;

delete from sprievodka;

delete from vystaveny_termin;

delete from zdrav_karta_povolenia;
commit;




delete from sprievodka;
commit;

drop sequence seqTermin_ID;

create sequence seqTermin_ID
increment by 1 start with 1;
commit;

 create or replace trigger tab_termin_seq_ins
 before insert on vystaveny_termin
 for each row
 begin 
 select seqTermin_ID.NEXTVAL into :new."Id"
  from dual;
 end;
/

-- get pacient by bid
----------------------
select p.id_pacient, u."Meno" from  "Users" u
join pacient p on (p.id_pouzivatel = u."Id")
where u."RodCislo" = '621124/7336';

select * from  "Users" u;

update "Users" u
set u."RodCislo" = '621124/7336'
where u."Id" = 4;

commit;

 SELECT "p"."ID_PACIENT" "IdPacient", "u"."Meno" "Name"
      FROM "PACIENT" "p"
      INNER JOIN "Users" "u" ON "p"."ID_POUZIVATEL" = "u"."Id"
      WHERE "u"."RodCislo" = '621124/7336'
      FETCH FIRST 2 ROWS ONLY;
 
 
select * from typ_lekara;
 
select * from atestacie_lekar;

desc nemocnica;
desc oddelenie;

select us."Meno" || ' ' || us."Priezvisko" as Meno, m.nazov as Mesto from lekar l 
join atestacie_lekar atest on (atest.id_lekar = l.id_lekar)
join "Users" us on (us."Id" = l.id_pouzivatel)
join oddelenie od on (od.id_oddel = l.id_oddel)
join nemocnica nem on (nem.id_nem = od.id_nem)
join mesto m on (m.id_mesto = nem.id_mesto)
where atest.id_typ = 44;


 SELECT "u"."Meno", "u"."Priezvisko", "l"."ID_LEKAR"
      FROM "LEKAR" "l"
      INNER JOIN "Users" "u" ON "l"."ID_POUZIVATEL" = "u"."Id";

select * from "Users";

update "Users" u
set u."Meno" = 'MUDr. Peter'
where u."Id" = 2;
      
commit;

------ zistiù poceù voæn˝ch termÌnov 


select * from prac_doba;

select * from zoznam_den;



 