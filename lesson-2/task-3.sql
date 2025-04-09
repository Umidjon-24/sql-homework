USE lesson2;

CREATE TABLE photos(
	id INT IDENTITY,
	photo VARBINARY(MAX)
);

INSERT INTO photos
SELECT BulkColumn FROM OPENROWSET(
	BULK 'D:\SQL\sql-homework\lesson-2\apple.png', SINGLE_BLOB
) AS img;

SELECT * FROM photos;