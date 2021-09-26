/*
 * ѕрактическое задание по теме Ујдминистрирование MySQLФ (эта тема изучаетс€ по вашему желанию)
 * —оздайте двух пользователей которые имеют доступ к базе данных shop. ѕервому пользователю shop_read 
 * должны быть доступны только запросы на чтение данных, второму пользователю shop Ч любые операции в пределах базы данных shop.
*/

-- shop доступны только запросы на чтение данных
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '0000';
GRANT SELECT ON shop.* TO 'shop_reader'@'localhost';

-- test
INSERT INTO catalogs(name)
 -- denied for this user
VALUES('New_catalog');
 -- success
SELECT * FROM catalogs;

-- shop - доступны любые операции в пределах базы данных shop
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
 * (по желанию) ѕусть имеетс€ таблица accounts содержаща€ три столбца id, name, password, 
 * содержащие первичный ключ, им€ пользовател€ и его пароль. —оздайте представление username 
 * таблицы accounts, предоставл€ющий доступ к столбца id и name. —оздайте пользовател€ user_read, 
 * который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представлени€ username.
 */
-- так как табл. accounts уже существует
-- создадим accounts2 дл€ дз урока 6 
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

-- —оздаем пользовател€ 'shop_reader'@'localhost' с доступом только к одному,
-- ограниченному по столбцам, представлению username;
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '0000';
GRANT SELECT ON shop.username TO 'shop_reader'@'localhost';

-- test
-- логинимс€ под shop_reader
 -- access denied
SELECT * FROM catalogs;
 -- success
SELECT * FROM username;