select * from bydlisko b
where b.id_pouzivatel = 4;

select * from "Users" u
order by u."Id" desc;

select count(*) from bydlisko;

select * from bydlisko order by bydlisko.id_bydliska;

delete from bydlisko 
where bydlisko.id_bydliska = 9;

commit;

desc bydlisko;

select bydlisko_seq.nextval from dual;


-- create trigger to autoincrement 
CREATE sequence bydlisko_seq START WITH 8 increment by 1;

drop sequence bydlisko_seq;

select * from user_sequences;
desc user_sequences;

CREATE OR REPLACE TRIGGER bydlisko_auto_id
BEFORE INSERT ON bydlisko 
FOR EACH ROW

BEGIN
    select bydlisko_seq.nextval into :new.ID_BYDLISKA from dual;  
END;
/


commit;