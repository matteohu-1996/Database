-- Interrogazione più tabelle, sintassi Join
-- EQUI JOIN
-- INNER JOIN
select titolo, nome, cognome
from docenti -- tabella sinistra
inner join corsi -- tabella destra
on docenti.id = docente_id;

-- outer join
-- Left anche gli esclusi della tabella di destra
select titolo, nome, cognome
from docenti 
left join corsi 
on docenti.id = docente_id order by cognome;

-- Right, anche gli esclusi della tabella di destra
select titolo, nome, cognome
from docenti 
right join corsi 
on docenti.id = docente_id order by titolo;

-- solo gli esclusi della tabella di sinistra
select nome, cognome
from docenti 
left join corsi 
on docenti.id = docente_id 
where corsi.id is null
order by cognome;

-- solo gli esclusi della tabella di destra
select titolo, nome, cognome
from docenti 
right join corsi 
on docenti.id = docente_id
where docenti.id is null
order by titolo;


use ep_2025;
-- FULL OUTER JOIN
-- tutti
use corsi;
select titolo, nome, cognome
from docenti 
left join corsi 
on docenti.id = docente_id 
union
select titolo, nome, cognome
from docenti 
right join corsi 
on docenti.id = docente_id 
order by titolo;

-- FULL OUTER JOIN
-- solo esclusi
select nome, cognome
from docenti 
left join corsi 
on docenti.id = docente_id 
where corsi.id is null
union
select nome, cognome
from docenti 
right join corsi 
on docenti.id = docente_id
where docenti.id is null;

-- CROSS JOIN
select articolo, colore
from prodotti
cross join colori;

create table articolo(
id int auto_increment primary key,
descrizione varchar (255)
);
create table colori(
id int auto_increment primary key,
colore varchar(20)
);
insert into articolo(descrizione)
values ("camicia"),("pantalone"),("giacca");
insert into colori(colore)
values ("giallo"),("rosso"),("verde"),("blu");

select descrizione, colore
from articolo
cross join colori;

-- Union
select state, capital_id, population
from africa
union
select state, capital_id, population
from america
union ALL
select state, capital_id, population
from asia;

select first_name, last_name
from customers
union all -- all se non si vogliono eliminare ripetizioni
select first_name, last_name
from students
order by last_name;

update students set first_name = "chiara", last_name = "gallo"
where first_name = "paola" and last_name = "verdi";

-- JOIN con 3 tabelle
use corsi;
select nome, cognome, titolo
from corsi c
join iscrizioni i on c.id = i.corso_id
right join studenti s on s.id = i.studente_id; -- elenco di studenti iscritti e non iscritti

select nome, cognome, titolo
from corsi c
left join iscrizioni i on c.id = i.corso_id
left join studenti s on s.id = i.studente_id;
-- left entrambi di join per riferimento di sinistra

select * from corsi;
-- USO del JOIN in UPDATE
select titolo
from corsi c
left join iscrizioni i on c.id = i.corso_id
where i.corso_id is null;

update corsi c
left join iscrizioni i on c.id = i.corso_id
set c.prezzo = c.prezzo * .9
where i.corso_id is null;

select * from corsi;

-- self join
use ep_2025;

create table impiegati(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(50),
ruolo varchar(20),
id_respo int,
stipendio decimal(6,2)
);
INSERT INTO `impiegati`
VALUES (1,'Mario','Rossi','tecnico',NULL,2500.00),
(2,'Elena','Totti','amministrativo',NULL,2600.00),
(3,'Paola','Capra','venditore',NULL,2300.00),
(4,'Marco','Bianchi','amministrativo',2,1600.00),
(5,'Paolo','Verdi','amministrativo',2,1600.00),
(6,'Enrico','Marrone','venditore',3,1300.00),
(7,'Nicola','Testa','venditore',3,1300.00),
(8,'Franco','Barba','tecnico',1,1500.00),
(9,'Mauro','Barba','venditore',3,1300.00);
select * from impiegati;

select i.nome, i.cognome, i.ruolo, r.cognome
from impiegati i
left join impiegati r
on i.id_respo = r.id;

-- NON EQUI JOIN
create table studenti like corsi.studenti;
insert into studenti select * from corsi.studenti;
select * from studenti;

create table generazioni(
id int auto_increment primary key,
generazione varchar(20),
data_inizio date,
data_fine date
);
insert into generazioni(generazione,data_inizio, data_fine)
values("boomers", "1946-01-01", "1964-12-31"),
("X", "1965-01-01", "1980-12-31"),
("Millenials", "1981-01-01", "1996-12-31"),
("Z", "1997-01-01", "2012-12-31");
select * from generazioni;

-- NON EQUI JOIN
select nome, cognome, data_nascita, generazione
from studenti
join generazioni
on data_nascita between data_inizio and data_fine
order by data_nascita;