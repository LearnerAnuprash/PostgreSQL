create table student_details(
	Name varchar(30),
	Age int,
	Gender char(1),
	DOB date,
	Address varchar(40)
);

INSERT INTO student_details
VALUES
('Anuprash', 19, 'M', '2006-07-17', 'Budhabare'),
('Anmol', 32, 'M', '1995-04-08', 'Arjundhara'),
('Ashley', 18, 'F', '2007-04-08', 'Arjundhara');

-- To only select Address of students without duplication of address:
select distinct Address from student_details;


-- Some of the built in SQL functions : 
select count(Name) as count_name from student_details; 
select sum(Age) as sum_of_age from student_details;
select avg(Age) as average_salary from student_details;

-- When selecting only specific columns from the student_details table :
select name, age , DOB from student_details;

-- Using the WHERE clause : 
select * from student_details where age >18;
select name from student_details where gender ='F';

-- Using OR operator in psql:
select * from student_details where address='Budhabare' OR address='Arjundhara';

-- Using IN operator in psql:
select * from student_details where address IN('Budhabare','Arjundhara'); // This example does the same thing as the OR operator 

-- Using the between operator in psql: 
select * from student_details where 
DOB between '2006-04-01' AND '2008-04-01';

-- Using AND operator in psql:
select * from student_details where age>20 AND address='Arjundhara';

-- Using GROUP BY statement in sql: 

select Address, avg(age)  as age_acc_to_address from student_details 
group by Address;

-- The above query first grouped the details on the basis of Address, and then found the average age of that locaity
-- Another good example would be to find the average salary of employee based on gender , in that case , THis is used 

select * from student_details order by age; -- // Sorts in ascending order 
select * from student_details order by age desc ;  --// Sorts in descending order 


-- ***** Performing some operations using the select statement ***** 
select(10+20) as sum ;
select length('Nepal') as total_length;
select repeat('@',10) as repeated;
select upper('Nepal');
select lower('astROphile');

select current_date;
select extract(day from current_date);      --// returns 7 because today is November 07
select extract(month from current_date);    --// returns 11 because the month is November
select to_char(current_date,'day');         --//returns friday because today is friday 

-- ***** Some of the string functions in psql ***** 
select character_length('nepalsss') as total_length;
select character_length(name) as length_of_name from student_details;

select concat('Anu','pra','sh') as merged;
select concat(name,' ',age) as name_age from student_details;
select reverse(name) from student_details;
select replace('Orange is a vegetable','vegetable','fruit');
select rtrim('     Anuprash  nepal         ');
select length(ltrim('     Anuprash nepal          '));
select ascii('a');




