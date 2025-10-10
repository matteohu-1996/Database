-- crud
-- read
-- QL
select * from students;
select first_name, last_name from students;

select * from students
order by last_name desc, first_name desc;

select * from students 
order by province;

select * from students 
order by last_name 
limit 10;
select * from students 
order by last_name 
limit 40, 10;

select * from students 
where gender = 'f'
order by last_name;
-- operatori di confronto
-- =; <>; !=; >; >=; <; <=

select * from students 
where province != 'to' -- province <> 'to'
order by province, last_name;

select * from students 
where birth_date > '1989-12-31'
order by birth_date, last_name;

-- operatori logici
-- and, or, not

select * from students 
where gender = 'f' and province = 'to'
order by last_name;

select * from students 
where gender = 'f' or province = 'to'
order by last_name;

select * from students 
where not gender = 'f' and not province = 'to'
order by last_name;

select * from students 
where last_name = 'verdi' or (last_name = 'rossi'
and province = 'to');

select * from students 
where (last_name = 'verdi' or last_name = 'rossi')
and (province = 'to' or province = 'al');

-- operatori di confronto avanzato
-- in, not in, between, not between, is null, is not null, like, not like, regexp

select * from students
where province = 'at' 
or province = 'cn' 
or province = 'no' 
or province = 'mi';

select * from students
where province not in('at', 'cn', 'no', 'mi')
or province is null;

select * from students 
where birth_date >= '1990-01-01' and birth_date <= '1990-12-31'
order by birth_date, last_name;

select * from students 
where birth_date between '1990-01-01' and '1999-12-31'
order by birth_date, last_name;
select * from students 
where birth_date not between '1990-01-01' and '1999-12-31'
order by birth_date, last_name;

select * from students
where last_name between 'a' and 'n'
order by last_name;

select * from students
where birth_date is not null;

-- pattern % _

select * from students
where last_name like 'v%'
order by last_name;
select * from students
where last_name like '%io'
order by last_name; -- % qualsiasi carattere che inizia o finisce 

select * from students 
where address like 'via%'
order by address;

select * from students 
where email like '%gmail.com'
order by last_name;

select * from students 
where first_name like 'pa___'; 

select * from students 
where first_name like '&sca_';

-- regexp

select * from students 
where last_name 
regexp '^ve'; -- identica al like
select * from students 
where first_name 
regexp 'co$'; 

select * from students 
where first_name 
regexp '^mar|ara|co$'; -- comincia con ara e finisce con co

select * from students 
where first_name 
regexp '^(mar|ara)|co$';

select * from students 
where first_name 
regexp '[mcp]a'; -- che contenga ma ca pa

select * from students 
where first_name 
regexp '[mcp]a&'; -- ^/& che iniziano o finiscono per

select * from students 
where first_name -- come between
regexp '^[a-m]'; -- tutti i nomi che comprendono tra a m

select 6 * 6; -- posso creare campi di calcolo

select * from books;

select title, price, price * 1.20, pages from books; 

