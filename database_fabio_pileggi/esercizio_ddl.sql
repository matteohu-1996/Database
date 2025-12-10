use python;

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