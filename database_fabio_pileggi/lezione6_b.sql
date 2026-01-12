-- 	JOIN

-- senza join si chiama prodotto cartesiano
-- da evitare
select * from emp e, dept d -- prima tabella piccola poi più grande
where d.DEPTNO=e.DEPTNO;

-- dialetto oracle
select * from emp e, dept d 
where d.DEPTNO = e.DEPTNO
and sal >20000;

-- sql standard, evidenzia la join
select * from emp e join dept d -- join sostituisce la virgola
on d.DEPTNO= e.DEPTNO -- on sostituisce where
where sal > 2000;

select * from customers c, orders o
where c.cust_id = o.cust_id;

select * from customers c 
join orders o
on c.cust_id = o.cust_id;

select * from vendors v 
join products p
on v.vend_id = p.vend_id;

-- self join -> relazinoe ciclica sulla stessa tabella
select i.ENAME as impiegato, "lavora per", m.ENAME as manager from emp i, emp m
where m.EMPNO = i.MGR
order by m.EMPNO;

-- se ho n tabelle in join ho bisogno minimo di n-1 condizioni di join
-- a,b,c 
-- se a=b e b=c non serve specificare a=c

select * from  customers c, orders o, orderitems oi
where c.cust_id = o.cust_id
and o.order_num = oi.ORDER_NUM;

select * from customers c join orders o -- in caso di più tabelle si mettono prima 2 e le successive una alla volta
on c.cust_id = o.cust_id
join orderitems oi
on o.order_num = oi.ORDER_NUM;

-- in che città lavorano i dipendenti che fanno i clerk
select * from dept d,emp e
where d.DEPTNO = e.DEPTNO
and job ="clerk";

-- chi ha ordinato il prodotto RGAN01?
select * from customers c join orders o
on c.cust_id = o.cust_id
join orderitems oi 
on o.order_num=oi.ORDER_NUM
join products p 
on p.prod_id = oi.PROD_ID
and p.PROD_ID = "RGAN01";

select * from customers c, orders o, orderitems oi, products p
where p.prod_id = "RGAN01"
and c.cust_id = o.cust_id
and o.order_num = oi.ORDER_NUM
and p.prod_id = oi.PROD_ID;
-- explain plan per vedere cosa fa la queery e il costo di ogni operazione

-- visualizzare il nome del dip dove ci sono almeno 6 lavoratori
select distinct(d.deptno), d.dname
from emp e, dept d
where e.DEPTNO in (
		select DEPTNO from emp group by DEPTNO
        having count(*) >=6
        )
and d.DEPTNO = e.DEPTNO;

select d.DNAME, count(*) from dept d, emp e
where d.DEPTNO = e.DEPTNO
group by d.DNAME
having count(*) >= 6;

-- OUTER JOIN
select * from dept d left outer join  emp e
on d.DEPTNO = e.DEPTNO;

select * from emp e right outer join dept d
on d.DEPTNO = e.DEPTNO;

select * from vendors v left outer join products p
on v.vend_id = p.vend_id
where p.prod_id is null;