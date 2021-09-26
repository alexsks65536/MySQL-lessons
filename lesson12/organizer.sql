/*
 * "����������� ����������-����������� ��������� ������������ �����������".
 * 
 * ������������ ������� ������ "tasks", ����������� �� � �������� 'projects',
 * ������������� �������������� ����������, ������������� ���� ����������.
 * ��������� �������� ������, ������ ������� � ���������, ����� ���������� ������
 * ������ ������� � ����������, ��� ������������� ����� ����������� � ����������.
 * ���������� ����� ������� � ��������� ��������
 */ 
DROP DATABASE IF EXISTS organizer;

CREATE DATABASE IF NOT EXISTS organizer;

USE organizer;

-- 1. ������� ������� �����������
-- ���������� ������ ��� ����� � �������

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(150) NOT NULL UNIQUE comment 'email ���������� - �� �� ����� ��� �����',
	password_hash CHAR(65) DEFAULT NULL comment '������ ��� �����',
	user_status INT NOT NULL comment '������ ���������� � ��� �����'
);

insert into users (id, email, password_hash, user_status) values (1, 'ijaye0@quantcast.com', '9c750f014a38b02f0097687c96fdeee0', 2);
insert into users (id, email, password_hash, user_status) values (2, 'tgencke1@reuters.com', '560b983d93af9c5896d9ca544a15ec3d', 2);
insert into users (id, email, password_hash, user_status) values (3, 'btrent2@tripod.com', 'df1ca6c4457ba43b807182b1963c54d7', 2);
insert into users (id, email, password_hash, user_status) values (4, 'atristram3@creativecommons.org', '31298ff4db95c20d5eb6f9ac75c162e6', 2);
insert into users (id, email, password_hash, user_status) values (5, 'fburd4@sitemeter.com', '195a7a7187cb7e46fb196623d0499614', 2);
insert into users (id, email, password_hash, user_status) values (6, 'escandrett5@gravatar.com', 'fd22acd209b6a601d66addce908b3a6f', 2);
insert into users (id, email, password_hash, user_status) values (7, 'hkach6@360.cn', '61d1c8bdb2fa69027f379b0651b51f95', 2);
insert into users (id, email, password_hash, user_status) values (8, 'mkulas7@slate.com', 'ee402056ce4aa986e003bbff7442e7e3', 1);
insert into users (id, email, password_hash, user_status) values (9, 'cpierrepoint8@123-reg.co.uk', 'f0a796c439aa7c91a48c7a7efe75a55f', 2);
insert into users (id, email, password_hash, user_status) values (10, 'astutt9@nsw.gov.au', '6fc7aa6eab97a8149bc6a0041c91fa54', 2);

SELECT * FROM users;

-- 2. ������� ������� �������� �����������,
-- ������� ���, �������, ���� ��������

DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles (
	id_profiles BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(255) comment '��� ����������',
	last_name VARCHAR(255) comment '������� ����������',
	birthday date NOT NULL,
	FOREIGN KEY(id_profiles) REFERENCES users(id)
);

insert into profiles (id_profiles, first_name, last_name, birthday) values (1, 'Demetra', 'Walework', '1995-11-23 08:57:20');
insert into profiles (id_profiles, first_name, last_name, birthday) values (2, 'Chelsie', 'Toman', '1987-08-18 16:17:37');
insert into profiles (id_profiles, first_name, last_name, birthday) values (3, 'Ana', 'Jeacop', '2002-08-12 03:56:15');
insert into profiles (id_profiles, first_name, last_name, birthday) values (4, 'Ericka', 'Brunel', '2000-02-28 01:58:22');
insert into profiles (id_profiles, first_name, last_name, birthday) values (5, 'Ilario', 'Thaller', '1991-04-02 18:47:17');
insert into profiles (id_profiles, first_name, last_name, birthday) values (6, 'Daphna', 'Bugge', '1996-09-30 02:52:29');
insert into profiles (id_profiles, first_name, last_name, birthday) values (7, 'Dorey', 'Taylot', '2003-03-16 05:17:54');
insert into profiles (id_profiles, first_name, last_name, birthday) values (8, 'Ruthe', 'Armin', '1999-10-23 00:37:26');
insert into profiles (id_profiles, first_name, last_name, birthday) values (9, 'Jimmie', 'Goodday', '1994-11-01 07:53:49');
insert into profiles (id_profiles, first_name, last_name, birthday) values (10, 'Constantine', 'Felkin', '1987-10-26 18:53:46');

-- ������� ����������� ������ � �� ���������

