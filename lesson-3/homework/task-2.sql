USE lesson3;

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' and '2023-12-31';

SELECT *,
	CASE
		WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
	END AS OrderStatus
FROM Orders;

SELECT Status, SUM(TotalAmount) as TotalRevenue, COUNT(OrderID) as TotalNumber
FROM Orders 
GROUP BY Status
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC;


