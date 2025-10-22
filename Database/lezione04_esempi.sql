-- scenario 1
-- valuto il corso in più fasi
-- mi serve una tabella valutazioni

create table valutazioni(
id int auto_increment primary key,
iscrizioni_id int,
fase_prova enum("fase 1", "fase 2", "fase 3"),
punteggio decimal(5,2) check(punteggio <= 100),
data_valutazione date
);

-- scenario 
-- valuto corso una tantum
-- aggiungere punteggio alla tabella iscrizione

alter table iscrizioni
add punteggio decimal(6,2) check(punteggio <= 100)
after corso_id,
add data_val date after punteggio;
desc iscrizioni;

select * from iscrizioni;

select round((60 + rand() * 40),1);

update iscrizioni set punteggio = round((60 + rand() * 40),1);

-- elenco corso, studente e punteggio
select nome, cognome, titolo, punteggio
from studenti s
join iscrizioni i on s.id = i.studente_id
join corsi c on c.id = i.corso_id
order by titolo; 

-- punteggio medio dei corsi
select titolo, round(avg(punteggio),2)
from iscrizioni i  
join corsi c
on c.id = i.corso_id
group by titolo
order by titolo;

-- punteggio medio dei studenti
select 
	cognome, 
    nome, 
    round(avg(punteggio),2) `punteggio medio`, 
    count(corso_id) `n. corsi`,
    max(punteggio),
    min(punteggio)
from studenti s
join iscrizioni i 
on s.id = i.studente_id
group by cognome, nome
order by `n. corsi` desc;

select 
	cognome, 
    nome, 
    round(avg(punteggio),2) `punteggio medio`, 
    count(corso_id) `n. corsi`,
    group_concat(" ",titolo) `corsi`,
    group_concat(" ",punteggio) `punteggi singoli`,
    max(punteggio),
    min(punteggio)
from studenti s
join iscrizioni i 
on s.id = i.studente_id
join corsi c 
on c.id = i.corso_id
where provincia = "to"
group by cognome, nome
having `n. corsi`> 1
order by `n. corsi` desc
limit 6;