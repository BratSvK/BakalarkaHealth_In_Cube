select * from nemocnica;
select * from oddelenie;
select * from lekar;
select * from atestacie_lekar;
select * from typ_lekara;
select * from pouzivatel;
select * from fotka_pouzivatel;

desc nemocnica;
alter table nemocnica modify ulica varchar2(50);

select * from mesto m 
where m.nazov = 'Žilina';

insert into nemocnica(id_nem,nazov,mobil,id_mesto,ulica,url_stranka)
values(1,'Fakultná nemocnica s poliklinikou Žilina', '421415110111',228, 'Vojtecha Spanyola 43', 'https://www.fnspza.sk/sk/uvod');

desc oddelenie;
insert into oddelenie
values(1,1,null,'Gastroenterológia');






commit;













