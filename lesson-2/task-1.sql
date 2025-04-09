CREATE DATABASE lesson2;

USE lesson2;

CREATE TABLE test_identity(
	id INT IDENTITY(1,1),
	number TINYINT
);

INSERT INTO test_identity
VALUES (10),(20),(30),(40),(50);

SELECT * FROM test_identity;

DELETE FROM test_identity;

SELECT * FROM test_identity;

INSERT INTO test_identity
VALUES (10),(20),(30),(40),(50);

SELECT * FROM test_identity;
-- When we use DELETE FROM, it deleted the values inside of the table but it did not set id to beginning (1). If I insert again, it startes from where it stops.

TRUNCATE TABLE test_identity;

SELECT * FROM test_identity;

INSERT INTO test_identity
VALUES (10),(20),(30),(40),(50);

SELECT * FROM test_identity;
-- When we use TRUNCATE, it deleted the values inside of the table and also it sets id to beginning (1). If I insert again, it startes from 1 again.

DROP TABLE test_identity;
-- When we use DROP, it deleted the table, not only values. 

