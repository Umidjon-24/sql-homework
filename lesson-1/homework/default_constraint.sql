USE lesson1;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	name NVARCHAR(50),
	city NVARCHAR(50) NOT NULL DEFAULT 'Unknown'
)

SELECT dc.name AS constraint_name, c.name AS column_name
FROM sys.default_constraints dc
JOIN sys.columns c ON dc.parent_object_id = c.object_id AND dc.parent_column_id = c.column_id
WHERE OBJECT_NAME(dc.parent_object_id) = 'customer';

ALTER TABLE customer
DROP CONSTRAINT [DF__customer__city__4CA06362];

ALTER TABLE customer
ADD CONSTRAINT df_city DEFAULT 'Unknown' FOR city;