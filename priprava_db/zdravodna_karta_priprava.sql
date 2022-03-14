--- zdravotna karta ---
select * from zdravotna_karta z
where z.id_pacient = 2;

desc zdravotna_karta;

desc zdravotna_karta;

--- ist do karty len keï mám povolené a to je všeobecny stále a specializovaný len cez sprievodku v case

select * from typ_lekara;




--- access to health record 

select * from zdrav_karta_povolenia;

Insert into SYSTEM.SPRIEVODKA ("IdPacient","IdLekar","TerminOd","IdTypVysetrenia","TerminDo","IsDeactivated","ZrusenieDovod") 
values ('2','2',to_date('14-MAR-22 17:30:00','DD-MON-RR HH24:MI:SS'),'44',to_date('14-MAR-22 18:00:00','DD-MON-RR HH24:MI:SS'),'0',null);

commit;

select * from sprievodka;


select * from "Users";

select * from ziadanka;

select * from "Roles";

select * from "UserRoles";

