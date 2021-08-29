DROP DATABASE IF EXISTS vk;

CREATE DATABASE IF NOT EXISTS vk;

-- ���������� �� vk
USE vk;

-- ���������� ��� �������
SHOW tables;

/*
 * 1. �������� ������� users.
*/

/*
 * ������� � ��������������.
 * 
 * ��������: ���������� ������� ������ ������������������ �������������.
 * 
 * ��� ���� � �������������: ���� - ���������� ������������� ������������,
 * ���, �������, �������, �����.
 * 
 * ��� ��� � ��� ���� ���� - �� ���������� primary key. � ������ ������ ����������� �������
 * ������ ���� primary key. �� �������� ����� �� �������� � �����������, ��� ��� �������� � �������
 * ���������.
 * ����� ���� ������������� ����������������, ����� ��������� �������� (1,2,3,...)
 * 
 * �����, ����� ������������ ��� ����������� ����������� �������� ��� ��� ������.
 * ����� ��������� � ����������� ������� NOT NULL.
 * 
 * ����� ����� ������� ������ (���-������), � ����� � ������������ ���� ����������� �� �������� 
 * ������ ��� �����������.
 * ��������� � ����������� ������� password_hash DEFAULT NULL.
 * 
 * ����� ����� ������� ���� � ����� ����������� ������������.
 * ��������� ������� created_at, ������� �� ������� �������� ������� ���� � ����� ���������
 * DEFAULT CURRENT_TIMESTAMP.
 * 
 * ����� �� �����, ����� ����� � ������� ������������ ��� ����������� ���� �����������.
 * �� ����, ����� ������������ �� ��� ���������������� ��� ����� ������� �������� ��� ������
 * ��� ��������.
 * ���� ���������� � ����������� ������� UNIQUE,
 * ���� ������� UNIQUE INDEX �� ������ �� �������.
 * 
 * INDEX �������� �� ������� �����. ����� ������� ����� - �� primary key. �� primary key ����� ����
 * ������ ���� � �������.
 * 
 * ����� ������������ ������?
 * ����� �� ����� ���� �����-�� ���������� ��� ��������, ������� ��������� � �������.
 * ��������, �� ���� ��� ������������, ���� ��� email (��� ����� ������ ������ � ��).
 * �� email ���� ������, ������ ����� ���������� �������.
 * 
 * ���������� ������ - ��� �� ����� ������, ������� ������������� �����������, ��� ��� �������� � ������� ���������.
 * 
 * �������������� ��������� ������. ����� �������� - �������� �������� �������.
 * 
 */

CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	phone CHAR(11) NOT NULL,
	password_hash CHAR(65) DEFAULT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	INDEX (phone),
	INDEX (email)
);

-- �������� �������, ������� ���� � ����
INSERT INTO users VALUES (DEFAULT, 'Petya', 'Petukhov', 'petya1@mail.com', '89212223334', DEFAULT, DEFAULT);
INSERT INTO users VALUES (DEFAULT, 'Vasya', 'Vasilkov', 'vasya@mail.com', '89212023334', DEFAULT, DEFAULT);

-- ��������� �� ���������� �������
SELECT * FROM users;

-- ������� ������������ � id = 2
DELETE FROM users WHERE id = 4;


-- ��� ��� ��������� ������������, ������� ����������� id = 3
INSERT INTO users VALUES (DEFAULT, 'Vasya', 'Vasilkov', 'vasya@mail.com', '89212023334', DEFAULT, DEFAULT);

-- ��������� �� ���������� �������
SELECT * FROM users;

/*
 * 2. �������� ������� � �������� ������������, ����� �� ������� ��� ������ � ������� users
 * 
 * ��������: ���������� ������� ������ ���������� ������������� � ��������� �������.
 * 
 * ����� ������ ���������� ��� �����: ���, �������, ����������, �����, ������.
 * �� ��� ������� ������������ � ��� ������ �����������?
 * 
 * �� ����� ������� ��� � ������� ������ �� ������� users. �� ���� ������ �� �����������
 * ������������ � ������� users.
 *
 * ��������, � ���� id = 1 � ������� users. � ������� profiles �� ������ ������ � user_id = 1
 * � ����� �������������, ��� � ���� ������ ���������� ������ ���������� ����. �� ����, user_id = 1
 * ������� ��� � ���, ��� � ������ ���������� ���������� ������ ��� ������������ �� ������� users � 
 * id = 1 � �� ��� ���� �������.
 * 
 * ��� ����� ����� ��������� ��������� foreign key. �� �����������, ��� ��� ������� user_id ����������
 * id � ������� profiles. � ����� ��, ��� �� ���������� user_id, �������� �� ������������ ������� id � users.
 * CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users (id)
 * 
 * ������ ������������ ������������� ���� �������. ����� ���� � ������.
 * 
*/

