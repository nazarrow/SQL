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
### Задание 10: Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
```sql
SELECT model, price FROM Printer WHERE price = (SELECT MAX(price) FROM Printer);
```
### Задание 11: Найдите среднюю скорость ПК.
```sql
SELECT AVG (speed) FROM PC;
```
### Задание 12: Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
```sql
SELECT AVG (speed) FROM Laptop WHERE price > 1000;
```
### Задание 13: Найдите среднюю скорость ПК, выпущенных производителем A.
```sql
SELECT AVG (speed) FROM PC WHERE model IN (SELECT model FROM Product WHERE maker = 'A');
```
### Задание 15: Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
```sql
SELECT hd FROM PC GROUP BY hd HAVING COUNT(model) >= 2;
```
### Задание 16: Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
```sql
SELECT DISTINCT A.model, B.model, A.speed, A.ram FROM PC A, PC B WHERE A.speed = B.speed AND A.ram = B.ram AND A.model > B.model;
```
### Задание 17: Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
```sql
SELECT DISTINCT type, Laptop.model, speed FROM Laptop JOIN Product ON Laptop.model = Product.model WHERE speed < (SELECT MIN (speed) FROM PC);
```
### Задание 18: Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
```sql
SELECT DISTINCT maker, price FROM Product JOIN Printer ON Product.model = Printer.model WHERE color = 'y' AND price = (SELECT MIN (price) FROM Printer WHERE color = 'y');
```
### Задание 19: Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
```sql
SELECT DISTINCT maker, AVG (screen) AS screen_1 FROM Product JOIN Laptop ON Product.model = Laptop.model GROUP BY maker;
```
### Задание 20: Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
```sql
SELECT DISTINCT maker, COUNT (model) AS model_1 FROM Product WHERE type = 'PC' GROUP BY maker HAVING COUNT (model) >= 3;
```
