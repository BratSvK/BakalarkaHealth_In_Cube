-- uprava alebo pridanie bydliska pouzivatelovi 
select * from bydlisko b
join mesto m on (m.id_mesto = b.id_mesto)
where b.id_pouzivatel = 3;

commit;

update bydlisko b 
set b.adresa_do = null
where b.id_bydliska = 1;

delete from bydlisko b 
where b.id_bydliska = 4;

select * from bydlisko;

desc bydlisko;


select * from mesto m
where m.nazov like 'Kysucké%';




