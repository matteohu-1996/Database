select vend_id, count(*)
from products p
where p.prod_price >=4
group by p.vend_id
having count(*)>=3;	-- filtro su dati già raggruppati. non usare la where

select DEPTNO, count(*)
from emp 
group by DEPTNO;

select 
row_number() over (partition by DEPTNO) as numero, -- numero per riga dei deptno per dip
ename, sal, deptno, 
count(*) over(partition by deptno) as conteggioPerDip, job,
max(sal) over (partition by JOB) as salarioPerJob,
sum(sal) over() as salario_totale
from emp;

-- chi guadagna più di daniel
-- quanto guadagna daniel?
select sal from emp
where ename="daniel";

select * from emp 
where sal > (select sal from emp -- subquery deve ritornare 1 riga
where ename="daniel");
-- una subquery è una query dentro l'altra
-- la subquery deve ritoranre un valore solo!!
-- la subquery deve ritornare 1 colonna

-- le subquery si possono usare in tutti i tipi di select
delete from emp 
where DEPTNO = (select DEPTNO from dept where ename="ggggg");

select e.*,(select ename from emp where EMPNO=100) from emp e;

select * from (select * from emp -- inline view 
				where sal > (select sal from emp
					where ename="daniel")
		) as salarioPiùDiDaniel
where job ="prog";

-- subquery nella from
select * from (
		select empno,ename, sal, sal*12 as salario_annuo from emp
) as impiegatoSalAnnuo
where salario_annuo > 90000;

-- subquery dentro una if
select ename,sal, avg(sal) over(), -- media su tutta la tabella
if(sal >(select avg(sal) from emp), "più della media", "meno della media")
from emp; 

-- chi fa lo stesso lavoro di steven, e qual è il salario più alto di tutti
select ename,job from emp
where ename="steven";

select *, max(sal) over()
from emp where job=
	(select job from emp e
		where ename="steven") and ename != "steven" or sal = 
        (select max(sal) from emp);
                
-- chi è impiegato che guadagna più di tutti --> con subquery
select * from emp
where sal=(select max(sal) from emp);

-- chi fa lo stesso lavoro di daniel 
-- o guadagna uno stipendio >= den
select * from emp
where job=(select job from emp where ENAME ="daniel") or sal >= (select job from emp where ENAME ="den");

-- quali sono gli impiegati del dip 20 che guadagnano almeno quanto quelli del dip 10
-- visualizzare anche il salario totale tra questi
-- visualizzare gli impiegati col numero progressivo
select row_number() over (order by sal desc), 
e.*, sum(sal) over() from emp e 
where deptno = 20 and sal>= (select min(sal) from emp where deptno = 10)
order by sal;