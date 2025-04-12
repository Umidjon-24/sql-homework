USE lesson2;

CREATE TABLE student(
	classes TINYINT,
	tuition_per_class INT,
	total_tuition AS (classes * tuition_per_class)
);

INSERT INTO student
VALUES (10, 128793), (20, 128793), (5, 125432), (15, 132568);

SELECT * FROM student;