SELECT p.id_profiles, 
concat(p.first_name, ' ', p.last_name) AS user_name, 
p.birthday, u.email 
FROM profiles p
	LEFT JOIN users u ON id = id_profiles;

-- 3. C������ ������� �����
-- ������ ������ ������������ � ��������� �� �����������, ������ ����� ����������

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	task VARCHAR(255) comment '���������� ������',
	create_date DATETIME ON UPDATE current_timestamp comment '���� �������� ������',
	end_date DATE NOT NULL comment '���� �������� ����� ���������� ������',
	important  BIGINT UNSIGNED NOT NULL comment '�������� ������'
	);

truncate TABLE tasks;

insert into tasks (id, task, create_date, end_date, important) values (1, '����������� ����� ������ �������� � ��� "���������������" � ������ ����������� �������.', '2021-07-11 08:09:44', '2021-07-19 08:09:44', 1);
insert into tasks (id, task, create_date, end_date, important) values (2, '���������� ������ ��������� ���������� ����� �� ����� ����.', '2021-09-16 18:17:37', '2021-10-11 18:17:37', 1);
insert into tasks (id, task, create_date, end_date, important) values (3, '�������� ������� �� ������� ������� �������� ��������� � ��������� "�������".', '2021-07-29 05:13:10', '2021-08-15 05:13:10', 2);
insert into tasks (id, task, create_date, end_date, important) values (4, '��������� ������� � ������������� �������� ������� ��� ��������� �� ����� ��� �� 15 �����.', '2021-07-16 04:36:32', '2021-08-16 04:36:32', 4);
insert into tasks (id, task, create_date, end_date, important) values (5, '�������� � ������� ������� �������� ����� ������� ��� ������� ����� �����������.', '2021-08-29 09:56:23', '2021-09-19 09:56:23', 1);
insert into tasks (id, task, create_date, end_date, important) values (6, '��������� �������� ������ � ������� �����.', '2021-07-14 09:40:13', '2021-08-19 09:40:13', 4);
insert into tasks (id, task, create_date, end_date, important) values (7, '����������� ��������� �� ����� ������� �� ��� �������� ����������.', '2021-07-30 14:39:21', '2021-08-17 14:39:21', 2);
insert into tasks (id, task, create_date, end_date, important) values (8, '����������� ������� �������� ������������ �� ���������������� ��������.', '2021-08-03 14:10:26', '2021-09-01 14:10:26', 1);
insert into tasks (id, task, create_date, end_date, important) values (9, '������������ ����� �� ����������� ��������� �������� ������������ �� ������ ��������.', '2021-08-15 21:18:19', '2021-09-05 21:18:19', 2);
insert into tasks (id, task, create_date, end_date, important) values (10, '�������� �������, ��������� � ��������� ��� �� �������� ������������ ����������.', '2021-09-03 20:02:44', '2021-10-03 20:02:44', 1);

-- ������� ������ �����, ���� ��������, ���� ���������� � �� ��������

SELECT * FROM tasks;


-- 4. �������� ������� � �������� �������� �������� �����

DROP TABLE IF EXISTS important_tasks;

CREATE TABLE important_tasks (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	important VARCHAR(255) comment '�������� ������'
);

INSERT INTO important_tasks VALUES
	(NULL, '�����'),
	(NULL, '������'),
	(NULL, '��������'),
	(NULL, '������������'),
	(NULL, '�����������'),
	(NULL, '���������'),
	(NULL, '���������������');


-- ������� ������ �����, ���� ��������, ���� ���������� � �� ��������

SELECT t.id, t.task, t.create_date, t.end_date, it.important FROM tasks t
LEFT JOIN important_tasks it ON t.important = it.id;

-- 5. ������� ������� ��������, ������������ ���������� ������� �� ������������
-- ���� ��������� ����� ������� � ��������� ��������

DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	project VARCHAR(255) comment '�������� �������'
	);

INSERT INTO projects VALUES
	(NULL, '������� ��������������'),
	(NULL, '������ �����'),
	(NULL, '�����'),
	(NULL, '����������� �����'),
	(NULL, '�����'),
	(NULL, '�����������'),
	(NULL, '��������'),
	(NULL, '��������'),
	(NULL, '���������������'),
	(NULL, '������������'),
	(NULL, '�������');

SELECT * FROM projects p;

-- 6. ������� ������� ���������� �����
-- ����� ��������� ���������� � ���������� ������������ ������

DROP TABLE IF EXISTS complete_tasks;

CREATE TABLE complete_tasks (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	id_task BIGINT comment '����� ������',
	id_user BIGINT comment '����� ���������� ���� ��������� ������',
	complete_date DATE NOT NULL comment '���� ���������� ������',
	remove_date DATE comment '���� �������� ���������� ������',
	check_tasks INT NOT NULL comment '������� � ���������� ������',
	id_task_status VARCHAR(255) comment '���������� � ���������� ������'
);

insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (1, 1, 1, '2021-12-16 11:49:56', null, 1, 2);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (2, 7, 4, '2021-10-12 16:27:09', null, 3, 2);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (3, 2, 6, '2021-10-05 22:50:46', null, 6, 1);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (4, 7, 4, '2021-10-10 10:53:14', null, 4, 1);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (5, 8, 7, '2021-11-12 23:52:32', null, 3, 1);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (6, 7, 1, '2021-11-11 14:25:37', null, 2, 1);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (7, 2, 10, '2021-12-15 22:33:31', null, 4, 2);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (8, 6, 9, '2021-10-11 15:54:59', null, 4, 2);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (9, 3, 8, '2021-12-13 17:58:18', null, 6, 1);
insert into complete_tasks (id, id_task, id_user, complete_date, remove_date, check_tasks, id_task_status) values (10, 8, 2, '2021-10-07 00:15:03', null, 6, 1);

-- ������� ������ � ������� ������ �������� ������, ���� �������� ����� ���������� ������,
-- ���� ������������ ���������� � ������� ���� ���

SELECT ct.id, t.task, t.end_date, ct.complete_date, 
	DATEDIFF(ct.complete_date, t.end_date) AS period_execution
	FROM complete_tasks ct
JOIN tasks t ON ct.id_task = t.id
;

-- 7. ������� ������� �������� ���������� �����

DROP TABLE IF EXISTS status_tasks;

CREATE TABLE status_tasks (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	task_status VARCHAR(255) comment '������ ���������� ������'
);

-- �������� ������������ ����������

INSERT INTO status_tasks VALUES 
		(NULL, '�� ��������'),
		(NULL, '� ������'),
		(NULL, '��������'),
		(NULL, '��������'),
		(NULL, '���������'),
		(NULL, '�� ���������'),
		(NULL, '���������'),
		(NULL, '������ � �����');
	
	SELECT * FROM status_tasks st ;
	
-- 8. C������� ������� � ������� ����� �������� �������� ������������� � ������� (��������)
	
	DROP TABLE IF EXISTS user_project;
	
CREATE TABLE user_project (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	project_id BIGINT comment '����� �������',
	user_id BIGINT comment '����� ����������'
	);

insert into user_project (id, project_id, user_id) values (1, 9, 6);
insert into user_project (id, project_id, user_id) values (2, 4, 1);
insert into user_project (id, project_id, user_id) values (3, 10, 10);
insert into user_project (id, project_id, user_id) values (4, 1, 9);
insert into user_project (id, project_id, user_id) values (5, 8, 6);
insert into user_project (id, project_id, user_id) values (6, 10, 5);
insert into user_project (id, project_id, user_id) values (7, 3, 4);
insert into user_project (id, project_id, user_id) values (8, 9, 1);
insert into user_project (id, project_id, user_id) values (9, 8, 9);
insert into user_project (id, project_id, user_id) values (10, 1, 9);
insert into user_project (id, project_id, user_id) values (11, 5, 10);
insert into user_project (id, project_id, user_id) values (12, 9, 2);
insert into user_project (id, project_id, user_id) values (13, 3, 4);
insert into user_project (id, project_id, user_id) values (14, 3, 7);
insert into user_project (id, project_id, user_id) values (15, 4, 3);
insert into user_project (id, project_id, user_id) values (16, 9, 8);
insert into user_project (id, project_id, user_id) values (17, 7, 5);
insert into user_project (id, project_id, user_id) values (18, 8, 1);
insert into user_project (id, project_id, user_id) values (19, 7, 5);
insert into user_project (id, project_id, user_id) values (20, 7, 6);
insert into user_project (id, project_id, user_id) values (21, 6, 10);
insert into user_project (id, project_id, user_id) values (22, 10, 1);
insert into user_project (id, project_id, user_id) values (23, 6, 8);
insert into user_project (id, project_id, user_id) values (24, 1, 3);
insert into user_project (id, project_id, user_id) values (25, 1, 9);
insert into user_project (id, project_id, user_id) values (26, 9, 6);
insert into user_project (id, project_id, user_id) values (27, 3, 10);
insert into user_project (id, project_id, user_id) values (28, 1, 3);
insert into user_project (id, project_id, user_id) values (29, 1, 2);
insert into user_project (id, project_id, user_id) values (30, 5, 2);
insert into user_project (id, project_id, user_id) values (31, 5, 4);
insert into user_project (id, project_id, user_id) values (32, 4, 10);
insert into user_project (id, project_id, user_id) values (33, 8, 9);
insert into user_project (id, project_id, user_id) values (34, 8, 7);
insert into user_project (id, project_id, user_id) values (35, 8, 1);
insert into user_project (id, project_id, user_id) values (36, 9, 1);
insert into user_project (id, project_id, user_id) values (37, 10, 2);
insert into user_project (id, project_id, user_id) values (38, 8, 9);
insert into user_project (id, project_id, user_id) values (39, 2, 8);
insert into user_project (id, project_id, user_id) values (40, 8, 7);
insert into user_project (id, project_id, user_id) values (41, 3, 10);
insert into user_project (id, project_id, user_id) values (42, 5, 3);
insert into user_project (id, project_id, user_id) values (43, 2, 9);
insert into user_project (id, project_id, user_id) values (44, 6, 2);
insert into user_project (id, project_id, user_id) values (45, 5, 8);
insert into user_project (id, project_id, user_id) values (46, 1, 4);
insert into user_project (id, project_id, user_id) values (47, 10, 1);
insert into user_project (id, project_id, user_id) values (48, 9, 4);
insert into user_project (id, project_id, user_id) values (49, 6, 5);
insert into user_project (id, project_id, user_id) values (50, 9, 9);

