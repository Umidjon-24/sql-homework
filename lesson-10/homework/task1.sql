USE lesson10

WITH Days AS (
	SELECT 1 AS days
	UNION ALL 
	SELECT days + 1 FROM Days
	WHERE days < 40
),
Adjusted AS (
	SELECT 
	D.days As days,
	S.Num,
	ROW_NUMBER() OVER(ORDER BY ISNULL(S.Num, 0)) AS rnk,
	COUNT(*) OVER() AS total
	FROM Shipments S
	LEFT JOIN Days D
		ON D.days = S.N
)

SELECT * FROM Adjusted
 WHERE rnk IN ((total+1) / 2, (total+2) / 2)

