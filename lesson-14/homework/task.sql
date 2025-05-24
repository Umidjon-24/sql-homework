declare @tr varchar(max);

;with cte as (
	SELECT 
    t.name AS table_name,
    i.name AS index_name,
    i.type_desc AS index_type,
    c.name AS column_name,
    ty.name AS column_type
FROM 
    sys.indexes i
JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
JOIN 
    sys.tables t ON i.object_id = t.object_id
JOIN 
    sys.types ty ON c.user_type_id = ty.user_type_id
WHERE 
    i.type > 0 

)
select @tr=cast (
	(select 
		table_name as td, '',
		index_name as td, '',
		index_type as td, '',
		column_name as td, '',
		column_type as td
	from cte
	for xml path('tr'))
	as varchar(max)
);


declare @html_body varchar(max) = '
		<style>
			#customers {
			  font-family: Arial, Helvetica, sans-serif;
			  border-collapse: collapse;
			  width: 100%;
			}

			#customers td, #customers th {
			  border: 1px solid #ddd;
			  padding: 8px;
			}

			#customers tr:nth-child(even){background-color: #f2f2f2;}

			#customers tr:hover {background-color: #ddd;}

			#customers th {
			  padding-top: 12px;
			  padding-bottom: 12px;
			  text-align: left;
			  background-color: #04AA6D;
			  color: white;
			}
			</style>
			</head>
			<body>

			<h1>Table about indexes</h1>

			<table id="customers">
			  <tr>
				<th>table_name</th>
				<th>index_name</th>
				<th>index_type</th>
				<th>column_name</th>
				<th>column_type</th>
			  </tr>
			  ' +@tr +
			  '
			</table>

			</body>
'

exec msdb.dbo.sp_send_dbmail
	@profile_name = 'GmailProfile',
	@recipients = 'umidjonxusanov.business@gmail.com',
	@subject = 'This is test from sql server',
	@body = @html_body,
	@body_format = 'HTML'
