#create database immaginazione_e_lavoro;
#use immaginazione_e_lavoro;

create table T0000_allievi (
id_0000 int primary key unique auto_increment,
matricola char(5) not null unique,
nome varchar(50),
cognome varchar(50),
sesso enum("m", "f"),
cod_fisc char(16) unique not null,
email varchar(50) unique not null,
luogo_nascita varchar(50),
provincia varchar(50),
regione varchar(50),
stato varchar(50),
data_nascita date,
indirizzo varchar (50)
);

create table T0001_insegnanti (
id_0001 int primary key auto_increment,
nome varchar(50),
cognome varchar(50),
sesso enum('m','f'),
cod_fiscale char(16) unique not null,
email varchar(50) unique 
);

create table T0002_corsi (
id_0002 int primary key unique auto_increment,
titolo varchar(50),
codice char(5) unique not null,
durata smallint,
data_inizio date,
data_fine date
);

create table T0003_aule (
id_0003 int primary key unique auto_increment,
numero char(3),
posti tinyint,
piano tinyint
);

create table T0004_programmazione (
id_0004 int primary key,
giorno date,
orario time,
argomento varchar(50),
fk0002_corso_programmazione int,
fk0003_aule_programmazione int, 
fk0001_insegnanti_programmazione int,
CONSTRAINT fk0002_corso_programmazione
    FOREIGN KEY (fk0002_corso_programmazione)
    REFERENCES T0002_corsi(id_0002)
	on delete set null,
CONSTRAINT fk0001_insegnanti_programmazione 
    FOREIGN KEY (fk0001_insegnanti_programmazione)
    REFERENCES T0001_insegnanti(id_0001)
	on delete set null,
CONSTRAINT fk0003_aule_programmazione 
    FOREIGN KEY (fk0003_aule_programmazione)
    REFERENCES T0003_aule(id_0003)
	on delete set null
);

#create table T0005_orari(
#id_0005 int primary key,
#ora_inizio time,
#ora_fine time,
#CONSTRAINT fk0000_allievo
#    FOREIGN KEY (id_0000)
#    REFERENCES T0000_allievi(id_0000)
#	on delete set null,
#CONSTRAINT fk0002_corso
#    FOREIGN KEY (id_0002)
#    REFERENCES T0002_corsi(id_0002)
#	on delete set null);

create table T0005_orari_presenza (
id_0005 int primary key,
orario time,
entrata_uscita enum ("e", "u"),
fk0000_allievi_orari int,
CONSTRAINT fk0000_allievi_orari
    FOREIGN KEY (fk0000_allievi_orari)
    REFERENCES T0000_allievi(id_0000)
	on delete set null
);

create table T0006_iscrizioni(
id_0006 int primary key,
data_iscrizione date,
fk0002_corsi_iscrizioni int,
fk0000_allievi_iscrizioni int, 
CONSTRAINT fk0000_allievi_iscrizioni
    FOREIGN KEY (fk0000_allievi_iscrizioni)
    REFERENCES T0000_allievi(id_0000)
	on delete set null,
CONSTRAINT fk0002_corsi_iscrizioni
    FOREIGN KEY (fk0002_corsi_iscrizioni)
    REFERENCES T0002_corsi(id_0002)
	on delete set null
);

