DROP DATABASE IF EXISTS library;

CREATE DATABASE library;

USE library;

CREATE TABLE Book(
	book_id INT IDENTITY PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	author VARCHAR(50) NOT NULL,
	published_year INT
);

CREATE TABLE Member(
	member_id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20)
);

CREATE TABLE Loan(
	loan_id INT IDENTITY PRIMARY KEY, 
	book_id INT NOT NULL,
	member_id INT NOT NULL,
	loan_date DATE NOT NULL,
	return_date DATE

	CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES Member(member_id)
);


INSERT INTO Book (title, author, published_year)
VALUES
	('To Kill a Mockingbird', 'Harper Lee', 1960),
	('The Hobbit', 'J.R.R. Tolkien', 1937),
	('Dune', 'Frank Herbert', 1965);

INSERT INTO Member (name, email, phone_number)
VALUES
('Alice Carter', 'alice@example.com', '111-222-3333'),
('Bob Martin', 'bob@example.com', '444-555-6666'),
('Charlie King', 'charlie@example.com', '777-888-9999');

-- Alice borrows "To Kill a Mockingbird"
INSERT INTO Loan (book_id, member_id, loan_date)
VALUES (1, 1, '2025-04-01');

-- Bob borrows "The Hobbit"
INSERT INTO Loan (book_id, member_id, loan_date)
VALUES (2, 2, '2025-04-02');

-- Charlie borrows "To Kill a Mockingbird" after Alice
INSERT INTO Loan (book_id, member_id, loan_date)
VALUES (1, 3, '2025-04-05');




