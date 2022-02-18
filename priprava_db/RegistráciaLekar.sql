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
set l."IsActivated" = 1;


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