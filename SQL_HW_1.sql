SELECT * FROM students;

SELECT id FROM students;

SELECT name FROM students;

SELECT email FROM students;

SELECT name, email FROM students;

SELECT id, name, email, created_on FROM students;

SELECT * FROM students WHERE password = '12333';

SELECT * FROM students WHERE created_on = '2021-03-26 00:00:00.000';

SELECT * FROM students WHERE name LIKE '%Anna%';

SELECT * FROM students WHERE name LIKE '%8';

SELECT * FROM students WHERE name LIKE '%a%';

SELECT * FROM students WHERE created_on = '2021-07-12 00:00:00';

SELECT * FROM students WHERE created_on = '2021-07-12 00:00:00' AND password = '1m313';

SELECT * FROM students WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%Andrey%';

SELECT * FROM students WHERE created_on = '2021-07-12 00:00:00' AND name LIKE '%8%';

SELECT * FROM students WHERE id = 110;

SELECT * FROM students WHERE id = 153;

SELECT * FROM students WHERE id > 140;

SELECT * FROM students WHERE id < 130;

SELECT * FROM students WHERE id < 127 OR id > 188;

SELECT * FROM students WHERE id <= 137;

SELECT * FROM students WHERE id >= 137;

SELECT * FROM students WHERE id > 180 AND id < 190;

SELECT * FROM students WHERE id BETWEEN 180 AND 190;

SELECT * FROM students WHERE password = '12333' OR password = '1m313' OR password = '123313';

SELECT * FROM students WHERE created_on = '2020-10-03 00:00:00' OR created_on = '2021-05-19 00:00:00' OR created_on = '2021-03-26 00:00:00';

SELECT MIN(id) AS min FROM students;

SELECT MAX(id) AS max FROM students;

SELECT COUNT(id) FROM students;

SELECT id, name, created_on FROM students ORDER BY created_on ASC;

SELECT id, name, created_on FROM students ORDER BY created_on DESC;