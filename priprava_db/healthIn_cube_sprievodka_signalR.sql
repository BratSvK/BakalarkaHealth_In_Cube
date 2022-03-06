---- sprievodky SignalR
select * from "Users";
select * from sprievodka;

delete from sprievodka s
where s."IdPacient" = 2 and s."IdLekar"=2;

commit;
select * from typ_lekara;
select * from bydlisko b
 where b.id_pouzivatel = 2;
 
 delete from bydlisko b 
 where b.id_bydliska = 80;
 
 commit;
 
 --------- zrusenie sprievodky
 
 
 select * from "Users";
select * from sprievodka s ;

select * from vystaveny_termin;

select * from vystaveny_termin v 
where v."IdLekar" = 2 and v."DayOfYear"=53;


desc vystaveny_termin;


SELECT column_name FROM all_cons_columns WHERE constraint_name = (
  SELECT constraint_name FROM user_constraints 
  WHERE UPPER(table_name) = UPPER('zdrav_karta_povolenia') AND CONSTRAINT_TYPE = 'P'
);


select * from sprievodka s 
join vystaveny_termin vys on(s."IdLekar" = vys."IdLekar" and to_number(to_char(s."TerminOd", 'DDD')) = vys."DayOfYear")
where s."IdLekar" = 3 and vys."DayOfYear" = 59;

--- kontrola po zruseni sprievodky

select * from vystaveny_termin v 
where v."IdPacient" = 1 and v."IdLekar" = 2 and v."DayOfYear" = 40;


select * from sprievodka s 
join vystaveny_termin vys on(s."IdLekar" = vys."IdLekar" and to_number(to_char(s."TerminOd", 'DDD')) = vys."DayOfYear")
where s."IdLekar" = 2 and vys."DayOfYear" = 40; 

select * from sprievodka s 
where s."IdLekar" = 2;

select * from vystaveny_termin vys
where vys."IdLekar" = 2 and vys."IdPacient" = 1;

desc zdrav_karta_povolenia;

select * from pacient;

select * from vystaveny_termin v 
order by v."Id" desc;

select * from zdrav_karta_povolenia z
order by z.od desc;

select * from sprievodka s 
order by s."TerminOd" desc;


select * from sprievodka s 
where s."IdLekar" = 2 and to_number(to_char(s."TerminOd", 'DDD')) = 70;

desc sprievodka;
desc zdrav_karta_povolenia;

commit;

create or replace trigger on_delete_sprievodka
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

commit;

 SELECT * FROM sprievodka s 
 JOIN vystaveny_termin vys ON(s.IdLekar = vys.IdLekar AND to_number(to_char(s.TerminOd, 'DDD')) = vys."DayOfYear")  
 WHERE s.IdLekar = 2 and  vys."DayOfYear" = 70;

delete from vystaveny_termin;

delete from zdrav_karta_povolenia;
delete from sprievodka;

commit;


