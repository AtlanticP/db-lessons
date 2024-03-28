-- Task 2/13
SELECT AVG(Age) AS avg_age FROM employee;
SELECT ROUND(AVG(Salary), 2) AS avg_salary FROM employee;

-- Task 3/14
SELECT 
	d.name,
	ROUND(AVG(e.Salary), 2) as avg_salary
FROM employee as e
	JOIN department as d USING(departmentID)
GROUP BY d.name;

--Task 4/16
SELECT SUM(Age) FROM employee;

--Task 5/17
SELECT 
	SUM(Salary) as "sum of sallary",
	AVG(Age) as "avg of age"
FROM employee
WHERE job = 'Programmer'


	
