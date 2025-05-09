USE lesson11;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary)
VALUES
    (1, 'Alice', 'HR', 5000),
    (2, 'Bob', 'IT', 7000),
    (3, 'Charlie', 'Sales', 6000),
    (4, 'David', 'HR', 5500),
    (5, 'Emma', 'IT', 7200);

CREATE TABLE #EmployeeTransfers(
	EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
)

INSERT INTO #EmployeeTransfers
SELECT EmployeeID, Name,
	CASE 
		WHEN Department='HR' THEN 'IT'
		WHEN Department='IT' THEN 'Sales'
		WHEN Department='Sales' THEN 'HR'
		ELSE Department
	END AS Department,
	Salary
FROM Employees

SELECT * FROM #EmployeeTransfers



