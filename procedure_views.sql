-- 1. Create the procedure with an INOUT cursor parameter
CREATE OR REPLACE PROCEDURE top_salary(emp_cursor INOUT REFCURSOR)
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN emp_cursor FOR
        SELECT emp_name, dept, salary
        FROM employee_details
        WHERE salary > 100000;
END;
$$;

BEGIN;

-- Declare a named cursor
CALL top_salary('my_cursor');

-- Fetch all rows from the cursor
FETCH ALL FROM my_cursor;

--stored procedure using IN
CREATE OR REPLACE PROCEDURE sp_sort_by_salary(IN var INT)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT emp_name, age, salary
        FROM employee_details
        ORDER BY salary DESC
        LIMIT var
    LOOP
        RAISE NOTICE 'Name: %, Age: %, Salary: %', rec.emp_name, rec.age, rec.salary;
    END LOOP;
END;
$$;

-- Call the procedure
CALL sp_sort_by_salary(3);

--stored procedure using OUT

-- do this yourself 


-- using views in sql 

--this creates a view 
select * from employee_details;

create view employee_det
as 
select emp_name,age,dept 
from employee_details;

select * from employee_det;

--using joins in views 
create view product
as 
select s.product_id,s.sell_price,c.cost_price 
from sales as s inner join c_product as c 
on s.product_id=c.product_id;
--using inner join

select * from product ; -- check the output ; 

-- To rename a view : 
alter table product
rename to prod

-- to delete a view :

drop view prod;

-- Windows function : 

-- Some of the windows function in postgresql are : 
-- ROW_NUMBER()
-- RANK()
-- DENSE_RANK()
-- NTILE(n)
-- SUM() OVER(...)
-- AVG() OVER(...)
-- COUNT() OVER(...)
-- LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE()

--  Highest salary by dept 
select emp_name,age,dept, 
sum(salary) over (partition by dept) as total_salary
from employee_details;


select row_number() over(order by salary) as row_num,
emp_name, salary from employee_details order by salary;

-- new 

create table demo(st_id int,st_name varchar(20));

insert into demo 
values(101,'Shame'),
(102,'Ash'),
(103,'Herath'),
(103,'Herath'),
(104,'Nathan'),
(105,'Kevin'),
(105,'Kevin');

select * from demo ;

select st_id,st_name ,row_number() over 
(partition by st_id,st_name order by st_id) as row_num
from demo;

-- Rank function 

create table demo1(var_a int);

insert into demo1
values
(101),
(102),
(103),
(103),
(104),
(105),
(106),
(106),
(107);

select var_a,
rank() over (order by var_a) as test_rank
from demo1;

-- Window function always requires the over clause 


select emp_name, age , salary , first_value(emp_name)
over (order by salary desc) as highest_salary from employee_details;

select emp_name,dept,salary,first_value(emp_name)
over (partition by dept order by salary desc ) as highest_salary
from employee_details;


























