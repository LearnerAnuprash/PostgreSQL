
pic2pic-- ***** GROUP BY CLAUSE ***** 

-- create table employee_details(
-- 	Emp_id SERIAL PRIMARY KEY ,
-- 	Emp_Name varchar(30),
-- 	Age INT,
-- 	Doj date,
-- 	Dept varchar(50),
-- 	City varchar(40),
-- 	Salary INT
-- );

-- INSERT INTO employee_details(Emp_Name,Age,Doj,Dept,City,Salary)
-- VALUES
-- ('Anuprash',19,'2024-04-08','IT','Chicago','130000'),
-- ('Anuprash', 19, '2024-04-08', 'IT', 'Chicago', 130000),
-- ('Sophia', 25, '2023-09-12', 'HR', 'New York', 85000),
-- ('Liam', 28, '2022-06-15', 'IT', 'Chicago', 97000),
-- ('Olivia', 24, '2024-01-20', 'Marketing', 'Seattle', 76000),
-- ('Noah', 30, '2021-11-02', 'Engineering', 'San Francisco', 145000),
-- ('Ava', 27, '2023-03-10', 'Design', 'Austin', 91000),
-- ('Ethan', 32, '2020-08-25', 'IT', 'Chicago', 88000),
-- ('Isabella', 26, '2024-05-18', 'Sales', 'Dallas', 94000),
-- ('Mason', 29, '2023-02-09', 'Data Science', 'Denver', 125000),
-- ('Mia', 23, '2024-07-30', 'Support', 'Miami', 68000),
-- ('Lucas', 31, '2022-04-17', 'IT', 'New York', 120000),
-- ('Emma', 25, '2023-09-12', 'HR', 'New York', 85000),
-- ('Oliver', 28, '2024-02-25', 'Engineering', 'San Francisco', 142000),
-- ('Charlotte', 27, '2023-03-10', 'Design', 'Austin', 91000),
-- ('James', 30, '2021-11-02', 'IT', 'Chicago', 130000);

-- select dept,avg(salary) as average_salary from employee_details group by dept;
-- select dept,round(avg(age),0) as average_age_by_department from employee_details group by dept;
-- select dept,sum(salary) as total_salary_by_department from employee_details group by dept;


-- select count(emp_id),city from employee_details group by city 
-- order by count(emp_id) desc;

-- select extract(year from Doj),count(emp_id)
-- from employee_details
-- group by extract(year from Doj);

-- create table sales(
-- product_id int,
-- sell_price float,
-- quantity int,
-- state varchar(20)
-- );

-- insert into sales values(121,320.0,3,'California'),
-- (121,320.0,6,'Texas'),
-- (121,290.0,4,'Texas'),
-- (123,321.00,7,'Alaska');











