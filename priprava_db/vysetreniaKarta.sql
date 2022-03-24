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
-- 2.podla vysetrenia sa zapise choroba a urcia priznaky
desc zap_choroby;
select * from zap_choroby;
desc priznaky;
select * from priznaky;

-- 3. podla zap choroby sa predpise liecka a recept
desc predp_liecba;
select * from predp_liecba;
select * from recept;

select * from sprievodka;
-- ciselniky
select * from liek;
select * from typ_symptom;

select l.nazov from predp_liecba p
join liek l on (l.id_liek = p.id_liek)
where p.id_vysetrenie = 1;


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


Insert into SYSTEM.SPRIEVODKA ("IdPacient","IdLekar","TerminOd","IdTypVysetrenia","TerminDo","IsDeactivated","ZrusenieDovod") 
values ('2','2',to_date('23-MAR-22 7:30:00','DD-MON-RR HH24:MI:SS'),'44',to_date('23-MAR-22 8:00:00','DD-MON-RR HH24:MI:SS'),'0',null);
commit;