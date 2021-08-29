-- �������� ���� ������ example, ���������� � ��� ������� users, 
-- ��������� �� ���� ��������, ��������� id � ���������� name.

CREATE DATABASE example;
USE example; -- � ���������
CREATE TABLE users (id serial, name varchar(100) NOT NULL UNIQUE);
EXIT -- � ��������

-- �������� ���� ���� ������ example �� ����������� �������
 
-- ��������� ������� � ���������
mysqldump -u root -p example > example.sql

-- ���������� ���������� ����� � ����� ���� ������ sample.

CREATE DATABASE sample;
EXIT -- � ���������
-- ��������� ������� � ���������
mysql - � root -p sample < example.sql -- � ��������

USE sample;
SHOW tables;


-- �������� ���� ������������ ������� help_keyword ���� ������ mysql. 
-- ������ ��������� ����, ����� ���� �������� ������ ������ 100 ����� �������.

-- ��������� ������� � ���������
mysqldump -u root -p mysql help_keyword --where="true limit 100"> help_keyword.sql