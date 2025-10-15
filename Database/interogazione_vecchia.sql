-- Interrogazione di più tabelle, vecchia sintassi
select * from corsi;
select * from docenti;

select titolo,nome, cognome, prezzo
from docenti, corsi -- collegamento tabella corsi docenti
where docente_id = docenti.id -- filtro
and prezzo >= 150.00;
-- and titolo = "java"; 

select nome, cognome, titolo
from corsi, studenti, iscrizioni
where corsi.id = corso_id
and studenti.id = studente_id
order by titolo, cognome, nome;

select studenti.nome, studenti.cognome, titolo, docenti.nome, docenti.cognome
from corsi, studenti, iscrizioni, docenti -- 4 tabelle
where corsi.id = corso_id
and studenti.id = studente_id
and docenti.id = docente_id -- 3 condizioni di join
order by titolo, studenti.cognome, studenti.nome;

-- ALIAS

select 
	s.nome as `Nome studente`, -- Alias di colonna
	s.cognome `Cognome studente`, 
	titolo `Corso`, 
	d.nome `Nome docente`, 
	d.cognome `Cognome studente`
from corsi as c, studenti s, iscrizioni i , docenti d 
where c.id = corso_id
and s.id = studente_id
and d.id = docente_id 
order by titolo, s.cognome, s.nome;