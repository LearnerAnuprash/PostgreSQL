
Sub queries in SQL 

select emp_name,dept from employee_details
where salary= (select Max(salary) from employee_details);

select emp_name,dept,salary from employee_details
where salary<(select avg(salary) from employee_details);


