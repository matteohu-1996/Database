select  o.order_num as "numero ordine",
		o.order_date as "data ordine",
        o.cust_id as "cliente"-- alias di colonna
from orders o -- alias di tabella
where cust_id is null; -- gli alias sono solo per visualizzazione non si usano per il comando

select e.ename, e.SAL
from emp e
order by sal; -- ordine crescente

select e.ename, e.SAL
from emp e
order by sal desc; -- ordine decrescente

select * from orderitems as oi
order by oi.ORDER_NUM,PROD_ID desc; -- ordinamento multiplo

alter table emp order by ename; -- modifica forzata per ordinamento per evitare di fare sempre order by

select * from emp;

select distinct job from emp; -- distinct filtra i duplicati

select * from emp 
limit 0,5; -- 0 punto di partenza, 5 quante righe mostrare

select * from emp 
limit 5,10; -- parte dalla 6 e ne mostra 10 

-- visualizzare solo l'impiegato che ha salario maggiore tra tutti
select * from emp
order by sal desc
limit 1; -- lo 0 è implicito si può non mettere

select *, (select ename from emp where empno= 100) as "impiegato 100" -- proietta una colonna da tabella diverse
from dept;

select ename, job
from (select * from emp) as tabella_virtuale; -- select su tabella virtuale usare alias singolo

-- impiegati che guadagnano più di 90000€ all'anno
select * from 
(select *, sal*12 as salario_annuo -- obbligatorio rinominare se c'è un calcolo
from emp) x -- tabella virtuale con colonna aggiunta
where salario_annuo>90000 -- filtro su colonna creata da me nella select virtuale
order by salario_annuo;  

-- concatenazione
select 	concat("Prodotto: ", prod_name) as nome_prodotto,
		concat("Costo: ", prod_price) as prezzo
        from products
        order by prod_price;
        
select concat(prod_name, " - " , prod_desc) as descrizione
from products;

select * from emp -- colonne da visualizzare
where sal > 10000;  -- filtro sulle righe

select * from emp -- colonne da visualizzare
where deptno in (10,20); -- come se fosse un OR

select * from emp
where ename like "s%"; -- % tutti i caratteri dopo la S

select * from emp
where ename like "s%" and deptno =10;

select * from emp
where ename like "_s%" and deptno =10; -- _ vuol dire un carattere quindi seconda lettera S

select * from emp
where ename like "__s%" and deptno =10; -- _ vuol dire un carattere quindi terza lettera S

select * from emp
where sal between 10000 and 15000; -- estremi compresi

-- trovare le righe per cui il nome è lex e guadagna più di 10000 o il nome è David
select * from emp
where ename like "lex" and sal>10000
or ename like "David";

-- nome david o lex che guadagno più 10000
select * from emp
where ename in ("lex","david")
and sal > 10000;

-- trovare i programmatori che guadagnano più di 6000€, il loro nome inizia con N e il loro capo è neena 
select * from emp
where job ="prog"
and sal > 6000 and ename like "n%" 
and (select mgr from emp where ename ="neena")
and ename != "neena"; -- diverso 

-- trovare tabella products i prodotti venduti col codice brs01, e i prodotti che costano meno di 4€ e che contengono la parola rabbit nella descrizione
select * from products p
where p.vend_id = "brs01" or prod_price < 4 and prod_desc like "rabbit";

-- trovare dalla tabella customers solo i clienti che abitano in arizona, e i clienti che abitano a columbus ma non hanno l'email
select * from customers c
where c.cust_state ="AZ" 
or c.cust_city ="columbus" and cust_email is null;

-- trovare i dipendenti che hanno un manager, il suo stipendio è maggiore dello stipendio di tutti i dipendenti del suo dipartimento

select * from emp e1
where e1.mgr is not null
and e1.sal >
	(select e2.sal from emp  e2
	where e1.deptno = e2.deptno
	order by e2.sal desc
	limit 1);

select * from emp e1
where e1.mgr is not null
and e1.empno not in(

	select empno from emp e2
    where e2.sal > e1.sal 
    and e1.DEPTNO = e2.DEPTNO
    and e1.ENAME!= e2.ENAME
);
