-- Ragruppamenti
select * from studenti;

-- group by 
select genere, count(*)
from studenti
group by genere;

select distinct cognome from studenti
order by cognome;

select distinct cognome, nome from studenti
where cognome like "v%"
order by cognome;

select cognome from studenti group by cognome;

select cognome, nome, count(*) `quanti` 
from docenti d
join corsi c
on d.id = c.docente_id
group by d.id
order by `quanti` desc;

select genere, 
floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
group by genere;

select 
	cognome, nome, 
    sum(prezzo) `totale speso`,
    round(avg(prezzo),2) `spesa media`,
    max(prezzo) `prezzo max`,
    min(prezzo) `prezzo min`,
    count(*) `quanti corsi`
from studenti s
join iscrizioni i
on s.id = i.studente_id
where cognome like "v%"
group by s.id
having `quanti corsi` > 1
order by `quanti corsi` desc
limit 3;

select provincia, cognome, count(*) `quanti`
from studenti
group by provincia, cognome
order by provincia,`quanti` desc;

select provincia, genere, count(*) `quanti`
from studenti
where provincia != "to"
group by provincia, genere
having `quanti` > 1
order by provincia, `quanti` desc;

select provincia, genere, 
floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
group by provincia, genere
order by provincia, genere;