-- 1:1 �����
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x') NOT NULL,
	birthday DATE NOT NULL,
	photo_id BIGINT UNSIGNED,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY(user_id) REFERENCES users(id) -- ON DELETE CASCADE ON UPDATE CASCADE -- https://dev.mysql.com/doc/refman/8.0/en/create-table-foreign-keys.html 
);

-- �������� �������, ������� ������� ��� ��� ��������� ���� � ����
INSERT INTO profiles VALUES (1, 'm', '1997-12-01', NULL, 'Moscow', 'Russia'); -- ������� ����
INSERT INTO profiles VALUES (3, 'm', '1988-11-02', NULL, 'Moscow', 'Russia'); -- ������� ����


/* ��������� �������� ��� ����� ������ 

INT �� -2147483648 �� 2147483647
INT UNSIGNED �� 0 �� 4294967295

BIGINT �� -9 223 372 036 854 775 808 �� 9 223 372 036 854 775 807
BIGINT UNSIGNED 0 �� 18 446 744 073 709 551 615

������������ �� ����� ������
https://dev.mysql.com/doc/refman/8.0/en/data-types.html
*/


/*
 * 3. �������� ������� � ����������� �������������.
 * 
 * ��������: ���� ���������� ���� ������ ���������.
 * 
 * ���� ����� �������� ��������� ����, ������, �����, � ���� ����� �������� ����� ��������� ����, ������, �����.
 * ��� ����� �� ������ (�������������) � ������ (�������������).
 * 
 * ��� ��� ���������� ������� ��� ���������? ����������� ���������, ���������� ���������, ����� ���������,
 * ���� � ����� �������� ��������� � ���� � ����� ���������� ���������. ����� ����� ������� ���������� � ���,
 * ��������� �� ���������.
 * 
 * ����������� ��������� - ��� ��� ����. ����� �� ������� �� ��������� � ��������� �� ����� ��� � ������� �����������.
 * ����� �� ��� ������� ��� � ������� ����������� � ������� ���������?
 * ���, ��� ���������� ��� �������� � ������� users, �� ��� ������������� �����������.
 * �� ����� ������� ������ �� ����������� ���������, ���� �� ������� users. �� ���� ��� id �� ������� users.
 * 
 * ��������� ����������� ��������� ����� from_user_id. ������, � from_user_id �� ������ 1, id ����.
 * � ���� 1 �� ������ ����� � ������� users, ����� ��� ������ � id = 1, � ������� ��� � ������� ����.
 * 
 * ���������� ��� ����, ������� ���� to_user_id - ������ �� ���������� ��������� �� ������� users.
 * ����� ������� � to_user_id 2, ����� - id ���� �� ������� users.
 * 
 * 
 * ��� ���������� ����������, ����� �� ��� ���� ��������� � ������ �������. �� ����, ����� �� ��� ���-�� ���������
 * ���������������� ������ ��������� �� ���� � ����, ����� �� ���� ������ ��������� ��������� ����, ����������
 * �� ��� ��������� ��� ���������?
 * ��, ����������.
 * ��������� id ��������� � ����-����������� � primary key.
 * 
 * ��� ����� ����������� ��������� � �������� users � ���������� ��������� � �������� users ������� ��� ������
 * FOREIGN KEY, ������� ���������� �� ���� � �� �� ������� users id.
 * ����������� ��������� � ���������� ����� ��� ���������, ��� � �� ��������� ��� ������ ���������. Foreign key
 * ��� ����� �� ������������.
 * 
 * ��� �������� ������ ���� ���������, ������� �������� ����������� ��������� � ���������� id (��������, ����
 * ��� ���������, ������� �������� ���� �� ����� id = 1) �������� ������
 * ��� from_user_id. �� ������������, ��� ��� ����������� ��������� ��� ��������� ����� ������ ���������,
 * �� ����� ����������� � ���������� ������ ������� ��� �����������.
 * 
 * ���������� ��� ���������� ���������, to_user_id, ����� ������ ������ ��� ���������, ������� �� �������.
 * (��������, ��� ���������, ������� ������� ����)
 * 
*/

-- ����� ��������� : ���������
-- 1 : �
-- 1 : 1
CREATE TABLE messages(
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED AUTO_INCREMENT NOT NULL
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	txt TEXT NOT NULL,
	is_delivered BOOLEAN DEFAULT FALSE,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX messages_from_user_id_idx (from_user_id),
	INDEX messages_to_user_id_idx (to_user_id),
	CONSTRAINT fk_messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id),
	CONSTRAINT fk_messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id) 
);

