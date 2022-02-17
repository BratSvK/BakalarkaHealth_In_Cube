select * from "Roles";
select * from "UserRoles";
select * from lekar;

select * from atestacie_lekar;

select * from "Users";


select * from oddelenie o 
where o.id_nem = 2;

select * from nemocnica;

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