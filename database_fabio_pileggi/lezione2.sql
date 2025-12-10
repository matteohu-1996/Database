-- constraint/ vincoli
-- interni = controllo i valori ammessi su una stessa tabella e sulle colonne
-- integrità referenziale = riguarda i rapporti tra una tabella e l'altra
-- (primary key/foreign key)

-- not null
-- unique
-- check
-- pruimary key
-- foreign key

-- si possono creare i constraint nel momento della creazione della tabella
-- aggiungerli dopo <- 

-- su una colonna si possono mettere più constraint

########################################

-- not null = campo obbligatorio

CREATE TABLE impiegato(id INT, nome VARCHAR(100) NOT NULL, data_assunzione DATE NOT NULL);

-- aggiunge not null
ALTER TABLE impiegato MODIFY id INT NOT NULL;

-- unique = campi tutti valori diversi, no duplicati nella colonna
-- per aggiungere i constraint si usa ADD e Nome constraint/tipo constraint
ALTER TABLE impiegato ADD email VARCHAR(25);

ALTER TABLE impiegato ADD CONSTRAINT email_uq UNIQUE(email);	

ALTER TABLE impiegato DROP CONSTRAINT email_uq;

-- check = condizione che deve essere valida per tutti i valori della colonna

ALTER TABLE impiegato ADD eta INT;

ALTER TABLE impiegato ADD CONSTRAINT eta_ck CHECK (eta>17);

ALTER  TABLE impiegato ADD CONSTRAINT nome_ck CHECK(LENGTH(nome)>2);

ALTER TABLE impiegato DROP CONSTRAINT nome_ck;

-- primary key = tutte righe diverse solo 1 per tabella

ALTER TABLE impiegato ADD CONSTRAINT PRIMARY KEY (id);

ALTER TABLE impiegato DROP PRIMARY KEY;

ALTER TABLE impiegato MODIFY id INT AUTO_INCREMENT;

-- parte da riga 100
ALTER TABLE impiegato AUTO_INCREMENT = 100;

ALTER TABLE impiegato MODIFY id INT; -- togliamo auto increment

-- foreign key 

-- tabella padre
CREATE TABLE dipartimento(id_dipartimento INT PRIMARY KEY, nome VARCHAR(100));

-- creiamo la colonna su cui verrà aggiunta la FK
ALTER TABLE impiegato ADD id_dipartimento INT;

-- crea FK
-- integrità referenziale
ALTER TABLE impiegato ADD CONSTRAINT fk_id_dipartimento FOREIGN KEY(id_dipartimento)
REFERENCES dipartimento(id_dipartimento); -- tabella padre con la chiave primaria id_dipartimento
# ON DELETE CASCADE -- cancella in cascata anche le righe della tabella impiegato

# on delete set null -- mette null nella colonna id_dipartimento e mantiene le righe intatte

CREATE TABLE impiegato2 (id INT PRIMARY KEY, email VARCHAR(25) NOT NULL UNIQUE CHECK(email LIKE '%@%')); 


CREATE TABLE dept(deptno INT, dname VARCHAR(30), city VARCHAR(30));

CREATE TABLE emp(empno INT, ename VARCHAR(20), job VARCHAR(10), hire_date DATE, sal INT, deptno INT, sex ENUM("m","f"), email VARCHAR(20));

ALTER TABLE emp MODIFY deptno int NOT NULL, MODIFY empno int NOT NULL, MODIFY ename VARCHAR(20) NULL;

ALTER TABLE dept MODIFY dname VARCHAR(30) UNIQUE;

ALTER TABLE emp MODIFY email VARCHAR(20) UNIQUE;

ALTER  TABLE emp ADD CONSTRAINT PRIMARY KEY (deptno);
ALTER TABLE dept ADD CONSTRAINT PRIMARY KEY(deptno);
 ALTER TABLE emp DROP PRIMARY KEY;
 ALTER TABLE emp ADD CONSTRAINT PRIMARY KEY(empno);
 ALTER TABLE emp DROP fk_deptno foOREIGN KEY;
 ALTER TABLE emp add  CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept (deptno) ON DELETE SET NULL;
 
 
 ALTER TABLE emp  ADD CONSTRAINT ck_sal CHECK (sal > 1000);