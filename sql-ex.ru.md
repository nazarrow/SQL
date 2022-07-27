[![N|Solid](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUEqQLS3O85FLB-K8jA0f2K8p7fWGUrzq1qQ&usqp=CAU)](https://sql-ex.ru/)

# SQL-ex.ru Exercises

## **[Схема базы данных](https://sql-ex.ru/help/select13.php#db_1)**

Схема БД состоит из четырех таблиц:
*Product(maker, model, type)*
*PC(code, model, speed, ram, hd, cd, price)*
*Laptop(code, model, speed, ram, hd, price, screen)*
*Printer(code, model, color, type, price)*
Таблица *Product* представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице *Product* уникальны для всех производителей и типов продуктов. В таблице *PC* для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице *Product*), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица *Laptop* аналогична таблице *РС* за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице *Printer* для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

### Задание 1: Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd 
```sql
select model, speed, hd FROM PC where price < 500;
```
### Задание 2: Найдите производителей принтеров. Вывести: maker
```sql
SELECT DISTINCT maker FROM Product WHERE type = 'printer';
```
### Задание 3: Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
```sql
SELECT model, ram, screen FROM Laptop WHERE price > 1000;
```
### Задание 4: Найдите все записи таблицы Printer для цветных принтеров.
```sql
SELECT * FROM Printer WHERE color='y';
```
### Задание 5: Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
```sql
SELECT model, speed, hd FROM PC WHERE cd = '12x' AND price < 600 OR cd = '24x' AND price < 600;
```
### Задание 6: Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
```sql
SELECT DISTINCT maker, speed FROM Laptop JOIN Product ON Laptop.model = Product.model WHERE hd>=10;
```
### Задание 7: Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
```sql
SELECT PC.model, PC.price FROM PC JOIN Product ON PC.model = Product.model WHERE Product.maker = 'B';
UNION
SELECT Laptop.model, Laptop.price FROM Laptop JOIN Product ON Laptop.model = Product.model WHERE Product.maker = 'B';
UNION
SELECT Printer.model, Printer.price FROM Printer JOIN Product ON Printer.model = Product.model WHERE Product.maker = 'B';
```
### Задание 8: Найдите производителя, выпускающего ПК, но не ПК-блокноты.
```sql
SELECT maker FROM Product WHERE type = 'PC' AND maker NOT IN (SELECT maker FROM Product WHERE type = 'Laptop') GROUP BY maker;
```
### Задание 9: Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
```sql
SELECT DISTINCT maker FROM Product RIGHT JOIN PC ON Product.model = PC.model WHERE PC.speed >= 450;
```