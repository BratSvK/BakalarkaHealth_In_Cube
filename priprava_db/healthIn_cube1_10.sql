desc mesto;


desc nemocnica;

desc bydlisko;

desc zdravotna_karta;

 select * from all_constraints where r_constraint_name in (select constraint_name 
from all_constraints where table_name='MESTO');
    
              


 ALTER TABLE mesto DROP COLUMN psc;
 

 
 

alter table mesto drop primary key;


alter table mesto add id_mesto INTEGER Not NUll;


alter table nemocnica add id_mesto INTEGER Not NUll;

alter table bydlisko add id_mesto INTEGER Not NUll;

alter table zdravotna_karta add id_mesto_narodenia INTEGER Not NUll;


alter table mesto add constraint PK_Mesto PRIMARY KEY(id_mesto);

CREATE INDEX IX_Relationship104 ON zdravotna_karta (id_mesto_narodenia);

ALTER TABLE zdravotna_karta ADD CONSTRAINT Relationship105 FOREIGN KEY (id_mesto_narodenia) REFERENCES mesto (id_mesto);
/

delete from mesto;

commit;

select kr.nazov as "Nazov kraja", count(m.id_mesto) as PocetObci
from mesto m
left join okres ok on (ok.id_okres = m.id_okres)
left join kraj kr on (kr.id_kraj = ok.id_kraj)
where kr.nazov like 'é%'
group by kr.id_kraj, kr.nazov;





select * from mesto m 
where m.nazov like 'Kys%';


select * from okres o
where o.id_okres = 36;

desc rola;

alter table rola drop column nazov;

alter table rola add nazov varchar2(40) not null; 


insert into ROLA 
values(0, 'Spr·vca celÈho systÈmu(Admin-SystÈm)');

insert into ROLA 
values(1, 'Spr·vca nemocnice(oddelenia/lekari)');

insert into ROLA 
values(2, 'PouûÌvateæ');


select * from rola;

delete from rola r
where r.id_typ = 2;


desc poistovna;


select * from poistovna;



alter table poistovna modify nazov varchar2(50);
alter table poistovna modify logo_url varchar2(50);
alter table choroba modify dopl_info_nepatri varchar2(320);



desc choroba;

delete from choroba;

commit;

select * from oblast_urcenia;


insert into oblast_urcenia
values(2,'bolesù');

delete from oblast_urcenia;

insert into liek 
values(1, 'Paralen 500', 'F','Tableta');

select * from liek;

insert into liek_aplikacia
values(1,2);




desc ucinna_latka;

desc l_balenie;


insert into l_balenie
values('86052', 1, 'I',1.68, 1.68, 24);

select * from l_balenie lb
where exists(select 'x' 
             from liek l 
             where lb.id_liek = l.id_liek and l.nazov like 'Paralen%');


select * from liek;


insert into 







insert into liek_ucinna_latka
values(1,1);

insert into ucinna_latka
values(1,1,'Paracetamol', 500);





desc liek;

alter table liek drop column id_oblast;

insert into oblast_urcenia
values(1, 'hor˙Ëka');


insert into oblast_urcenia
values(2, 'bolesù hlavy');
































