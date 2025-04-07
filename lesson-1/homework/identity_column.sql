USE lesson1;

CREATE TABLE invoice(
	invoice_id INT IDENTITY,
	amount	DECIMAL(10,3)
)

INSERT INTO invoice
VALUES 
	(102.3),
	(100.45),
	(124.5),
	(117.8),
	(145.7);

SET IDENTITY_INSERT invoice ON;

INSERT INTO invoice (invoice_id, amount) VALUES (100, 999.99);

SET IDENTITY_INSERT invoice OFF;

SELECT * FROM invoice;
