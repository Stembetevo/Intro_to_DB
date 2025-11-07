/*
Script: task_4.sql
Prints the full description of the table `books` using INFORMATION_SCHEMA (DO NOT use DESCRIBE or EXPLAIN).
The database name should be provided to the mysql client (for example: mysql -u <user> -p -D alx_book_store < task_4.sql)
*/

-- Select columns to mimic DESCRIBE output: Field, Type, Null, Key, Default, Extra
SELECT
  COLUMN_NAME AS `Field`,
  COLUMN_TYPE AS `Type`,
  IS_NULLABLE AS `Null`,
  CASE
    WHEN COLUMN_KEY = 'PRI' THEN 'PRI'
    WHEN COLUMN_KEY = 'UNI' THEN 'UNI'
    WHEN COLUMN_KEY = 'MUL' THEN 'MUL'
    ELSE ''
  END AS `Key`,
  COLUMN_DEFAULT AS `Default`,
  EXTRA AS `Extra`
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND LOWER(TABLE_NAME) = 'books'
ORDER BY ORDINAL_POSITION;
