select r."Name" from "Users" u 
join "UserRoles" ur on (ur."UserId" = u."Id")
join "Roles" r on (r."Id" = ur."RoleId");

select * from "Users";


commit;

select * from lekar;

select * from ziadanka;

select * from fotka_pouzivatel;

delete from ziadanka;

delete from bydlisko;

delete from "UserRoles" ur
where ur."UserId" = 3;

select * from bydlisko;

select * from "UserRoles";


delete from "Users" u
where u."Id" = 3;
commit;

desc ziadanka;


select * from pacient p
join ziadanka z on(z.id_pacient = p.id_pacient);


select  
   decode(constraint_type,
     'C', 'Check',
     'O', 'R/O View',
     'P', 'Primary',
     'R', 'Foreign',
     'U', 'Unique',
     'V', 'Check view') type,
   constraint_name,
   status,
   last_change
from   
   dba_constraints
where
   table_name = 'ZIADANKA'
order by
   1;
   
   select * from ziadanka;

select * from pacient;

delete from "Users" u
where u."Priezvisko" = 'Gajdos';

select * from "UserTokens";

select * from "UserLogins";


select * from bydlisko;

delete from bydlisko;

select * from "UserRoles";


select p."Meno" || ' ' || p."Priezvisko" as FullMeno from "Users" p
where exists(select 'x' 
             from lekar l where 
             l.id_pouzivatel = p."Id");

desc lekar;


insert into lekar
values(1,2,2,null);


show



desc pacient;




select * from nemocnica;

delete from nemocnica n 
where n.id_nem = 2;

select * from nemocnica c 
where c.id_mesto = 228;

select * from typ_lekara;

select * from mesto m
where m.nazov like 'Kysuck%';


select * from oddelenie od 
where od.id_nem = 2;


desc nemocnica;

commit;

select sysdate from dual;
select * from atestacie_lekar l 
join typ_lekara typ on (typ.id_typ = l.id_typ);
desc atestacie_lekar;

insert into atestacie_lekar
values(1,66,1,'13.10.2021');

commit;

delete from atestacie_lekar;

select * from typ_lekara t 
where t.nazov like '%A%';

select * from  nemocnica;

select * from nemocnica n
join oddelenie od on (od.id_nem = n.id_nem)
join lekar l on (l.id_oddel = od.id_oddel)
where od.nazov_odd = 'Vöeobecn˝ lek·r';


Insert into nemocnica(ID_NEM,NAZOV,MOBIL,ULICA,URL_STRANKA,ID_MESTO) 
values ('2','Poliklinika KysuckÈ NovÈ Mesto','041/4207373','BelanskÈho 773','','1328');
REM INSERTING into SYSTEM.OBLAST_URCENIA
Insert into SYSTEM.OBLAST_URCENIA (ID_OBLAST,NAZOV) values ('1','hor˙Ëka');
Insert into SYSTEM.OBLAST_URCENIA (ID_OBLAST,NAZOV) values ('2','bolesù');
REM INSERTING into SYSTEM.ODDELENIE
Insert into SYSTEM.ODDELENIE (ID_ODDEL,ID_NEM,ID_PRIMAR,NAZOV_ODD) values ('2','2',null,'Vöeobecn˝ lek·r');




-- 66 vseobecny lekar pre dospelych 


select * from lekar l
join oddelenie od on (od.id_oddel = l.id_oddel)
join "Users" us on(us."Id" = l.id_pouzivatel);

select * from oddelenie od 
join lekar l on (l.id_oddel = od.id_oddel)
where od.id_nem = 2;

select od.nazov_odd from oddelenie od 
where od.id_nem = 2;


commit;



