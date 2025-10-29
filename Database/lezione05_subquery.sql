-- subquery
select avg(prezzo) from corsi; -- 187.00
select titolo, prezzo
from corsi
where prezzo >= 187.00
order by titolo;

select avg(prezzo) from corsi;
select titolo, prezzo
from corsi
where prezzo >= (select avg(prezzo) from corsi)
order by titolo;

select max(prezzo) from corsi;
select titolo, prezzo
from corsi
where prezzo = (select max(prezzo) from corsi);

select nome, cognome, data_isc
from studenti s
join iscrizioni i
on s.id = studente_id
where data_isc = (select max(data_isc) from iscrizioni);

select titolo, count(corso_id) quanti
from corsi c 
join iscrizioni i
on c.id = i.corso_id
group by c.id
having quanti >= ALL (select count(studente_id) from iscrizioni
group by corso_id
);

select count(studente_id) from iscrizioni
group by corso_id;

select distinct nome, cognome, email
from docenti d 
left join corsi c 
on d.id = c.docente_id;

select nome, cognome, email
from docenti
where id in (select docente_id from corsi);

select nome, cognome, email
from docenti
where id not in (select docente_id from corsi); -- non conviene se il campo della tabella figlia contiene null

select nome, cognome, email 
from docenti d
left join corsi c 
on d.id = c.docente_id
where c.id is null;

-- subquery correlata -> EXISTS
-- più efficace perchè valuta l'esistenza della riga
select nome, cognome, email 
from docenti d
where exists (select 1 from corsi c where c.docente_id = d.id);
-- alternativa con JOIN
select distinct nome, cognome, email
from docenti d 
left join corsi c 
on d.id = c.docente_id;

select nome, cognome, email 
from docenti d
where not exists (select 1 from corsi c where c.docente_id = d.id);

select cognome, nome,email, timestampdiff(year, data_nascita, curdate()) eta
from studenti;

select* from (
	select cognome, nome,email, provincia,timestampdiff(year, data_nascita, curdate()) eta
	from studenti 
    where timestampdiff(year, data_nascita, curdate()) < 30
) as tbl
where tbl.provincia = "to";

-- row() x piu colonne minimo 2 colonne
create table amici(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(30)
);

insert into amici(nome, cognome) 
select nome, cognome
from studenti where id < 10;
select *from amici;

select * from amici where row(nome, cognome) = (select nome, cognome from studenti where id = 8);