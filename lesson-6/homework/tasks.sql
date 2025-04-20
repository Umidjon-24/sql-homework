USE lesson6;
DROP TABLE IF EXISTS Departments
CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY NOT NULL,
	Name VARCHAR(10),
	DepartmentID INT,
	Salary INT,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
);

CREATE TABLE Projects(
	ProjectID INT PRIMARY KEY,
	ProjectName VARCHAR(50),
	EmployeeID INT, 
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
)

INSERT INTO Employees
VALUES (1,	'Alice',101,60000),
(2,'Bob',102,70000),
(3,'Charlie',101,65000),
(4,'David',103,72000),
(5,'Eva',NULL,68000)

INSERT INTO Departments
VALUES (101,'IT'),
(102,'HR'),
(103, 'Finance'),
(104,'Marketing')

INSERT INTO Projects
VALUES (1,'Alpha',1),
(2,'Beta',2),
(3,'Gamma',1),
(4,'Delta',4),
(5,'Omega',NULL)

--Questions:
--INNER JOIN
--Write a query to get a list of employees along with their department names.
select
	e.EmployeeID, e.Name, d.DepartmentName
from Employees as e -- left table
inner join Departments as d -- right table
	on e.DepartmentID = d.DepartmentID 


--LEFT JOIN
--Write a query to list all employees, including those who are not assigned to any department.
SELECT
	e.EmployeeID, e.Name, d.DepartmentName
FROM Employees AS e
LEFT JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID 

--RIGHT JOIN
--Write a query to list all departments, including those without employees.
SELECT
	d.DepartmentName, e.Name
FROM Employees AS e
RIGHT JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID 

--FULL OUTER JOIN
--Write a query to retrieve all employees and all departments, even if there’s no match between them.
SELECT
	e.Name, d.DepartmentName 
FROM Employees AS e
FULL OUTER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID 
	

--JOIN with Aggregation
--Write a query to find the total salary expense for each department.
SELECT
	d.DepartmentID, d.DepartmentName, SUM(e.Salary) OVER(PARTITION BY e.DepartmentID)
FROM Employees AS e
RIGHT JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID



SELECT * FROM Employees
SELECT * FROM Departments

--CROSS JOIN
--Write a query to generate all possible combinations of departments and projects.
SELECT 
	*
FROM Employees, Departments


--MULTIPLE JOINS
--Write a query to get a list of employees with their department names and assigned project names. Include employees even if they don’t have a project.
SELECT
	Employees.EmployeeID, Employees.Name, Departments.DepartmentName, Projects.ProjectName
FROM Employees, Departments, Projects