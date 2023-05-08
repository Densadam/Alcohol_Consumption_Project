import csv
import sqlite3

# Open the CSV file for reading
with open('data.csv', 'r') as csvfile:
    # Create a DictReader
    reader = csv.DictReader(csvfile)

    # Extract the header row
    headers = reader.fieldnames

    # Connect to the SQLite database
    conn = sqlite3.connect('data.db')

    # Create a table with the same columns as the CSV file
    create_table_sql = f'CREATE TABLE data ({", ".join(headers)});'
    conn.execute(create_table_sql)

    # Insert the data into the table
    for row in reader:
        values = [row[h] for h in headers]
        insert_row_sql = f'INSERT INTO data VALUES ({", ".join(["?" for _ in headers])});'
        conn.execute(insert_row_sql, values)

    # Commit the changes and close the connection
    conn.commit()
    conn.close()

# Connect to the SQLite database file
conn = sqlite3.connect('data.db')

# Create a cursor object
cur = conn.cursor()

# Execute a SELECT statement to retrieve data from a table
cur.execute('SELECT * FROM data')

# Fetch all rows of the result set
rows = cur.fetchall()

# Print the rows
for row in rows:
    print(row)

# Close the cursor and connection
cur.close()
conn.close()
