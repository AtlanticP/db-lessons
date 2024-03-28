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

INSERT INTO employeeskils 
VALUES
	(101, 'Basic'),
	(102, 'Python'),
	(103, 'SQL'),
	(104, 'C++'),
	(100, 'Pascal'),
	(104, 'Delphi');

SELECT * FROM employeeskils;

INSERT INTO client (clientID, "name", address, contactperson, contactnumber)
VALUES 
	(1100, 'ACER', 'M.12.st.', 'Nora', '112233445566'),
	(1101, 'MTS', 'S.P.11.st.', 'Lena', '665544332211'),
	(1102, 'Dog', 'N.N.13 st.', 'Ivan', '123456123456'),
	(1103, 'Cat', 'K.14 st.', 'Petr', '654321654321');
SELECT * FROM client;

INSERT INTO "assignment" (clientID, employeeID, workdate, hours)
VALUES 
	(1100, 100, '2009-01-10', 120),
	(1101, 101, '2008-11-01', 10),
	(1102, 102, '2009-12-01', 70),
	(1103, 102, '2009-02-01', 100);
SELECT * FROM "assignment";

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
		

INSERT INTO employee 
VALUES 
	(105, 'Fedor K.', 'syst. Programmer', 2, 46, 49000, 3000),
	(106, 'Maria T.', 'admin. Programmer', 2, 37, 44000, 2000)
	;

SELECT * FROM employee;





