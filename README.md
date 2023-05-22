# CSVtoSQLite

This script will convert a CSV file named "data.csv" and convert it into a .DB file named "data.db" which can be easily opened using SQLite. 

1. Simply save the CSV file in the same folder where the SQLite_Converter.py file is located. (If needed, change the CSV file to data.csv.)
2. Then run the Python script (I used VS Code to execute the python script)

If it completed the conversion successfully, it will print out the content of the CSV file. 
If you get an error like "duplicate column name", it's likely because the column names have spaces in them. 
Delete any spaces in the column names using a simple text editor like Notepad to delete all the spaces in the column names. 

The case study I wrote this for can be found on my website here: https://adensley.wixsite.com/portfolio/alcohol-consumption-study
