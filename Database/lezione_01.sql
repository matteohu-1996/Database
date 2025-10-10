use app_ep;
create table books(
	id int auto_increment primary key,
    title varchar(255),
    price decimal(5,2), -- 999,99
    pages smallint unsigned,
    date_published date
);
show tables;
-- crud
-- create
insert into books(title, price, pages, date_published)
values('Marcovaldo', 20.50, 200, '1970-01-01');
insert into books
values(default,'Guerra e pace', 120.50, 1200, '1970-01-01');
insert into books(price, pages, date_published, title)
values(20.50, 200, '1970-01-01', 'Il gattopardo');
-- read
select title, price, pages, date_published
from books;
desc books;
-- update
select * from books;
update books set price = 50.50 where id = 3;
update books set price = 50.50, pages =  175
where id = 1;
update books set price = 24.50, pages =  100
where id >= 1;
delete from books where id = 1;

delete from books;
truncate books;
drop table if exists students;

CREATE TABLE IF NOT EXISTS students(
id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(30) NOT NULL,
gender ENUM('m','f'),
address VARCHAR(100),
city VARCHAR(30),
province CHAR(2) DEFAULT 'To',
region VARCHAR(30) DEFAULT 'Piemonte',
email VARCHAR(100) NOT NULL UNIQUE,
birth_date date,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(id)
); 
show tables;
desc students;
select * from students;

truncate books;
