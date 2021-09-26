/*
*1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
* catalogs и products в таблицу logs помещается время и дата создания записи, название 
* таблицы, идентификатор первичного ключа и содержимое поля name.
*/
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(45) NOT NULL,
	str_id BIGINT(20) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

-- **********  TRIGGER ON users  **********
DROP TRIGGER IF EXISTS watchlog_users;
delimiter //
CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;


-- **********  TRIGGER ON catalogs  **********
DROP TRIGGER IF EXISTS watchlog_catalogs;
delimiter //
CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


-- **********  TRIGGER ON products  **********
delimiter //
CREATE TRIGGER watchlog_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;


-- **********  Tests for users  **********
SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Leo', '1999-01-13');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Michael', '1997-11-01'),
		('Clint', '2001-01-21'),
		('John', '1975-05-01'),
		('Ritchie', '1963-12-01');

SELECT * FROM users;
SELECT * FROM logs;


-- **********  Tests for catalogs  **********
SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('Процессор'),
		('Материнская плата'),
		('Видеокарта');

SELECT * FROM catalogs;
SELECT * FROM logs;


-- **********  Tests for products  **********
SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Adata DIMM 4 Gb', 'Оперативная память', 4789.00, 13),
		('Intel Pentium Core i9', 'Процессор', 25184.00, 14),
		('NVIDIA GeForce 1060Ti', 'Видеокарта', 18450.00, 15);

SELECT * FROM products;
SELECT * FROM logs;

/*
 * 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
 */

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP PROCEDURE IF EXISTS insert_into_users ;

delimiter //

CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 100;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;

END //

delimiter ;


-- test
SELECT * FROM test_users;

CALL insert_into_users();

SELECT * FROM test_users LIMIT 3;


/*1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
 * 
 */
SADD ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
-- Невозможно добавить в коллекцию уже имеющиейся в ней ip адрес, только уникальные значения
SADD ip '127.0.0.1' 
-- просмотрим список уникальных ip
SMEMBERS ip
-- кол-во адресов в коллекции
SCARD ip


/* 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу
*     и наоброт, поиск электронного адреса пользователя по его имени.
*/

-- Так как Redis не использует в запросах значения объектов, а поиск можно производить только по ключу, то
-- выбираем, что будет ключом: имя или email.

-- 
set alexander@mail.ru alex 
set alex alexander@mail.ru

get alexander@mail.ru 
get alex 


-- 
/* 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
* Так как в плане выбора структуры БД mongodb дает широкий выбор,
* то оптимальных вариантов организации структуры БД может довольно много,
* все зависит от предметной области
*/

--  1 - в виде двух разных коллекций
-- Табл. products
use products
db.products.insert({"name": "Intel Core i5-11400F", "description": "Процессор для настольных ПК", "price": "16999.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}) 

db.products.insertMany([
	{"name": "Intel Pentium Gold G6405", "description": "Процессор для настольных ПК", "price": "4000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD A8-9600", "description": "Процессор для настольных ПК", "price": "6400.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "AMD FX-8320"}).pretty()


-- Табл. catalogs
use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])