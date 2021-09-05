/*
 * 1. ��������� ������ ������������� users, 
 * ������� ����������� ���� �� ���� ����� orders � �������� ��������.
 */

SELECT id, name FROM users WHERE id IN (SELECT user_id FROM orders);

/*
 * 2. �������� ������ ������� products � �������� catalogs, 
 * ������� ������������� ������.
 */

SELECT id, name, (SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog' FROM products;

/*
*(�� �������) ����� ������� ������� ������ flights (id, from, to) 
*� ������� ������� cities (label, name). ���� from, to � label 
*�������� ���������� �������� �������, ���� name � �������. 
*�������� ������ ������ flights � �������� ���������� �������.
*/
CREATE DATABASE example;

CREATE TABLE flights(
id SERIAL PRIMARY KEY,
fly_from varchar(255) comment '����� ������',
fly_to varchar(255) comment '����� �������'
);
-- truncate TABLE flights;
INSERT INTO flights (fly_from, fly_to) VALUES 
	('St.Peterburg', 'Moscow'),
	('Moscow', 'Vladivostok'),
	('Krasnodar', 'Anapa'),
	('Moscow', 'Krasnodar');

-- DROP TABLE cities;
CREATE TABLE cities(
lable varchar(255) comment '������ ��-���������',
name varchar(255) comment '������ ��-������'
);

INSERT INTO cities (lable, name) VALUES 
	('St.Peterburg', '�����-���������'),
	('Moscow', '������'),
	('Vladivostok', '�����������'),
	('Krasnodar', '���������'),
	('Anapa', '�����');

SELECT 
	id, 
	(SELECT name FROM cities WHERE lable = fly_from), 
	(SELECT name FROM cities WHERE lable = fly_to) 
	FROM flights 
;

