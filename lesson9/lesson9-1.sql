/*
 * 1. � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
 * ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.
 */ 
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

/*
 * 2. �������� �������������, ������� ������� �������� name �������� ������� �� ������� products � 
 * ��������������� �������� �������� name �� ������� catalogs.
 */
CREATE OR REPLACE VIEW prod_desc(prod_id, prod_name, cat_name) AS
SELECT p.id AS prod_id, p.name, c.name
FROM products p 
LEFT JOIN catalogs c 
ON p.catalog_id = c.id;

SELECT * FROM prod_desc;

/*
 * 3. (�� �������) ����� ������� ������� � ����������� ����� created_at. � ��� ��������� ���������� 
 * ����������� ������ �� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. 
 * ��������� ������, ������� ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, 
 * ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.
 */

use shop;
DROP TABLE IF EXISTS data_table;
CREATE TABLE data_table (
	created_at DATE
);

INSERT INTO data_table VALUES
	('2021-09-01'),
	('2021-09-04'),
	('2021-09-16'),
	('2021-09-17');

SELECT * FROM data_table dt ORDER BY created_at;

SELECT 
	time_period.selected_date AS day,
	(SELECT EXISTS(SELECT * FROM data_table WHERE created_at = day)) AS day_from
FROM
	(SELECT v.* FROM 
		(SELECT ADDDATE('1970-01-01',d4.s*10000 + d3.s*1000 + d2.s*100 + d1.s*10 + d0.s) selected_date FROM
			(SELECT 0 s UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d0,
		    (SELECT 0 s UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d1,
		    (SELECT 0 s UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d2,
		    (SELECT 0 s UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d3,
		    (SELECT 0 s UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d4) v
	WHERE selected_date BETWEEN '2021-09-01' AND '2021-09-31') AS time_period
ORDER BY day;

/*
 * 4. (�� �������) ����� ������� ����� ������� � ����������� ����� created_at. �������� ������, 
 * ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.
 */
use shop;
DROP TABLE IF EXISTS data_table;
CREATE TABLE data_table (
	created_at DATE
);

INSERT INTO data_table VALUES
	('2021-09-01'),
	('2021-09-02'),
	('2021-09-04'),
	('2021-09-12'),
	('2021-09-14'),
	('2021-09-17'),
	('2021-09-25'),
	('2021-09-28'),
	('2021-09-29'),
	('2021-09-30');

SELECT * FROM data_table dt ORDER BY created_at DESC;

-- ����� ��������� ������� ������, ������� ���������� �������
SELECT created_at AS first_five FROM data_table
WHERE created_at NOT IN (
	SELECT *
	FROM (
		SELECT *
		FROM data_table
		ORDER BY created_at DESC
		LIMIT 5
	) AS foo
) ORDER BY created_at DESC;

-- ������� ���, ��� �� �������� � ������ �������
DELETE FROM data_table 
WHERE created_at NOT IN (
	SELECT *
	FROM (
		SELECT *
		FROM data_table 
		ORDER BY created_at DESC
		LIMIT 5
	) AS foo
) ORDER BY created_at DESC;

SELECT * FROM data_table ORDER BY created_at DESC;



