-- Task1 query 1.12

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (id int, job text, salary int, perks int);

INSERT INTO employee 
VALUES 
	(1, 'Programmer', 70000, 5000),
	(1, 'analitic', 110000, 30000),
	(1, 'Programmer', 74000, 15000),
	(1, 'Programmer', 69000, 20000);

UPDATE employee 
SET 
	salary = salary*1.1,
	perks = perks * 1.05
WHERE
	job = 'Programmer';

UPDATE employee 
SET 
	salary = salary*1.15,
	perks = perks*0.8
WHERE 
	job = 'analitic';

SELECT 
	job, salary, perks, salary + perks AS "sum"
FROM employee;