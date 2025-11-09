create table customers(
cust_id int,age int, name varchar(30)
);

--Before insert trigger in psql 
DROP TRIGGER IF EXISTS age_verify ON customers;

create or replace function age_verify_fn()
returns trigger as $$

begin 
if new.age<0 then 
new.age :=0;
end if;
return new;
end;
$$ language plpgsql;

create trigger age_verify
before insert on customers 
for each row 
execute function age_verify_fn();


insert into customers 
values (101,27,'James'),
(102,-40,'Ammy'),
(103,32,'Ben'),
(104,-39,'Angela');

select * from customers ;

-- After insert trigger 

create table customers1(
id serial primary key,
name varchar(40) not null,
email varchar(30),
birthdate date
);

create table message(
	id serial ,
	message_id int,
	message varchar(300) not null,
	primary key(id,message_id)
);

-- Delimeter doesnt work on postgres so use function

DROP TRIGGER IF EXISTS null_dob_verify ON customers1;

create or replace function null_dob_verify_fn()
returns trigger as $$

begin 
if new.birthdate is null then 
insert into message(message_id,message)
values (new.id,concat('Hi ',new.name,', please update your date of birth.')
);
end if;

return new;
end;
$$ language plpgsql;


create trigger null_dob_verify
after insert on customers1
for each row
execute function null_dob_verify_fn();

insert into customers1(name,email, birthdate)
values ('Nancy','nancy@abc.com',NULL),
('Ronald','ronald@xyz.com','1998-11-16'),
('Krish','chris@xyz.com','1997-08-20'),
('Alice','alice@ghj.com',NULL);

select * from message;

-- before update trigger

create table employees 
(emp_id int primary key ,
emp_name varchar(25),
age int ,
salary float
);

insert into employees values 
(101,'Jimmy',35,70000 ),
(102,'Shane',30,55000),
(103,'Marry',28,62000),
(104,'Jack',40,100000);

--creating function

drop trigger if exists up_trigger on employees;



create or replace function up_trigger_fn()
returns trigger as $$

begin 
if new.salary=10000 then
   new.salary:=85000;
elsif new.salary<10000 then 
   new.salary:=72000;
end if;

return new;
end;
$$ language plpgsql;

--creating trigger 

create trigger 
up_trigger 
before update on 
employees
for each row 
execute function up_trigger_fn();

update employees 
set salary=8000;

select * from employees;

--before delete 

create table salary(
eid int primary key ,
validfrom date not null ,
amount float not null);

insert into salary(eid,validfrom,amount)
values(101,'2005-04-06',55000),
(102,'2007-08-09',68000),
(103,'2006-09-07',75000);

create table salarydel(
id serial primary key,
eid int ,
validfrom date not null,
amount float not null,
deletedat timestamp default now()
);


create or replace function salary_delete_fn()
returns trigger as $$

begin 
insert into salarydel(eid,validfrom,amount)
values(old.eid,old.validfrom,old.amount);

return old;
end;
$$ language plpgsql;


create trigger salary_delete 
before delete 
on salary
for each row 
execute function salary_delete_fn();

delete from salary 
where eid=103;

select * from salarydel;














/