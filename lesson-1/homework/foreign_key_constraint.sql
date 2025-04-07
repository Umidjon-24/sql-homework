USE lesson1;

CREATE TABLE category(
	category_id INT PRIMARY KEY,
	category_name NVARCHAR(100)
)

CREATE TABLE item(
	item_id INT PRIMARY KEY,
	item_name NVARCHAR(100),
	category_id INT FOREIGN KEY REFERENCES category(category_id)
)

SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('item');

ALTER TABLE item
DROP CONSTRAINT [FK__item__category_i__4316F928]

ALTER TABLE item
ADD CONSTRAINT fk_item_category_id 
FOREIGN KEY (category_id) REFERENCES category(category_id); 
