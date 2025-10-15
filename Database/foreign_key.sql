-- Integrità referenziale
use corsi;
show create table corsi;
select * from corsi;

-- aggiungiamo la FK foreign key a corsi
-- Restrict, blocco le operazioni
alter table corsi
add 
constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on delete restrict on update cascade; 

delete from docenti where id = 1;
insert into corsi(titolo, prezzo, docente_id)
values("Prompt AI", 300.00, 100);
show create table corsi;

-- eliminio la FK per modificarla
alter table corsi drop constraint fk_corsi_docenti;

-- Cascade, elimino a cascata
alter table corsi
add 
constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on delete cascade on update cascade; 
select * from corsi;
delete from docenti where id = 1;

-- Set null, imposto a null la chiave esterna
alter table corsi drop foreign key fk_corsi_docenti;

alter table corsi
add 
constraint fk_corsi_docenti
foreign key(docente_id) references docenti(id)
on delete Set null on update cascade; 

delete from docenti where id = 5;
select * from docenti;

drop table corsi, docenti, studenti, iscrizioni;
select * from docenti;

select * from corsi;
delete from docenti where id = 7;

select * from iscrizioni;
delete from corsi where id = 1;

delete from studenti where id = 1;

SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'corsi'
/* AND TABLE_NAME = 'nome_tabella' */
AND referenced_column_name IS NOT NULL;