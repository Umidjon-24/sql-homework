CREATE DATABASE lesson1;
USE lesson1;

CREATE TABLE student(
	id INT,
	name NVARCHAR(50),
	age INT
)

ALTER TABLE student
ADD CONSTRAINT id_not_null CHECK (id IS NOT NULL);