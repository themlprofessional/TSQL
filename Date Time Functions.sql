-- 1. GETDATE(): Returns the current date and time.
SELECT GETDATE();

-- 2. DATEDIFF(): Returns the difference between two dates in days, months, or years.
SELECT DATEDIFF(year, '2001-06-17', GETDATE()); 
SELECT DATEDIFF(month, '2001-06-17', '2023-04-22');
SELECT DATEDIFF(day, '2001-06-17', '2023-04-22');

-- 3. DATEADD(): Adds or Subtracts a specified time interval from a date
SELECT DATEADD(day, 7, '2023-06-17')
SELECT DATEADD(day, -7, '2023-06-17')

-- 4. DATEPART(): Returns a single part of a date like year, month, day, hour, etc.
SELECT DATEPART(month, '2021-04-15');
SELECT DATEPART(year, '2021-04-15');
SELECT DATEPART(day, '2021-04-15');

-- 5. CONVERT(): Converts a date from one format to another.
SELECT CONVERT(varchar, GETDATE(), 23);
SELECT ISDATE('2021-04-15');
SELECT ISDATE('hello');

-- 6. ISDATE(): Checks if a string contains a valid date. Returns 1 if true, 0 if false.
SELECT ISDATE('2021-04-15');
SELECT ISDATE('hello');

-- 7. DATENAME(): Returns a string representing the name of the month, day or week based on a date.
SELECT DATENAME(month, '2021-04-15');

-- 8. DAY(), MONTH(), YEAR()
SELECT DAY('2023-06-17');
SELECT MONTH('2023-06-17');
SELECT YEAR('2023-06-17');
