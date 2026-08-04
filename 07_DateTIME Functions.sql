SELECT * from products;

-- 1. NOW() - Get current Date and Time
SELECT NOW() as current_datetime;

-- 2. Current_Date() - Get current DATE
SELECT CURRENT_DATE as today_Date;
SELECT (CURRENT_DATE-added_date) as days_difference
from products;

-- 3. EXTRACT() - Extract parts of a Date
-- Extract the year, month and day from the added_date column
SELECT product_name, EXTRACT(YEAR FROM added_date) as YEAR_added, EXTRACT(MONTH FROM added_date) as month_added, EXTRACT(DAY FROM added_Date) as day_added
from products;
-- It returns in numeric

-- 4. AGE() - calculate age between dates
-- calculate the time difference between added_date and today's date
SELECT product_name,added_date,
CURRENT_Date as Current_date,
AGE(CURRENT_DATE,added_date) as age_since_added
from products;

-- usine age I got 2year 16 month 19 days 

-- 5. TO_CHAR() - format Dates as strings
-- format added_date in a custom format (DD-MMM-YYYY)

SELECT product_name,
TO_CHAR(added_date,'DD-Mon-YYYY') as Age_Since_added
from products;

-- 6. DATE_PART() - GET specific Date Part
-- Extract the day of the week from added_date
SELECT product_name,
added_date, DATE_PART('dow',added_date) as day_of_week
from products;

SELECT product_name,
added_date, DATE_PART('month',added_date) as day_of_week
from products;
-- It returns in numeric values

-- 7. DATE_TRUNC() - Truncate Date to precision
-- Truncate added_date to the start of the month 
SELECT product_name,added_date,
DATE_TRUNC('month',added_date) as start_of_month
From products;

 -- 8. INTERVAL - Add or subtract Time intervals
 -- Add 6 months to the added_date

 SELECT product_name,added_Date,
 added_Date+INTERVAL '6 days' as new_Date
 from products;

 -- 9. CURRENT_TIME() - Get curren time
 -- retrieve only the current time
 
 SELECT CURRENT_TIME as current_time;

 -- 10. TO_DATE() - convert string to date
 -- convert a string to a date format
 SELECT TO_DATE('28-11-2024','DD-MM-YYYY')  as text_to_date;
 



