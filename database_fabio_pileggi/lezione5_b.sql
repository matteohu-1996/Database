-- funzioni di gruppo
-- funzioni che lavorano su un gruppo di righe, non su righe singole
-- count conta tutti i valori
-- max massimo tra i valori
-- min minimo tra i valori
-- avg media dei valori

-- producono un singolo valore a partire da un insieme di valori
-- si possono applicare su tutta la tabella o solo su alcune colonne

select sum(sal) from emp;

select max(sal) from emp;

select min(sal) from emp;

select avg(sal) from emp;

select deptno from emp; -- estraggo 19 righe

select count(*) from emp; -- estraggo solo un valore
-- funzioni di gruppo NON considerano i valori nulli

select count(mgr), count(*) from emp;

-- quanta gente c'e per ogni dipartimento
select deptno, count(*) from emp -- funzione di gruppo
group by deptno -- mettere group by per usare più gruppi
order by count(*);

-- salario max per ogni dipartimento
select deptno, max(sal) from emp
group by DEPTNO; 

-- funzione gruppo su 2 raggruppamenti
select deptno, job, sum(sal) from emp
group by deptno, job;

-- conteggio di prodotti per ciascun venditore
select p.vend_id,count(p.prod_id) -- conto quanti ci sono
from products p
group by p.vend_id; -- sto raggruppando per venditore

select deptno, avg(sal)
from emp e
group by deptno
-- where avg(sal) > 8000; where funziona per righe e non per gruppi di dati
having avg(sal) > 8000; -- having come where per i gruppi

select ename,count(*)
from emp e
group by ename
having count(*) > 1; -- filtro

select deptno, avg(sal)
from emp e
where job = "prog" 
group by deptno
having avg(sal) > 8000;

-- somma media massimo e minimo salario per ciascun lavoro
-- visualizzare solo se la media del salario è > 2000
select job, sum(sal), avg(sal), max(sal), min(sal) from emp
group by job
having avg(sal) >2000
order by min(sal);

-- quanti sono e che lavoro fanno gli impiegati la cui media del salario è > 10000
-- e sono stati assunti dopo il 1997
select count(*) as num_impiegati, job, avg(sal) as media from emp
where HIRE_DATE > 1997-12-31
group by job
having avg(sal) > 5000;

-- trovare i numeri di ordine e il num di prodotti ordinati 
-- per gli ordini che contengono 3 o più prodotti che costano più di 2.5 
select ORDER_NUM, count(*)
from orderitems 
where ITEM_PRICE > 2.5
group by ORDER_NUM
having count(*) >= 3;

-- trovare i venditori che hanno 2 o più prodotti che costano  almeno 4€
select p.vend_id, count(*) from products p
where p.prod_price >= 4
group by vend_id
having count(*) >=2;

-- trovare il prodotto che è stato ordinato di più
select o.PROD_ID, count(*)from orderitems o
group by prod_id
order by count(*) desc
limit 1;

-- qual è l'ordine più costoso tra gli ordini che contengono più di 3 prodotti
select ORDER_NUM, sum(o.ITEM_PRICE*o.QUANTITY) as prezzo_tot from orderitems o
group by ORDER_NUM
having count(*) >3 
order by prezzo_tot desc
limit 1;

select deptno, sum(sal)
from emp
group by deptno;

select ename, job, sal, deptno, sum(sal) 
over(partition by deptno) -- fa la stessa cosa di group by, posso visualizzare anche il dettaglio
from emp;  

select  sum(sal)
from emp;

select ename, job, sal, deptno, sum(sal) 
over() -- se non si specifica partition la funzione di gruppo viene eseguita su tutta la tabella
from emp;

select *,
		row_number() over () as n_riga,
        row_number() over (partition by deptno) as n_riga_x_dip,
        sum(sal) over (partition by deptno) as salario_totale_x_dip, 
		sum(sal) over (partition by job) as salario_totale_x_job,
        max(sal) over (partition by deptno) as salario_max_x_dip,
        max(sal) over (partition by job) as salario_max_x_job,
        count(*) over (partition by deptno) as dipendenti_x_dip,
        count(*) over () as tot_dipendenti
from emp
order by n_riga;

select 
row_number() over (partition by DEPTNO) as numero, -- numero per riga dei deptno per dip
ename, sal, deptno, 
count(*) over(partition by deptno) as conteggioPerDip, job,
max(sal) over (partition by JOB) as salarioPerJob,
sum(sal) over() as salario_totale
from emp;
