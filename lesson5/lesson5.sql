/*Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если 
товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/
CREATE DATABASE lesson5;

CREATE TABLE users(
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name varchar(150) NOT NULL,
	last_name varchar(150) NOT NULL,
	email varchar(150) NOT NULL UNIQUE,
	phone char(11) NOT NULL,
	password_hash char(65) DEFAULT NULL,
	created_at datetime NOT NULL DEFAULT current_timestamp,
	updated_at datetime NOT NULL DEFAULT current_timestamp,
	INDEX (phone),
	INDEX (email)
);

SELECT * FROM users;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

UPDATE users SET created_at = now(), updated_at = now();

-- Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое 
-- время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

DROP TABLE users;
-- создадим новую таблицу со значением столбцов в формате VARCHAR и заполним данными
CREATE TABLE users(
	id bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name varchar(150) NOT NULL,
	last_name varchar(150) NOT NULL,
	email varchar(150) NOT NULL UNIQUE,
	phone char(11) NOT NULL,
	password_hash char(65) DEFAULT NULL,
	created_at varchar(150) NOT NULL,
	updated_at varchar(150) NOT NULL,
	INDEX (phone),
	INDEX (email)
);

-- добавим в таблицу новые два столбца в формате DATETIME
ALTER TABLE users ADD created_at_dt DATETIME;
ALTER TABLE users ADD updated_at_dt DATETIME;
-- заполним значения новых столбцов, преобразовав значения из столбцов формата VARCHAR
UPDATE users 
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
	updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
-- удалим старые столбцы и переименуем новые столбцы
ALTER TABLE users
	DROP created_at, DROP updated_at,
	RENAME COLUMN created_at_dt TO created_at,
	RENAME COLUMN updated_at_dt TO updated_at;

/*В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если 
товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id SERIAL PRIMARY KEY,
	storehouse_id INT UNSIGNED,
	value int UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	);
	
SELECT * FROM storehouses_products 
ORDER BY CASE WHEN value = 0 THEN 2147483647 ELSE value END;


-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
-- Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT
 name, birthday_at, 
CASE 
WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'may'
 WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'august'
 END AS mounth
FROM
 users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;
 
-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса:
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN (5, 1, 2);

-- Практическое задание теме “Агрегация данных”
-- 1. Подсчитайте средний возраст пользователей в таблице users.
SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AS AVG_Age FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day_of_birthday_in_this_Year
ORDER BY
	amount_of_birthday DESC;

-- *** 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы. ***
CREATE TABLE integers(
    value SERIAL PRIMARY KEY
);

INSERT INTO integers VALUES
    (NULL),
    (NULL),
    (NULL),
    (NULL),
    (NULL),
    (NULL);

-- решение ex_03
SELECT ROUND(exp(SUM(log(value))), 0) AS factorial FROM integers;

