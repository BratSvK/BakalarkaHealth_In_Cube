select * from "Roles";
select * from "UserRoles";

select * from atestacie_lekar;
select * from "Users";
select * from oddelenie o 
where o.id_nem = 1;
select * from nemocnica;
select * from oddelenie;

select * from ziadanka_lekar;


select * from prac_doba;

desc lekar;
select * from lekar;
commit;

update lekar l
set l."IsActivated" = 0
where l.id_lekar = 3;


commit;

delete from lekar;

ALTER TABLE lekar RENAME COLUMN isactivated TO "IsActivated";

Insert into LEKAR (ID_LEKAR,ID_POUZIVATEL,ID_ODDEL,DO,"DlzkaVysetrenia") 
values ('1','2','2',null,'0');

Insert into LEKAR (ID_LEKAR,ID_POUZIVATEL,ID_ODDEL,DO,"DlzkaVysetrenia") 
values ('2','7','3',null,'30');

--- aby som mal dve rovnaké na skúšku naèítania lekárov 
Insert into ODDELENIE (ID_ODDEL,ID_NEM,ID_PRIMAR,NAZOV_ODD) 
values ('4','1',null,'Oftalmológia (oèné)');





rollback;


select * from nemocnica;

select * from oddelenie od
left join nemocnica n on(od.id_nem = n.id_nem)
where od.id_nem = 1;

select * from oddelenie;
desc oddelenie;
insert into oddelenie
values(5,1,null,'Oèná chirurgia');

commit;






-----------kontrola vytvorenie lekara

select * from lekar;

select * from ziadanka_lekar;
update ziadanka_lekar z
set z.akceptovana = null
where z.id_user = 8;
commit;



select * from atestacie_lekar;
select * from prac_doba;

select * from "Users";
select * from "UserRoles";
select * from bydlisko;

update atestacie_lekar at
set at.id_atestacia = 4
where at.id_lekar = 3 and at.id_typ = 8;

--delete users-- with trigger
desc "Users";
delete from "Users" u
where u."Id" = 8;

create or replace trigger delete_User
before delete on "Users"
for each row
begin

delete from bydlisko b 
where b.id_pouzivatel = :old."Id";

end;
/

----- autoID atestacia 
commit;

drop sequence atestacia_ID;

create sequence atestacia_ID
increment by 1 start with 5;
commit;

create or replace TRIGGER atestacia_auto_id
BEFORE INSERT ON atestacie_lekar 
FOR EACH ROW

BEGIN
    select atestacia_ID.nextval into :new.ID_ATESTACIA from dual;  
END;
/

-----------------------------admin priprava
update "Users" u 
set u."Email" = 'healthincubenemocnice@gmail.com'
where u."Id" = 1;
commit;



--- testing email for creation of patient account  id = 3 
select * from ziadanka;
select * from pacient;
select * from zdravotna_karta;


delete from zdravotna_karta z 
where z.id_pacient = 3;

delete from pacient p 
where p.id_pacient = 3;

update ziadanka z
set z.akceptovana = null
where z.id_pacient = 3;

commit;