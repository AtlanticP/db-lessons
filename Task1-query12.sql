-- Task1 query 1.12

SELECT * FROM employee;
UPDATE employee 
SET Job='programmer'
WHERE Job='Programmer'; 

SELECT Job,salary,perks 
FROM employee 
WHERE Job='programmer' OR Job='analitic';


UPDATE employee 
SET 
	salary = salary*1.1,
	perks = perks * 1.05
WHERE
	job = 'programmer';

UPDATE employee 
SET 
	salary = salary*1.15,
	perks = perks*0.8
WHERE 
	job = 'analitic';

SELECT 
	job, salary, perks, salary + perks AS "sum"
FROM employee;