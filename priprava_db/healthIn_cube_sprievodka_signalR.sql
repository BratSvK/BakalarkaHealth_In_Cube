---- sprievodky SignalR
select * from "Users";
select * from sprievodka;

delete from sprievodka s
where s."IdPacient" = 2 and s."IdLekar"=2;

commit;
select * from typ_lekara;