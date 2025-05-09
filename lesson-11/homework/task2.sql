USE lesson11;

CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB1 VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB2 VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);


DECLARE @MissingOrders TABLE (
	OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
)

INSERT INTO @MissingOrders
SELECT db1.OrderID, db1.CustomerName, db1.Product, db1.Quantity
FROM Orders_DB1 AS db1
LEFT OUTER JOIN Orders_DB2 AS db2
	ON db1.OrderID=db2.OrderID
WHERE db2.OrderID is NULL

SELECT * FROM @MissingOrders