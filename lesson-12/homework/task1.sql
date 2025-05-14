DECLARE @name NVARCHAR(255);
DECLARE @i INT = 1;
DECLARE @count INT;
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @count = COUNT(1)
FROM sys.databases 
WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb');

WHILE @i <= @count
BEGIN
    ;WITH cte AS (
        SELECT name, ROW_NUMBER() OVER(ORDER BY name) AS rn
        FROM sys.databases 
        WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')
    )
    SELECT @name = name 
    FROM cte
    WHERE rn = @i;

    SET @sql = @sql + 
        CASE WHEN @sql = '' THEN '' ELSE ' UNION ALL ' END +
        'SELECT ''' + QUOTENAME(@name) + ''' AS DatabaseName, 
                s.name AS SchemaName, 
                t.name AS TableName, 
                c.name AS ColumnName, 
                ty.name AS DataType 
         FROM ' + QUOTENAME(@name) + '.sys.schemas AS s
         JOIN ' + QUOTENAME(@name) + '.sys.tables AS t ON s.schema_id = t.schema_id
         JOIN ' + QUOTENAME(@name) + '.sys.columns AS c ON t.object_id = c.object_id
         JOIN ' + QUOTENAME(@name) + '.sys.types AS ty ON c.user_type_id = ty.user_type_id';

    SET @i = @i + 1;
END

EXEC sp_executesql @sql;
