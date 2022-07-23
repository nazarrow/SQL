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
SELECT * FROM Customers WHERE City = "Berlin";
```
### 2. Use the *NOT* keyword to select all records where `City` is NOT "Berlin".
```sql
SELECT * FROM Customers WHERE NOT City = "Berlin";
```
### 3. Select all records where the `CustomerID` column has the value 32.
```sql
SELECT * FROM Customers WHERE CustomerID = 32;
```
### 4. Select all records where the `City` column has the value 'Berlin' *and* the `PostalCode` column has the value 12209.
```sql
SELECT * FROM Customers WHERE City = 'Berlin' AND PostalCode = 12209;
```
### 5. Select all records where the `City` column has the value 'Berlin' or 'London'.
```sql
SELECT * FROM Customers WHERE City = 'Berlin' OR City = 'LONDON';
```
## _SQL ORDER BY_
1. Select all records from the `Customers` table, sort the result alphabetically by the column `City`.
```sql
SELECT * FROM Customers ORDER BY City;
```
2. Select all records from the `Customers` table, sort the result *reversed* alphabetically by the column `City`.
```sql
SELECT * FROM Customers ORDER BY City DESC;
```
3. Select all records from the `Customers` table, sort the result alphabetically, first by the column `Country`, then, by the column `City`.
```sql
SELECT * FROM Customers ORDER BY Country, City;
```
## _SQL INSERT_
### 1. Insert a new record in the `Customers` table.
```sql
INSERT INTO Customers (CustomerName, Address, City, PostalCode, Country)
VALUES ('Hekkan Burger', 'Gateveien 15', 'Sandnes', '4306', 'Norway');
```
## _SQL NULL_
### 1. Select all records from the `Customers` where the `PostalCode` column is empty.
```sql
SELECT * FROM Customers WHERE PostalCode IS NULL;
```
### 2. Select all records from the `Customers` where the `PostalCode` column is NOT empty.
```sql
SELECT * FROM Customers WHERE PostalCode IS NOT NULL;
```
