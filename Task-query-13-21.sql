-- Task 2/13
SELECT AVG(Age)::int AS avg_age FROM employee;
SELECT AVG(Salary) AS avg_salary FROM employee;

-- Task 3/14
SELECT 
	d.name,
	ROUND(SUM(e.Salary), 2) as sum_salary
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

-- 16. Вывести сумму всех возрастов сотрудников, работающих в компании.
SELECT SUM(Age) FROM employee e;

-- 17. Вычислите сумму зарплат и средний возраст сотрудников, которые занимают должность "программист".
SELECT 
	AVG(Age)::int as "avg age",
	SUM(Salary) "sum salary"
FROM employee e
WHERE 
	job = 'programmer';
	
-- 18. Что делает следующий оператор?
SELECT 
	ROUND((SUM(perks)::numeric/SUM(salary)::numeric), 2)*100 as percents 
FROM employee e 

-- 19. Подсчитайте количество сотрудников в группах одного возраста.
SELECT age, COUNT(*) FROM employee e 
GROUP BY age

WITH t AS (
	SELECT 
		CASE 
			WHEN Age BETWEEN 20 AND 30
				THEN '20-30'
			WHEN Age BETWEEN 31 AND 40
				THEN '31-40'
			WHEN Age BETWEEN 41 AND 50
				THEN '41-50'
		END "age range" 
	FROM employee e 
)
SELECT "age range", COUNT(*) FROM t
GROUP BY "age range"

-- 20. Найдите средний возраст сотрудников в различных подразделениях (должностях).
