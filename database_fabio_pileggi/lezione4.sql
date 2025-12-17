select nome, peso, specie #<- colonne
from animale; #<- dove voglio estrarre le righe

select * from animale; -- * si riferisce alle colonne

select "ciao a tutti";

select 1+1;

select 1+1 as "somma"; -- alias di colonna

select nome, eta, 
1+1 as somma, "ciao a tutti" -- ripetute per n righe
from animale;

select a.nome, a.peso
from animale as a; -- alias di tabella

