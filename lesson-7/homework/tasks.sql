CREATE DATABASE lesson7;

USE lesson7;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);


INSERT INTO Customers VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Orders VALUES 
(101, 1, '2024-01-01'), (102, 1, '2024-02-15'),
(103, 2, '2024-03-10'), (104, 2, '2024-04-20');

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 2, 10.00), (2, 101, 2, 1, 20.00),
(3, 102, 1, 3, 10.00), (4, 103, 3, 5, 15.00),
(5, 104, 1, 1, 10.00), (6, 104, 2, 2, 20.00);

INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics'), 
(2, 'Mouse', 'Electronics'),
(3, 'Book', 'Stationery');

-- =================================================
-- 1️ Retrieve All Customers With Their Orders (Include Customers Without Orders)
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o
	ON c.CustomerID = o.CustomerID

-- 2️ Find Customers Who Have Never Placed an Order
SELECT c.CustomerName
FROM Customers AS c
LEFT JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY CustomerName
HAVING COUNT(OrderID) = 0

-- 3️ List All Orders With Their Products
SELECT *
FROM OrderDetails AS od
JOIN Products AS p
	ON od.ProductID = p.ProductID

-- 4️ Find Customers With More Than One Order
SELECT c.CustomerName
FROM Customers AS c
LEFT JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY CustomerName
HAVING COUNT(CustomerName) > 1

-- 5️ Find the Most Expensive Product in Each Order
SELECT od.OrderID, MAX(Price) AS MaxPrice
FROM OrderDetails AS od
JOIN Products AS p
	ON od.ProductID = p.ProductID
GROUP BY od.OrderID

-- 6️ Find the Latest Order for Each Customer
SELECT c.CustomerName, MAX(o.OrderDate)
FROM Customers AS c
JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
GROUP BY CustomerName

-- 7️ Find Customers Who Ordered Only 'Electronics' Products
SELECT CustomerName
FROM Customers AS c
JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od
	ON o.OrderID = od.OrderID
JOIN Products AS p
	ON od.ProductID = p.ProductID
GROUP BY CustomerName
HAVING COUNT(DISTINCT Category) = 1


-- 8️ Find Customers Who Ordered at Least One 'Stationery' Product
SELECT CustomerName
FROM Customers AS c
JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od
	ON o.OrderID = od.OrderID
JOIN Products AS p
	ON od.ProductID = p.ProductID
WHERE Category = 'Stationery'
GROUP BY CustomerName


-- 9️ Find Total Amount Spent by Each Customer
SELECT CustomerName, SUM(Price * Quantity)
FROM Customers AS c
JOIN Orders AS o
	ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od
	ON o.OrderID = od.OrderID
JOIN Products AS p
	ON od.ProductID = p.ProductID
GROUP BY CustomerName


