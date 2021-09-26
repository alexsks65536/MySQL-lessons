/*
*1. �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users,
* catalogs � products � ������� logs ���������� ����� � ���� �������� ������, �������� 
* �������, ������������� ���������� ����� � ���������� ���� name.
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
VALUES ('���������'),
		('����������� �����'),
		('����������');

SELECT * FROM catalogs;
SELECT * FROM logs;


-- **********  Tests for products  **********
SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Adata DIMM 4 Gb', '����������� ������', 4789.00, 13),
		('Intel Pentium Core i9', '���������', 25184.00, 14),
		('NVIDIA GeForce 1060Ti', '����������', 18450.00, 15);

SELECT * FROM products;
SELECT * FROM logs;

/*
 * 2. (�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.
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


/*1. � ���� ������ Redis ��������� ��������� ��� �������� ��������� � ������������ IP-�������.
 * 
 */
SADD ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
-- ���������� �������� � ��������� ��� ���������� � ��� ip �����, ������ ���������� ��������
SADD ip '127.0.0.1' 
-- ���������� ������ ���������� ip
SMEMBERS ip
-- ���-�� ������� � ���������
SCARD ip


/* 2. ��� ������ ���� ������ Redis ������ ������ ������ ����� ������������ �� ������������ ������
*     � �������, ����� ������������ ������ ������������ �� ��� �����.
*/

-- ��� ��� Redis �� ���������� � �������� �������� ��������, � ����� ����� ����������� ������ �� �����, ��
-- ��������, ��� ����� ������: ��� ��� email.

-- 
set alexander@mail.ru alex 
set alex alexander@mail.ru

get alexander@mail.ru 
get alex 


-- 
/* 3. ����������� �������� ��������� � �������� ������� ������� ���� ������ shop � ���� MongoDB.
* ��� ��� � ����� ������ ��������� �� mongodb ���� ������� �����,
* �� ����������� ��������� ����������� ��������� �� ����� �������� �����,
* ��� ������� �� ���������� �������
*/

--  1 - � ���� ���� ������ ���������
-- ����. products
use products
db.products.insert({"name": "Intel Core i5-11400F", "description": "��������� ��� ���������� ��", "price": "16999.00", "catalog_id": "����������", "created_at": new Date(), "updated_at": new Date()}) 

db.products.insertMany([
	{"name": "Intel Pentium Gold G6405", "description": "��������� ��� ���������� ��", "price": "4000.00", "catalog_id": "����������", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD A8-9600", "description": "��������� ��� ���������� ��", "price": "6400.00", "catalog_id": "����������", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "AMD FX-8320"}).pretty()


-- ����. catalogs
use catalogs
db.catalogs.insertMany([{"name": "����������"}, {"name": "���.�����"}, {"name": "����������"}])