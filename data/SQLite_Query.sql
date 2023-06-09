-- Searches all files in the table
SELECT * FROM "data_copy";

-- Creates a copy of the data and names it 'data_copy'
CREATE TABLE data_copy AS  
SELECT ParentLocation AS Region, 
Location AS Country, 
Period AS Year, 
Dim1 AS Gender, 
FactValueNumeric AS ConsumptionValue, 
FactValueNumericLow AS ConsumptionValueLow,  
FactValueNumericHigh AS ConsumptionValueHigh 
FROM data;

-- Corrects the names of the countries with the corupted names
UPDATE data_copy 
SET Country = 'Côte d’Ivoire' 
WHERE Country = 'CÃ´te dâ€™Ivoire';

UPDATE data_copy 
SET Country = 'Türkiye' 
WHERE Country = 'TÃ¼rkiye';

-- Checks if there's any Null data values in the table
SELECT COUNT(*) AS num_null, Region, 
Country, Year, Gender, ConsumptionValue, 
ConsumptionValueLow, ConsumptionValueHigh
FROM data_copy
WHERE Region IS NULL OR 
Country IS NULL OR
Year IS NULL OR
Gender IS NULL OR 
ConsumptionValue IS NULL OR 
ConsumptionValueLow IS NULL OR 
ConsumptionValueHigh IS NULL;

-- Changes the value of the selected row to 'Null'
UPDATE data_copy SET Country = NULL WHERE rowid = 2;

-- Changes the value of the selected row to 'Bangladesh'
UPDATE data_copy
SET Country = 'Bangladesh' 
WHERE rowid = 2;

-- Counts and displays any duplicate rows
SELECT COUNT(*) AS num_duplicates, Region, 
Country, Year, Gender, ConsumptionValue, 
ConsumptionValueLow, ConsumptionValueHigh
FROM data_copy
GROUP BY Region, Country, Year, Gender, ConsumptionValue, ConsumptionValueLow, ConsumptionValueHigh
HAVING COUNT(*) > 1;

-- Makes a duplicate copy of the selected row
INSERT INTO data_copy (Region, Country, Year, Gender, ConsumptionValue, ConsumptionValueLow, ConsumptionValueHigh)
SELECT Region, Country, Year, Gender, ConsumptionValue, ConsumptionValueLow, ConsumptionValueHigh
FROM data_copy
WHERE rowid = 2;

-- Searches and delets any duplicate rows
DELETE FROM data_copy
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM data_copy
    GROUP BY Region, Country, Year, Gender, ConsumptionValue, ConsumptionValueLow, ConsumptionValueHigh
);