-- ������� ��� ��������� �� ���� � ����, ���� ��������� �� ���� � ����
INSERT INTO messages VALUES (DEFAULT, 1, 3, 'Hi!', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 1
INSERT INTO messages VALUES (DEFAULT, 1, 3, 'Vasya!', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 2
INSERT INTO messages VALUES (DEFAULT, 3, 1, 'Hi, Petya', 1, DEFAULT, DEFAULT); -- ��������� �� ���� � ���� ����� 2

-- ������� ���������
SELECT * FROM messages;

-- ������� ��������� �������
DESCRIBE messages;

/*
 * 4. �������� ������� �������� � ������.
 * 
 * ��������: ���� ����� �������� ���� � ������.
 * 
 * ���� ����� ��������� ������� �� ������ ����, ������, �����, ���� ����� ����� ��������� ������� ����, ������, �����.
 * ��� ����� �� ������ (�������������) � ������ (�������������).
 * 
 * ��� ��� ���������� ������� ��� �������� � ������? ����������� �������, ���������� �������,
 * ������ ������� (������ ��� ��������).
 * 
 * ����������� ��������, ������� �������� ��� �������� ������� messages.
 * �� �������� ������ ������ �� ����������� �������, from_user_id, � ���������� �������, to_user_id.
 * 
 * ��� ���������� ����������, ����� �� ��� ���� ������� �� ������ � ������ �������. 
 * �� ����, ���������� ����������, ����� �� ���� ������� ��������� �������� �� ������ ���� ������������?
 * ���, �� �����. ���� ����� ��������� ���� ������ ���� ������ �� ������. ������������� �� �����.
 * 
 * ������ ��� ����� ��������� ���������������� ���� ����������� ������� � ����������, ����� ���� �� ���
 * ��������� ��� ��������� ������ �� ������ ����.
 * ��� ����� �� ����� ������������ PRIMARY KEY �� ���� ��������, ��� ��� �� � ��� �� �����.
 * PRIMARY KEY ��� ����� �������������, ��� ���� (����, ����), ��� ���� - �����������, ���� - ����������,
 * ����� ����������� � ������� ����� ���� ���.
 * 
 * ���������� ������� messages ��������� foreign keys � �������.
 * 
*/

CREATE TABLE friend_requests(
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (from_user_id, to_user_id),
	KEY (from_user_id),
	KEY (to_user_id),
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

-- ������� ������ �� ������ �� ���� � ����
INSERT INTO friend_requests VALUES (1, 3, 1);

SELECT * FROM friend_requests;


/*
 * 5. �������� ������� ���������.
 * 
 * ��������: ���� ������� ����������.
 * 
 * ���� ����� ������� ����� ���������, ������ � ���������� ����� ���� ������ ���� ���������.
 * ����� �� ������ (������������) � ������ (�����������).
 * 
 * ��� ��� ���������� ������� ��� ����������? ��� ����, ��������, ��������, ��������� ����������.
 * 
 * ��������� ���������� - ��� ������������. ������, �� ����������� �����, �� ����� ������� ������ �� ������������
 * �� ������� users. �� ���� id ������������ �� ������� users. ����� �� ������� � foreign key.
 * ���������� ���������, ��� ��� ����� �� ������ � ������ ������ � ������������� foreign key ���������
 * �� ������� ������, �� ���� ���������� � ������ ������.
 * 
 * ��������� ����� ������ �� ��������� ���������� (admin_id) ��� �������� ������ ���� ���������, � ������� ���������
 * ������������ � ���������� id.
 * 
*/ 

CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	description VARCHAR (255),
	admin_id BIGINT UNSIGNED NOT NULL,
	KEY(admin_id), 
	FOREIGN KEY (admin_id) REFERENCES users(id)
);

-- ������� ���������� � ���������� �����
INSERT INTO communities VALUES (DEFAULT, 'Number1', 'I am number one', 1);
INSERT INTO communities VALUES (DEFAULT, 'Number2', 'I am number two', 1);

SELECT * FROM communities;

/*
 * 6. �������� ������� ��� �������� ���������� ��� ���� ���������� ���� ���������.
 * 
 * ��������: ���� ������� � ���������� Number1.
 * 
 * ���� ����� �������� �� ����� ������ ���������, ��� ���� � ����� ���������� ����� ���� ����� ����������.
 * ����� �� ������ � ������.
 * 
 * ��� ��� ���������� �������? ������������, ����������, � ������� �� �������, ���� ���������� � ����������.
 * 
 * ��� ��� ���� ����� �������� � ���������� Number1 ������ ���� ���, ���������� ������������� ������ ��� �� ����� (id),
 * ���������� ������������ ������� friend_requests ��� ����� � ������� �� ��������.
*/

-- ������������ : ����������
-- � : 1
-- 1 : �

CREATE TABLE communities_users(
	community_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(community_id, user_id),
	KEY (community_id),
	KEY (user_id),
	FOREIGN KEY (community_id) REFERENCES communities(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);


-- ������� ������ ���� ���� �������� ���������� Number 1
INSERT INTO communities_users VALUES (1, 3, DEFAULT);

SELECT * FROM communities_users;

/*
 * 7. �������� ������� ��� �������� ����� ����� ������, ������� ����� ����������.
 * 
 * � �������-�������� ������ �� �������� ������ �� ������ �������.
 * � �������-�������� ������ �������� ������ ���� � ��������, � ������ ������ ���� ����
 * �����-����� � �������� �����-�����.
 * 
 * ����������� �������� ����� ������� ��� ������ �������, �����, ...
*/

CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

-- ������� ���� � �������
INSERT INTO media_types VALUES (DEFAULT, '�����������');
INSERT INTO media_types VALUES (DEFAULT, '������');
INSERT INTO media_types VALUES (DEFAULT, '��������');

SELECT * FROM media_types;

/*
 * 8. �������� ������� ���� �����������.
 * 
 * ��������: ���� ��������� ����������.
 * 
 * ���� ����� �������� ����� ��������� �����������, ������ � ���������� ����� ���� ������ ���� ����� 
 * (���, ��� ��� �������).
 * ����� �� ������ (������������) � ������ (�����������).
 * 
 * ��� ��� ���������� ������� ��� ����������? ��� ����, ���������, ���, ��������, ������, ���� ����������.
 * 
 * ������ �� ��������� (������������) ������� �� �������� � ����� ���������� ���������, ��������� ������ ���
 * �������� ������ ����������� ������������ � foreign key.
 * 
 * ����� ���������� ���-�� ������� ��� �����-�����. ����� ������� �������� ���� ����������, ��������, "�����������",
 * "������", "��������". ������, �������� ����� ����������� � ��� ��� �������� � ����� �������� media_types � ��� �����
 * ������������ ������. ��� �� ����� ������� �� �������� ����, � ������ �� �������� ���� � �������� (�� ���� id ���� 
 * ���������� �� ������� media_types).
 * 
 * � ������� ���� ���������� ����� ���� ��������� ����������� (��� "�����������" ����� ���� � ��������� �����������),
 * ������ � ���������� ����� ���� ������ ���� ��� (����������1 ����� ������ ���� ��� - "�����������").
 * ��� ��� ����� �� ������ (����) � ������ (�����������).
 * 
 * ������� ������� media_types_id, ��� ������ id ���� �� media_types. ������� foreign key �� media_types_id
 * � media_types (id). ������ �� �������, ��� ��� ����� ����������� ����� ����, � ������ ����� ����� ��������
 * �� ����� ������� � ����� �������������� ����������. 
 * 
 * ��� � ������ ������� � ��� ���������� ��� ������ ����� �� ������ � ������, ������� �� ������� ����� �����.
*/

CREATE TABLE media(
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

-- ������� ��� �����������, ������� ������� ����
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);
-- ������� ��������, ������� ������� ����
INSERT INTO media VALUES (DEFAULT, 3, 3, 'doc.docx', 1024, DEFAULT);

/* ������� ������� ��� �������� ��������� ������ � ���� ������������
 * card_number - ����� �����
 * card_date_valid - ���� �������������
 * card_username - ��� ��������� �� �����
 * card_pin - ��� ���
 * balance - ��������� ������
 */
CREATE TABLE card_pay(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	card_number INT UNSIGNED NOT NULL,
	card_date_valid DATE NOT NULL,
	card_username VARCHAR(255) NOT NULL,
	card_pin INT UNSIGNED NOT NULL,
	balance BIGINT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

/*������� ������� ��� ������ ������ � ����������� ��� ������������
 * work_experience - ���� ������ - ��������� ���� ��� �������� ����������� ����� ������
 * speciality - ������������� - �������� �������������
 * posk_status - ������ ������: � �������� ������, ����� ������, ����������...
 */
CREATE TABLE job_users (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	work_experience TEXT NOT NULL,
	speciality VARCHAR(255) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
	);

/*������� ������� ��� ����� ��� ������������
*game_user - �������� ������� ���� ������������
*game_level - ������� ���������� � ����
*game_date_at - ���� ���������� ��������� ����
*game_balance - ������� ������
*
*/

CREATE TABLE games_users (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	game_user VARCHAR(255) NOT NULL,
	game_level INT UNSIGNED,
	game_date_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	game_balance BIGINT,
	FOREIGN KEY (user_id) REFERENCES users(id)
	);