/*
 * 1. ������������ ������� �� ���� ��������� ��������� � �������, ��������"
 * �������� �������� ������� hello(), ������� ����� ���������� �����������, 
 * � ����������� �� �������� ������� �����. 
 * � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", 
 * � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
 * � 18:00 �� 00:00 � "������ �����", 
 * � 00:00 �� 6:00 � "������ ����".
 */
	
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT '������ ����';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT '������ ����';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT '������ �����';
		ELSE
			SELECT '������ ����';
	END CASE;
END //
delimiter ;

CALL hello();

-- � ��������������  'IF ELSE'
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT '������ �����';
	ELSE
		SELECT '������ ����';
	END IF;
END //
delimiter ;

CALL hello();

/*
 * 2. � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
 * ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. 
 * ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
 * ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.
 */


DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning, NULL not writing!'; -- ��������������, ���������� �������� NULL, �������� ��������
	END IF;
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 5000, 2); 

INSERT INTO products (name, description, price, catalog_id)
VALUES ("GeForce GTX 1060", NULL, 25000, 12); 

INSERT INTO products (name, description, price, catalog_id)
VALUES ("GeForce GTX 1060", "������� ����������", 25000, 12); 

/*
 * (�� �������) �������� �������� ������� ��� ���������� ������������� ����� ���������. 
 * ������� ��������� ���������� ������������������ � ������� ����� ����� ����� ���� ���������� �����. 
 * ����� ������� FIBONACCI(10) ������ ���������� ����� 55.
 */

DROP FUNCTION IF EXISTS fib();
delimiter //
CREATE FUNCTION fib(n INT) RETURNS INT NOT DETERMINISTIC
BEGIN
IF(n <= 1)
		RETURN n;
ELSE
	RETURN (
		fib(n - 1) + fib(n - 2);
	)
	END IF;
 END //
delimiter ;

SELECT fib(10);