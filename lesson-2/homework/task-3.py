import pyodbc

con_str = "DRIVER={SQL SERVER};SERVER=DESKTOP-EQ1S466;DATABASE=lesson2;Trusted_Connection=yes;"
con = pyodbc.connect(con_str)

cursor = con.cursor()

cursor.execute(
    """
    SELECT * FROM photos;
"""
)

row = cursor.fetchone()
id, img_data = row

with open('apple1.png', 'wb') as file:
    file.write(row)