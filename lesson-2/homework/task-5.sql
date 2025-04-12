USE lesson2;

CREATE TABLE worker(
	id INT,
	name VARCHAR(50)
);

BULK INSERT worker
FROM 'D:\SQL\sql-homework\lesson-2\worker.csv'
WITH(
	FIELDTERMINATOR=',',
	ROWTERMINATOR='\n',
	FIRSTROW=2
);

SELECT * FROM worker;