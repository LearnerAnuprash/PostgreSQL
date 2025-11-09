CREATE TABLE cricket(
	cricket_id serial primary key,
	name varchar(30)
);

CREATE TABLE football(
	football_id serial primary key,
	name varchar(30)
);

INSERT INTO cricket(name)
VALUES ('Stuart'),('Michael'),('Johnson'),('Hayden'),('Fleming');

INSERT INTO football(name)
VALUES ('Stuart'),('Johnson'),('Hayden'),('Langer'),('Astle');

SELECT * 
FROM cricket AS c
INNER JOIN football AS f
ON c.name = f.name;

SELECT c.cricket_id, c.name, f.football_id, f.name 
FROM cricket AS c
INNER JOIN football AS f
ON c.name = f.name;