-- ������� ������ �������������, ������� ������ � �������

SELECT concat(p2.first_name, ' ', p2.last_name) AS username , p.project FROM user_project up
	JOIN projects p ON up.project_id = p.id 
	JOIN profiles p2 ON up.user_id = p2.id_profiles 
;

/*
 * 9. �������� ������� ��� �������� ����� ����� ������, ������� ����� �����������.
 * � �������-�������� ������ �������� ������ ���� � ��������, � ������ ������ ���� ����
 * �����-����� � �������� �����-�����.
 */

CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

-- ������� ���� � �������
INSERT INTO media_types VALUES (DEFAULT, '�������� PDF');
INSERT INTO media_types VALUES (DEFAULT, '����������');
INSERT INTO media_types VALUES (DEFAULT, '�������� MS Office');

SELECT * FROM media_types;

-- 10. C������� �������, � ������� ����� ��������� ����� � ������ �������������

DROP TABLE IF EXISTS user_files;

CREATE TABLE user_files(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	KEY (media_types_id),
	KEY (user_id),
	FOREIGN KEY (media_types_id) REFERENCES media_types(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (1, 8, 1, 'file5', 84, '2020-10-07 22:10:00');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (2, 7, 1, 'file1', 44, '2021-03-10 12:44:35');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (3, 7, 1, 'file2', 66, '2021-06-01 19:54:32');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (4, 9, 3, 'file1', 27, '2021-04-10 19:50:23');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (5, 3, 2, 'file2', 97, '2021-04-28 05:24:20');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (6, 3, 3, 'file9', 58, '2021-05-09 08:11:13');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (7, 5, 2, 'file5', 20, '2021-01-02 23:00:45');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (8, 8, 3, 'file2', 21, '2020-11-02 20:27:52');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (9, 3, 2, 'file6', 36, '2021-07-10 04:29:59');
insert into user_files (id, user_id, media_types_id, file_name, file_size, created_at) values (10, 2, 3, 'file6', 19, '2020-11-08 02:05:00');

-- ������� ������ ������ � �� ����������� � ��������� � �����������

SELECT uf.file_name, mt.name, uf.file_size, uf.created_at, concat(p.first_name, ' ', p.last_name) AS username  FROM user_files uf
	JOIN profiles p ON p.id_profiles = uf.user_id
	JOIN media_types mt ON mt.id = uf.media_types_id
;

/****************************************************************************************************/

/* 1. �������� ������������� ������������, ����� �����������
 * �������� ������
*/

CREATE VIEW user_project_in AS 
SELECT concat(p2.first_name, ' ', p2.last_name) AS username , p.project FROM user_project up
	JOIN projects p ON up.project_id = p.id 
	JOIN profiles p2 ON up.user_id = p2.id_profiles;
	
/* 2. �������� �������������, ������������ ������ �����, 
* ���� ��������, ���� ���������� � �� ��������
*/
	
CREATE VIEW task_works_users AS
SELECT t.id, t.task, t.create_date, t.end_date, it.important FROM tasks t
LEFT JOIN important_tasks it ON t.important = it.id;

/******************************************************************************************************/
-- �������� ��������� ���������� ������

USE organizer;
GO 
CREATE PROCEDURE UserTasks
BEGIN 
	SELECT task, create_date, important, end_date 
	FROM tasks;
END

