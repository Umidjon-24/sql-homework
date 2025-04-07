USE lesson1;

CREATE TABLE product(
	product_id INT UNIQUE,
	product_name NVARCHAR,
	price DECIMAL
)



SELECT name, type_desc
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'
  AND parent_object_id = OBJECT_ID('product');

ALTER TABLE product
DROP CONSTRAINT [UQ__product__47027DF434C3EA2E];

ALTER TABLE product
ADD CONSTRAINT unique_product_id UNIQUE (product_id);

ALTER TABLE product
ADD CONSTRAINT unique_product_id_name UNIQUE (product_id, product_name);

