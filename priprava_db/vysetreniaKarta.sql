--vysetrenia 

drop sequence vysetrenie_seq;
CREATE sequence vysetrenie_seq 
 START WITH 1 increment by 1;


create or replace TRIGGER vysetrenie_auto_id
BEFORE INSERT ON vyk_vysetrenia
FOR EACH ROW
BEGIN
    select vysetrenie_seq.nextval into :new.ID_VYSETRENIE from dual;  
END;
/
commit;
desc typ_lekara;
select * from typ_lekara;

select * from zdravotna_karta;
desc vyk_vysetrenia;
-- 1, vykona sa vysetrenie a zapise 
select * from vyk_vysetrenia;

select * from vyk_vysetrenia vyk
order by vyk.datum_vys desc;

-- 2.podla vysetrenia sa zapise choroba a urcia priznaky
desc zap_choroby;
select * from zap_choroby;
desc priznaky;
select * from priznaky;

-- 3. podla zap choroby sa predpise liecka a recept
desc predp_liecba;
select * from predp_liecba;
desc recept;
select * from recept;

select * from sprievodka;
-- ciselniky
select * from liek;
select * from typ_symptom;

select l.nazov from predp_liecba p
join liek l on (l.id_liek = p.id_liek)
where p.id_vysetrenie = 1;

--- deleting vysetrenie trigger 
create or replace TRIGGER delete_vyseternie
before delete on vyk_vysetrenia
FOR EACH ROW
BEGIN
-- 1. delete from recept
   delete from recept rec
    where rec.id_vysetrenie = :old.ID_VYSETRENIE;
-- 2. delete from predpisana liecba
    delete from predp_liecba liecba 
     where liecba.id_vysetrenie = :old.ID_VYSETRENIE;
-- 3. ziskaj cis choroby a vymaz vsetky prizanaky a chorobu
     
         delete from priznaky pr 
          where exists (select 'x'
                        from zap_choroby zap
                         where zap.id_vysetrenie = :old.ID_VYSETRENIE);
          delete from zap_choroby zap
           where zap.id_vysetrenie = :old.ID_VYSETRENIE;
END;
/

commit;
delete from vyk_vysetrenia vyk
where vyk.id_pacient = 3;

select * from vyk_vysetrenia;




-- DELETE VYSETRENIE 

delete from recept;
delete from predp_liecba;
delete from priznaky;
delete from zap_choroby;
delete from vyk_vysetrenia;

commit;

-- predpisujem pre katarinu id 2 vysetrenie od lekara ocna mariana id 2
-- choroba B300 zapal spojiviek
-- symptom 104 slzenie
select * from lekar;

select * from choroba c
where c.nazov like '%zápal%';


--- autoincrement recepty

drop sequence recept_seq;
CREATE sequence recept_seq 
 START WITH 1 increment by 1;

COMMIT;

create or replace TRIGGER recept_autoinc_id
BEFORE INSERT ON recept
FOR EACH ROW
BEGIN
    select recept_seq.nextval into :new.ID_RECEPT from dual;  
END;
/

desc l_balenie;
desc recept;

create or replace TRIGGER calculate_total_price_recipe
before insert on recept
FOR EACH ROW
declare
  balenie_price l_balenie.cena%type;
BEGIN
   select bal.cena into balenie_price from l_balenie bal 
    where bal.kod_balenia = :new.kod_balenia;
    if balenie_price > 0
     then
        :new.cena := :new.balenie_ks * balenie_price;
    end if;
END;
/
commit;


Insert into SYSTEM.SPRIEVODKA ("IdPacient","IdLekar","TerminOd","IdTypVysetrenia","TerminDo","IsDeactivated","ZrusenieDovod") 
values ('2','2',to_date('23-MAR-22 7:30:00','DD-MON-RR HH24:MI:SS'),'44',to_date('23-MAR-22 8:00:00','DD-MON-RR HH24:MI:SS'),'0',null);
commit;


select bal.cena from l_balenie bal 
    where bal.kod_balenia = '86052';


---- recept queries 
select *from liek;
select * from liek_ucinna_latka;
select *from ucinna_latka;
desc l_balenie;
select * from l_balenie;

select * from l_balenie bal
where bal.id_liek = 1;

---zap chorob



select * from liek l
where lower(l.nazov) like '%paralen%';

-- create function to lower in db

desc liek;

select LOWER('AHOJ') from dual;
