USE lesson3;

SELECT DISTINCT Category
FROM Products
GROUP BY Category

SELECT Category, MAX(Price) AS MaxPrice
FROM Products
--WHERE Category = 'Furniture'
GROUP BY Category;

SELECT *,
	IIF (Stock = 0, 'Out of Stock', IIF (Stock >= 1 AND Stock <= 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM Products
ORDER BY Price DESC
OFFSET 5 ROWS


SELECT *
FROM Products