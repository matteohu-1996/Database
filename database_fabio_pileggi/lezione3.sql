-- 	DML DATA MANUPULATION LANGUAGE 

-- insert -> inserisce le righe
-- update -> per modificare le righe
-- delete -> eliminare le righe

-- transazione -> ogni comando che modifica un valore
-- autocommit -> salva in automatico le operazioni senza conferma 
-- commit -> conferma i dati
-- rollback -> annulla l'operazione

-- integrità dei dati:
-- eseguo 1000 operazioni e ne fallisce solo 1 = tutto viene annullato (senza autocommit)

-- con le operazioni DDL (create alter drop) non esiste conferma

-- per disattivare autocommit
-- set autocommit=0; -- predefinito è 1

-- insert
insert into animale(id, nome, peso, specie,razza,eta)
values(1,"boby",15,"cane", "alano", 5);

desc animale;

insert into animale(id,nome,peso, specie,razza,eta)
values (2,"ugo",10, "tartaruga","ninja",7);

insert into animale(id,specie) -- <- per specificare quali colonne si vogliono
values (3,"gatto");

insert into animale(id,nome,peso)
values(4,null,5);

select * from animale;

alter table animale add dataNascita datetime;

insert into animale(id,nome,dataNascita)
values (5,"gino", now()); -- data sistema con ora

insert into animale(id,nome,dataNascita)
values (6,"gino", sysdate()); -- data sistema con ora

insert into animale(id,nome,dataNascita)
values (7,"lino", curdate()); -- data sistema senza ora

insert into animale(id,nome,dataNascita)
values (8,user(), curdate()); -- user è utente collegato

insert into animale(id,nome,dataNascita)
values (9,"rino", "2004-08-25"); -- sempre anno mese giorno 

insert into animale(id,nome,dataNascita)
values (10,"pingu", "20050726"); 

insert into animale(id,nome,dataNascita)
values (11,"pango", "2008-04/29"); -- possibile con warning

-- insert multi riga
insert into animale(id, nome)
values  (12, "pongo"),
		(13, "pengo"),
        (14, "pingo"),
        (15, "pungu");

-- copia dei dati da tabella esistente
insert into animale(id, nome)
select id, nome
from animale;

-- nel caso ci fosse una chiave ignora la insert
insert ignore into animale(id,nome) 
values(15, "xx");

-- in caso di duplicati il nuovo valore sostituisce quello vecchio
replace into animale(id,nome)
values(15,"yy");

alter table animale modify id int not null;

alter table animale add constraint primary key (id);
delete from animale where id = 10;

alter table animale modify id int auto_increment;

alter table animale auto_increment=16;

-- a questo punto id non va più riportato nell'insert perche lo fa auto_increment
insert into animale(nome, peso)
values("dobby",10);

replace into animale (id,peso)
values (16,20);

alter table animale add constraint ck_peso check(peso>4);

-- ci da errore perche peso < di 4
insert into animale(nome,peso)
values ("sugo",2);

alter table animale add codice varchar(10);

alter table animale add constraint uq_codice unique(codice);

insert into animale(nome, codice)
values ("W","123");

insert into animale(nome, codice)
values ("c","123");


-- tabella autori
create table autori(id int unique, nome varchar(100), email varchar(30) unique);
alter table autori modify id int primary key;
alter table autori change id autori_id int; 
alter table autori modify nome varchar(100) not null;

-- tabella libri
create table if not exists libri(libro_id int unique primary key, titolo varchar(100) not null unique, anno_pub int not null, autore_id int not null);

alter table libri add constraint fk_libro_autore foreign key(autore_id) references autori(id);

desc libri;

alter table libri add constraint ck_anno_pub check(anno_pub > 0 and anno_pub <= YEAR(curdate()));

-- tabella vendite
create table if not exists vendite (id_vendite int unique, data_vendita date not null, copie_vendute int not null);
alter table vendite add libro_id int not null;

alter table vendite add constraint fk_vendita_libro foreign key(libro_id) references libri(libro_id);

desc vendite;

alter table vendite add constraint ck_datanonfutura check (data_vendita <= CURDATE());

alter table vendite add constraint ck_copie_vendute CHECK (copie_vendute > 0);

desc autori;


CREATE TABLE dept(deptno INT, dname VARCHAR(30), city VARCHAR(30));

CREATE TABLE emp(empno INT, ename VARCHAR(20), job VARCHAR(10), hire_date DATE, sal INT, deptno INT, sex ENUM("m","f"), email VARCHAR(20));

ALTER TABLE emp MODIFY deptno int NOT NULL, MODIFY empno int NOT NULL, MODIFY ename VARCHAR(20) NULL;

ALTER TABLE dept MODIFY dname VARCHAR(30) UNIQUE;

ALTER TABLE emp MODIFY email VARCHAR(20) UNIQUE;

desc emp;
ALTER  TABLE emp ADD CONSTRAINT PRIMARY KEY (deptno);
ALTER TABLE dept ADD CONSTRAINT PRIMARY KEY(deptno);
 ALTER TABLE emp DROP PRIMARY KEY;
ALTER TABLE emp ADD CONSTRAINT PRIMARY KEY(empno);
alter TABLE emp DROP foreign KEY fk_deptno;

alter table emp drop constraint fk_deptno;

ALTER TABLE emp add  CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept (deptno) ON DELETE SET NULL;
show create table emp;
 
ALTER TABLE emp  ADD CONSTRAINT ck_sal CHECK (sal > 1000);
ALTER TABLE emp MODIFY deptno int NULL;


insert into dept (deptno)
values (10),
	(20),
    (30);
select * from emp;
insert into emp(empno,ename,job,hire_date,sal,deptno,sex,email)
values(1,"steven","account","1987-06-17",24000,10,"m", "S@gmail.com"),
(2,"jose manuel", "account", "1998-03-07",7900,10,"m", "J@gmail,com"),
(3,"Guyy","clerk", "1998-11-15",2600,30,"f", "G@gmail,com"),
(4,"Diana", "prog", "1999-02-07",4200,20,"f", "D@gmail,com"),
(5,"Luis", "account", "1999-12-07",6900,10,"m", "L@gmail,com");

update animale
set nome="solo"
where id =1;

update animale
set nome="pina", -- set si identificano le colonne da modificare
	peso=20
where id=2; -- where si identificano le righe da modificare

update animale
set eta=10
where razza is null;

-- cambiare specie in ameba per animali che hanno peso = 15 oppure eta = 7;
update animale
set specie="ameba"
where peso =15 
or eta = 7;

-- cambiare razza cavallo per chi ha peso 15 e eta 10 
update animale
set razza ="cavallo"
where peso =15
and eta=10;


 