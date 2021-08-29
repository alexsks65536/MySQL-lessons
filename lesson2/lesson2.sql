-- Создайте базу данных example, разместите в ней таблицу users, 
-- состоящую из двух столбцов, числового id и строкового name.

CREATE DATABASE example;
USE example; -- в терминале
CREATE TABLE users (id serial, name varchar(100) NOT NULL UNIQUE);
EXIT -- в теминале

-- Создайте дамп базы данных example из предыдущего задания
 
-- запускаем команду в терминале
mysqldump -u root -p example > example.sql

-- разверните содержимое дампа в новую базу данных sample.

CREATE DATABASE sample;
EXIT -- в терминале
-- запускаем команду в терминале
mysql - г root -p sample < example.sql -- в теминале

USE sample;
SHOW tables;


-- Создайте дамп единственной таблицы help_keyword базы данных mysql. 
-- Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.

-- запускаем команду в терминале
mysqldump -u root -p mysql help_keyword --where="true limit 100"> help_keyword.sql