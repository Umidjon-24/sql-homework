USE lesson4;

create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');


-- Putting 'b' to the first row
SELECT * 
FROM letters
ORDER BY 
	CASE letter
		WHEN 'b' THEN 1
		ELSE 2
	END,
letter

-- Putting 'b' to the last row
SELECT * 
FROM letters
ORDER BY 
	CASE letter
		WHEN 'b' THEN 1
		ELSE 0
	END,
letter


-- Putting 'b' to the random position
SELECT * 
FROM letters
ORDER BY 
	CASE letter
		WHEN 'a' THEN 1
		WHEN 'b' THEN 4
		WHEN 'c' THEN 3
		WHEN 'd' THEN 5
		WHEN 'e' THEN 6
		WHEN 'f' THEN 7
		ELSE 100
	END;

