select * from "Roles";
select * from "UserRoles";
select * from lekar;
desc zdravotna_karta;
desc "UserLogins";
--- pridanie zoznam dni 
select * from zoznam_den;

insert into zoznam_den 
 values(0,'Nedela');
 
 insert into zoznam_den 
 values(1,'Pondelok');
 
 insert into zoznam_den 
 values(2,'Utorok');
 
 insert into zoznam_den 
 values(3,'Streda');
 
 insert into zoznam_den 
 values(4,'Štvrtok');
 
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
 values(3,2,null,'Oftalmológia (oèné)');
 
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
 
-- ked sa vytvori sprievodka pridat do termin tabulky zaznam na cislenik 
create or replace trigger trig_zapis_termin
after insert on SPRIEVODKA
for each row
begin
    insert into vystaveny_termin("IdPacient", "IdLekar", "DayOfYear")
     values(:new."IdPacient", :new."IdLekar", to_number(TO_CHAR(:new."TerminOd", 'DDD')));
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





 
 
 
 