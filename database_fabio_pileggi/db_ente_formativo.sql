create table T0000_allievi(id_0000 int primary key auto_increment,
						   matricola char(5) unique not null,
						   nome varchar(50),
                           cognome varchar(50),
                           sesso enum('m','f'),
                           cod_fiscale char(16) unique not null,
                           data_nascita date,
                           luogo_nascita varchar(50),
                           email varchar(50) unique, 
                           indirizzo varchar(50),
                           città varchar(50),
                           provincia varchar(50),
                           regione varchar(50)
						   );
                           
create table T0001_insegnanti(id_0001 int primary key auto_increment,
							  nome varchar(50),
                              cognome varchar(50),
                              sesso enum('m','f'),
                              cod_fiscale char(16) unique not null,
                              email varchar(50) unique 
							  );       
                              
create table T0002_corsi(id_0002 int primary key auto_increment,
						titolo varchar(50),
                        codice char(5) unique not null,
                        durata smallint,
                        data_inizio date, 
                        data_fine date
						);
                        
create table T0003_aule(id_0003 int primary key auto_increment,
						numero char(3) unique not null,
                        posti tinyint, 
                        piano tinyint
						);
                        
create table T0004_programmazioni(id_0004 int primary key, 
								  giorno date,
								  orario time,
								  argomento varchar(50),
								  fk0002_corso_programmazione int,
								  fk0003_aule_programmazione int, 
                                  fk0001_insegnanti_programmazione int
								  );
                             

alter table T0004_programmazioni add constraint  fk0002_corso_programmazione foreign key (fk0002_corso_programmazione)
references T0002_corsi(id_0002) on delete set null;

alter table T0004_programmazioni add constraint  fk0003_aule_programmazione foreign key (fk0003_aule_programmazione)
references T0003_aule(id_0003) on delete set null;

alter table T0004_programmazioni add constraint  fk0001_insegnanti_programmazione foreign key (fk0001_insegnanti_programmazione)
references T0001_insegnanti(id_0001) on delete set null;
														
#create table T0005_orari (id_0005 int primary key, 
#						  fk0002_corsi int, 
#                          orario_inizio time,
#                          orario_fine time
#                          );
                          

create table T0005_orari_presenza(id_0005 int primary key, 
								  fk0000_allievi_orari int,
                                  orari time, 
                                  entrata_uscita enum('e','u')
                                  );
                                  
alter table T0005_orari_presenza add constraint fk0000_allievi_orari foreign key(fk0000_allievi_orari)
references T0000_allievi(id_0000) on delete set null; 
                                  
create table T0006_iscrizioni(id_0006 int primary key,
							  fk0002_corsi_iscrizioni int,
                              fk0000_allievi_iscrizioni int, 
                              data_iscrizione date
                              );

alter table T0006_iscrizioni add constraint fk0000_allievi_iscrizioni foreign key(fk0000_allievi_iscrizioni)
references T0000_allievi(id_0000) on delete set null; 

alter table T0006_iscrizioni add constraint fk0002_corsi_iscrizioni foreign key(fk0002_corsi_iscrizioni)
references T0002_corsi(id_0002) on delete set null; 		
	