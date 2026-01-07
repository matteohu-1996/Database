select if (1<2, "si", "no");

select ename, if(sal>=9000, job, "meno di 9000") from emp;

select ifnull(null,0); -- per pulire i valori dal null (mette 0)

select ename, mgr, ifnull(mgr,"è il capo") from emp; -- dove c'e null mette è il capo

select nullif("x","a"); -- ritorna null se 2 valori sono uguali, altrimenti il primo

select ifnull(nullif("a","a"), "sono uguali"); 

select coalesce(null, null, "b"); -- ritorna il primo valore non nullo della lista

select job, if(job= "prog", "programmatore", -- if
		if (job="clerk", "impiegato", -- else if
			if (job="account", "contabile", -- else if
					"" -- else
				)
             )
		) as esempio
from emp;

-- visualizzare tutte le colonne della tabella emp 
-- ma nascondere per motivi privacy lo stipendio e la data di assunzione degli impiegati del dipartimento 10
select EMPNO, ENAME, JOB, MGR, if(sal > 6000, null, "più di 6000") and if (hire_date > 1987-01-01, null, null) `sal and hire_date`
from emp
where DEPTNO = 10;

select empno, ename, mgr, job, if(deptno=10, "",sal), if (deptno=10,"", hire_date)
from emp;

-- visualizzare il numero di ordine, il codice dei prodotti, e la quantità
-- se la quantità è inferiore di 10 visualizzare in una nuova colonna "ordine piccolo", altrimenti null

select o.order_num, o.prod_id, o.quantity,
		if(o.quantity<10, "ordine piccolo","")
from orderitems o;

select job, if(job= "prog", "programmatore", -- if
		if (job="clerk", "impiegato", -- else if
			if (job="account", "contabile", -- else if
					"" -- else
				)
             )
		) as esempio
from emp;

-- case alternativa a IF
select job, 
case job when "prog" then "programmatore"
		when "clerk"then "impiegato"
		when "account" then "contabile"
		else ""
end as lavoro
from emp;

select c.cust_name, c.cust_city, c.cust_state,
case c.cust_state -- dove c'e uguaglianza mettere colonna
	when "mi" then "michigan"
    when "oh" then "ohio"
    when "in" then "indiana"
    when "az" then "arizona"
    when "il" then "illinois"
end as stati,
ifnull(c.cust_email,"") as email
from customers c;

-- visualizzare il nome, il lavoro e lo stipendio degli impiegati
-- in una altra colonna visualizzare: 
-- "stipendio basso" nel caso di sal < 4000
-- "stipendio medio" nel caso di sal tra 4000 e 11000
-- "stipendio alto" in tutti gli altri casi
select e.ENAME, e.JOB, e.SAL,
case -- dove non c'e uguaglianza non mettere colonna case
	when e.sal <= 4000 then "stipendio basso"
    when e.sal between 4000 and 11000 then "stipendio medio"
    else "stipendio alto"
end as stipendio
from emp e
order by sal;