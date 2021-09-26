/*
 * ������������ ������� �� ���� ������������������ MySQL� (��� ���� ��������� �� ������ �������)
 * �������� ���� ������������� ������� ����� ������ � ���� ������ shop. ������� ������������ shop_read 
 * ������ ���� �������� ������ ������� �� ������ ������, ������� ������������ shop � ����� �������� � �������� ���� ������ shop.
*/

-- shop �������� ������ ������� �� ������ ������
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '0000';
GRANT SELECT ON shop.* TO 'shop_reader'@'localhost';

-- test
INSERT INTO catalogs(name)
 -- denied for this user
VALUES('New_catalog');
 -- success
SELECT * FROM catalogs;

-- shop - �������� ����� �������� � �������� ���� ������ shop
DROP USER IF EXISTS 'shop'@'localhost';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY '0000';
GRANT ALL ON shop.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop.* TO 'shop'@'localhost';

-- test
INSERT INTO catalogs(name)
 -- success
VALUES('New_catalog');
 -- have new catalog
SELECT * FROM catalogs;

/*
 * (�� �������) ����� ������� ������� accounts ���������� ��� ������� id, name, password, 
 * ���������� ��������� ����, ��� ������������ � ��� ������. �������� ������������� username 
 * ������� accounts, ��������������� ������ � ������� id � name. �������� ������������ user_read, 
 * ������� �� �� ���� ������� � ������� accounts, ������, ��� �� ��������� ������ �� ������������� username.
 */
-- ��� ��� ����. accounts ��� ����������
-- �������� accounts2 ��� �� ����� 6 
DROP TABLE IF EXISTS accounts2;
CREATE TABLE accounts2 (
	id SERIAL PRIMARY KEY,
	name VARCHAR(45),
	password VARCHAR(45)
);

INSERT INTO accounts2 VALUES
	(NULL, 'john', '0000'),
	(NULL, 'leo', '0000'),
	(NULL, 'michael', '0000');


CREATE OR REPLACE VIEW username(user_id, user_name) AS 
	SELECT id, name FROM accounts2;

 -- tests
SELECT * FROM accounts2;
SELECT * FROM username;
-- *

-- ������� ������������ 'shop_reader'@'localhost' � �������� ������ � ������,
-- ������������� �� ��������, ������������� username;
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '0000';
GRANT SELECT ON shop.username TO 'shop_reader'@'localhost';

-- test
-- ��������� ��� shop_reader
 -- access denied
SELECT * FROM catalogs;
 -- success
SELECT * FROM username;