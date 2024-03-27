DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;

DROP TABLE IF EXISTS department;
CREATE TABLE department (
	departmentID serial NOT NULL PRIMARY KEY,  -- serial -> auto increment
	name varchar(30)
);

DROP TABLE IF EXISTS employee1;
CREATE TABLE employee (
	employeeID serial NOT NULL PRIMARY KEY,
	name1 varchar(80),
	job varchar(30), 
	departmentID int NOT NULL, 
	FOREIGN KEY (departmentID) REFERENCES department(departmentID)
);

INSERT INTO employee 
VALUES 
	(1, 'Programmer', 70000, 5000),
	(1, 'analitic', 110000, 30000),
	(1, 'Programmer', 74000, 15000),
	(1, 'Programmer', 69000, 20000);
