-- FUNZIONE

-- Funzione di aggregazione

-- avg() calcolo della media
-- count() conteggio
-- max() valore max
-- min() valore min
-- sum() somma
select * from corsi;
select avg(prezzo) `prezzo medio`from corsi;

select count(cognome) from studenti;
select * from corsi;
select count(docente_id) from corsi;

select count(distinct cognome) from studenti;
select * from studenti order by cognome;

select genere, count(*) from studenti
where genere = "f";

select max(prezzo) from corsi;
select min(prezzo) from corsi;

select sum(prezzo) from iscrizioni;

-- Funzioni matematiche

-- round() arrotondamento
-- floor() intero basso
-- ceiling intero alto
select round(prezzo) from corsi;
select 
	floor(round(avg(prezzo) , 2)), -- intero basso
    ceiling(round(avg(prezzo) ,3)) -- intero alto 
from iscrizioni;

-- Funzioni sulle Stringhe

-- concat() concatena
-- concat_ws()
select concat(nome, " " , cognome, " " , email) from studenti;
select concat_ws("-" , nome, cognome, email) from studenti;

-- replace()
select email from studenti;
select email, replace(email, "@example.com", "@gmail.com") from studenti;
select * from studenti where indirizzo like "corso%";

select indirizzo, replace(indirizzo, "corso", "viale") from studenti;

-- Funzioni data e ora

select now(); -- anno mese giorno ora min sec
select curdate(); -- anno mese giorno
select curtime(); -- ora min sec
select cognome, nome, data_nascita, monthname(data_nascita)from studenti;
select dayname("1996-09-17"); 

-- date_format() formatta la data come ci piace
select data_nascita, date_format(data_nascita, "%D-%M-%Y") from studenti;

-- timestampdiff()
select cognome, nome, data_nascita, 
timestampdiff(year, data_nascita, curdate()) `età`
from studenti
order by `età`;

select genere, 
floor(avg(timestampdiff(year, data_nascita, curdate()))) `età media`
from studenti
where genere ="f";

-- rand() random tra 0-1
select rand(); 