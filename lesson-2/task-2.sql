USE lesson2;

CREATE TABLE data_types_demo(
	id SMALLINT IDENTITY,
	price DECIMAL(10,2),
	profit FLOAT,
	title VARCHAR(100),
	description NVARCHAR(MAX),
	production_date DATE,
	production_time TIME,
	expiry_date DATETIME
);

INSERT INTO data_types_demo
VALUES (23.125, 5.615, 'Apple', 'Healthy Fruit', '2025-04-08', '21:30', GETDATE()); 

SELECT * FROM data_types_demo;