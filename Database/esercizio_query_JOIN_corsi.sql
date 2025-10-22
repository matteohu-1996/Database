-- USARE SINTASSI JOIN
-- corsi, docenti
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select cognome, nome, email, titolo 
from corsi 
join docenti
on docenti.id = docente_id
order by cognome, nome;

/* 2
Seleziona il titolo del corso con prezzo inferiore a 200€ (non incluso)
e cognome, nome, email dei docenti che insegnano in quel corso,
ordina per prezzo in modo discendente
*/

select titolo, prezzo, cognome, nome, email
from corsi 
join docenti
on docenti.id = docente_id
where prezzo < 200
order by prezzo desc;
/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/

select cognome, nome, email, titolo
from docenti
join corsi
on docenti.id = docente_id
where titolo = "HTML";

/* 4
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/

select cognome, nome, email, titolo
from docenti
left join corsi 
on docenti.id = docente_id
order by titolo, cognome, nome;

/* 5
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I CORSI CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from docenti
right join corsi
on docenti.id = docente_id 
order by titolo, cognome, nome;

select titolo from corsi
where docente_id is null;

select * from corsi;
/* 6
Seleziona cognome, nome, email
SOLO DEI DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per cognome e nome
*/
select cognome, nome, email
from docenti
left join corsi
on docenti.id = docente_id
where corsi.id is null
order by cognome, nome;
/* 7
Seleziona titolo SOLO DEI CORSI 
CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo
*/
select titolo 
from corsi
left join docenti
on docenti.id = docente_id
where docenti.id is null
order by titolo;

select titolo from corsi
where docenti.id is null;
-- studenti, corsi, iscrizioni
/* 8
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from studenti
right join iscrizioni
on studenti.id = studente_id
join corsi
on corsi.id = corso_id
order by titolo, cognome, nome;

/* 9
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti
join iscrizioni
on studenti.id = studente_id
join corsi
on corsi.id = corso_id
where titolo = "java"
order by cognome, nome;

/* 10a
Seleziona cognome, nome, email, degli studenti 
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select cognome, nome, email,prezzo
from studenti
join iscrizioni
on studenti.id = studente_id
where prezzo >= 200
order by cognome, nome;

-- 10b Aggiungi il titolo corso alla query precedente
select cognome, nome, email, iscrizioni.prezzo, titolo
from studenti
join iscrizioni
on studenti.id = studente_id
join corsi
on corsi.id = corso_id
where iscrizioni.prezzo >= 200
order by cognome, nome;


/* 11
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE GLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per titolo, cognome e nome
*/
select cognome, nome , email, titolo
from studenti
left join iscrizioni
on studenti.id = studente_id
left join corsi 
on corsi.id = corso_id
order by titolo, cognome, nome;

/* 12
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
select cognome, nome , email, titolo
from studenti
join iscrizioni
on studenti.id = studente_id
right join corsi 
on corsi.id = corso_id
order by titolo, cognome, nome;
/* 13
Seleziona cognome, nome, email
SOLO DEGLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per cognome e nome
*/
select cognome, nome, email
from studenti
left join iscrizioni
on studenti.id = studente_id
where iscrizioni.id is null
order by cognome, nome;

/* 14
Seleziona titolo del corso
SOLO PER I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo
*/
select titolo 
from corsi
left join iscrizioni
on corsi.id = corso_id
where iscrizioni.id is null
order by titolo;