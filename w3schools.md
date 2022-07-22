[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/3/3e/W3Schools_logo.png)](https://www.w3schools.com/sql/default.asp)

# SQL Tutorial. Exercises
## _SQL SELECT_

### 1. Insert the missing statement to get all the columns from the `Customers` table.
```sql
SELECT * FROM Customers;
```
### 2. Write a statement that will select the `City` column from the `Customers` table.
```sql
SELECT City FROM Customers;
```
### 3. Select all the *different* values from the `Country` column in the `Customers` table.
```sql  
SELECT DISTINCT Country FROM Customers;
```
## _SQL WHERE_
### 1. Select all records where the `City` column has the value "Berlin".
```sql
SELECT * FROM Customers WHERE CITY = "Berlin";
```
