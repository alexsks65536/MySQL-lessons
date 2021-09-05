/*
 * 1. Составьте список пользователей users, 
 * которые осуществили хотя бы один заказ orders в интернет магазине.
 */ 

SELECT id, name FROM users WHERE id IN (SELECT user_id FROM orders);

/*
 * 2. Выведите список товаров products и разделов catalogs, 
 * который соответствует товару.
 */

SELECT id, name, (SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog' FROM products;

/*
*(по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
*и таблица городов cities (label, name). Поля from, to и label 
*содержат английские названия городов, поле name — русское. 
*Выведите список рейсов flights с русскими названиями городов.
*/
CREATE DATABASE example;

CREATE TABLE flights(
id SERIAL PRIMARY KEY,
fly_from varchar(255) comment 'город вылета',
fly_to varchar(255) comment 'город прилета'
);
-- truncate TABLE flights;
INSERT INTO flights (fly_from, fly_to) VALUES 
	('St.Peterburg', 'Moscow'),
	('Moscow', 'Vladivostok'),
	('Krasnodar', 'Anapa'),
	('Moscow', 'Krasnodar');

-- DROP TABLE cities;
CREATE TABLE cities(
lable varchar(255) comment 'города по-английски',
name varchar(255) comment 'города по-русски'
);

INSERT INTO cities (lable, name) VALUES 
	('St.Peterburg', 'Санкт-Петербург'),
	('Moscow', 'Москва'),
	('Vladivostok', 'Владивосток'),
	('Krasnodar', 'Краснодар'),
	('Anapa', 'Анапа');

SELECT 
	id, 
	(SELECT name FROM cities WHERE lable = fly_from), 
	(SELECT name FROM cities WHERE lable = fly_to) 
	FROM flights 
;

