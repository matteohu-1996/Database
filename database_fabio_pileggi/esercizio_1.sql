CREATE TABLE if not exists libro (id INT, titolo VARCHAR(100), prezzo FLOAT, data_pub DATE);


-- if not exists controlla prima se esiste

-- solo caratteri a-z 0-9
# i nomi devono essere univoci

DROP TABLE if exists libro;
-- if exists controlla prima di eliminareù

CREATE TABLE copia_libro LIKE libro; -- duplica una tabella

DROP TABLE libro, copia_libro; -- duplica tabella senza i dati

CREATE TABLE animale(id INT, nome VARCHAR(100), peso FLOAT, specie VARCHAR(100), razza VARCHAr(100), eta INT);

CREATE TABLE copia_animale AS SELECT * FROM animale; -- copia perfetta struttura + dati

CREATE TABLE persona(id INT, nome VARCHAR(100));

-- add aggiunge una o più colonne
ALTER TABLE persona ADD indirizzo VARCHAR(100), ADD eta INT;

-- modify cambia il tipo di dato
ALTER TABLE persona MODIFY eta FLOAT;

-- change cambia il nome di una colonna, è obbligatorio specificare il tipo di dato
ALTER TABLE persona CHANGE eta anni FLOAT;

ALTER TABLE persona DROP indirizzo, DROP anni;

RENAME TABLE persona TO persona2;

ALTER TABLE persona2 CHANGE nome nominativo VARCHAR(100), 
							add sesso CHAR(1);
			
CREATE TABLE utente(id INT, nome VARCHAR(100), eta INT, sesso ENUM("m", "f"), maggiorenne ENUM("si", "no"));

CREATE TABLE maglia(id INT, taglia ENUM("s","m","l","xl"), colore VARCHAR(100), marca VARCHAR(100), modello VARCHAR(100), prezzo FLOAT);


CREATE TABLE impiegato(id INT, nome VARCHAR(100), data_assunzione DATETIME, stipendio_in_lire INT, stipendio_in_euro INT, num_reparto INT, livello INT, sesso ENUM('m','f'));

ALTER TABLE impiegato CHANGE id id_impiegato INT;
ALTER TABLE impiegato MODIFY nome VARCHAR(50);

RENAME TABLE impiegato TO impiegati;
ALTER TABLE impiegati DROP stipendio_in_lire ;

ALTER TABLE impiegati ADD cognome VARCHAR(100);

ALTER TABLE impiegati MODIFY livello VARCHAR(10);

ALTER TABLE impiegati CHANGE stipendio_in_euro stipendio INT;

