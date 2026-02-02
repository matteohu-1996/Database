drop procedure aggiorna_data;

DELIMITER $$ 
CREATE procedure aggiorna_data ()
Deterministic

Begin

    update inventory
    set last_update = now()
	Where last_update < '2025-01-01';
	
end $$
DELIMITER ;

call aggiorna_data();
select * from inventory;

create table actor_s (actor_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter $$
create trigger tr_actor before delete
				on actor for each row
begin 
	insert into actor_s (actor_id, first_name, last_name)
				values (old.actor_id, old.first_name, old.last_name);
end $$
delimiter ;

delete from actor
where actor_id = 3;

select * from actor_s;


