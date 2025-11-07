/*
Script: task_3.sql
Lists all tables in the current database.
The database name should be provided as an argument to the mysql client when running this script.
Example usage:
  mysql -u <user> -p -D alx_book_store < task_3.sql
  OR
  mysql -u <user> -p alx_book_store < task_3.sql
*/

-- Show all tables in the currently selected database
SHOW TABLES;

-- One-line SELECT that lists table names from INFORMATION_SCHEMA for the current database
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE();
