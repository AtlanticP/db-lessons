--DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;

-- table department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
  departmentID serial NOT NULL PRIMARY KEY,  -- serial -> auto increment
  name varchar(30)
);

INSERT INTO department (departmentID, name) 
VALUES
  (1, 'Dep_analit'),
  (2, 'Dep_prog'),
  (3, 'Dep_admin');

-- table employee
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  employeeID serial NOT NULL PRIMARY KEY,
  name varchar(80),
  job varchar(30), 
  departmentID int NOT NULL, 
  CONSTRAINT "DEP" 
    FOREIGN KEY (departmentID) 
    REFERENCES department(departmentID)
);

INSERT INTO employee (employeeID, name, job, departmentID)
VALUES 
  (100, 'Smit N', 'Programmer', 2),
  (101, 'Stone J.', 'manager', 3),
  (102, 'Asser M.', 'analitic', 1),
  (103, 'Wood N.', 'Programmer', 2),
  (104, 'Thomson L.', 'Programmer', 2);
  
-- table employee1
DROP TABLE IF EXISTS employee1;
 CREATE TABLE employee1 AS (
    SELECT * FROM employee
 );
 
ALTER TABLE employee1 
    ADD CONSTRAINT "DEP" 
    FOREIGN KEY (departmentID) 
    REFERENCES department(departmentID);
 
INSERT INTO employee (name, job, departmentID)
VALUES 
  ('Wirt C', 'Programmer', 5);

INSERT INTO department 
VALUES 
  (10, 'Test DELETE');

INSERT INTO employee (name, job, departmentID)
VALUES 
  ('Wirt C', 'Programmer', 10);


SELECT * FROM department;
SELECT * FROM employee;

DELETE FROM employee 
	WHERE employeeid = 2;
DELETE FROM department 
	WHERE departmentid = 10;

-- добавление атрибутов age, salary, perks к таблице employee
ALTER TABLE employee 
	ADD COLUMN Age int,
	ADD COLUMN Salary int,
	ADD COLUMN perks int;

-- заполнить столбцы случайными значениями 8(b)
UPDATE employee 
	SET 
		Salary = ROUND((20+RANDOM()*30)::int)*1000,
		Age = ROUND(20 + RANDOM()*25)::int,
		perks = ROUND(1+ RANDOM()*4)*1000::int;
		

SELECT age, Salary, perks FROM employee;
SELECT * FROM employee;

SELECT ROUND((1+RANDOM()*4)::int, 2)*1000;

-- table employeeSkills
CREATE TABLE employeeSkils (
	employeeID int REFERENCES employee(employeeID),
	skill varchar(15),
	PRIMARY KEY (employeeID, skill)
);

CREATE TABLE client (
	clientID serial PRIMARY KEY,
	"name" varchar(40),
	address varchar(100),
	contactPerson varchar(80),
	contactNumber varchar(80)
);

CREATE TABLE "assignment" (
	clientID int REFERENCES client(clientID),
	employeeID int REFERENCES employee(employeeID),
	workdate date,
	hours float
);

INSERT INTO emp 












