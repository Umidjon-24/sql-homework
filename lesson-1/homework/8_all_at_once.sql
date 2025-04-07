USE lesson1;

CREATE TABLE books(
	book_id INT PRIMARY KEY IDENTITY,
	title VARCHAR(255) NOT NULL CHECK (LEN(title) > 0),
	price DECIMAL (10,3) CHECK (price > 0),
	genre NVARCHAR(50) NOT NULL DEFAULT 'Unknown'
);

INSERT INTO books
VALUES 
	('The Alchemist', 15.99, 'Fiction'),
    ('Atomic Habits', 18.50, 'Self-help'),
    ('Clean Code', 45.00, 'Programming');

-- Empty title (should fail)
INSERT INTO books (title, price) VALUES ('', 10.00);

-- NULL title (should fail)
INSERT INTO books (title, price) VALUES (NULL, 10.00);

-- Zero price (should fail)
INSERT INTO books (title, price) VALUES ('Free Book', 0);

-- Negative price (should fail)
INSERT INTO books (title, price) VALUES ('Wrong Price Book', -5);
