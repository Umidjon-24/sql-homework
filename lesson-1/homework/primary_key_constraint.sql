USE lesson1;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	customer_name NVARCHAR(50),
	order_date DATE
)



SELECT name
FROM sys.key_constraints
WHERE type = 'PK' AND parent_object_id = OBJECT_ID('orders');

ALTER TABLE orders
DROP CONSTRAINT [PK__orders__465962292DE9AFF4];

ALTER TABLE orders
ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);

