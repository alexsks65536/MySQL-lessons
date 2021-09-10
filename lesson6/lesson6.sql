/*
* 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
* который больше всех общался  с выбранным пользователем (написал ему сообщений).
*/

SELECT from_user_id, to_user_id, -- вывод пользователя от кого и кому
(SELECT concat(first_name,' ', last_name) FROM users WHERE id = messages.from_user_id)  AS name, -- находим его имя и фамилию из профиля
count(*) AS total -- находим кол-во сообщений из messages
FROM messages 
WHERE to_user_id = 6 -- задаем искомого пользователя
GROUP BY from_user_id -- группируем
ORDER BY total DESC -- сортируем по найденному кол-ву 'total'
LIMIT 1; -- выводим только одно значение

/*с использованием JOIN*/
SELECT m.from_user_id, m.to_user_id, concat(first_name,' ', last_name) AS name_from_user, count(*) AS total
FROM messages m 
	JOIN users u ON u.id = m.from_user_id
WHERE m.to_user_id = 6 
GROUP BY m.from_user_id -- группируем
ORDER BY total DESC -- сортируем по найденному кол-ву 'total'
LIMIT 1; -- выводим только одно значение
	
/*
 * 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */
-- возраст пользователей по возрастанию
SELECT user_id, (YEAR(current_date())-YEAR(birthday)) AS age FROM profiles ORDER BY age;

-- общее кол-во пользователей младше 10 лет
SELECT COUNT(*) as quantity_over_10 FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';

-- id пользователей, которые младше 10 лет
SELECT user_id AS user_10 FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';
-- 
SELECT user_id AS user_10, (SELECT like_type FROM posts_likes WHERE profiles.user_id = user_10 ) FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';
-- 
SELECT user_id AS s, (YEAR(current_date())-YEAR(birthday)) AS age, (SELECT like_type FROM posts_likes WHERE user_id = s) FROM profiles ORDER BY age;
/* с использованием JOIN */
SELECT p.user_id, pl.like_type 
FROM profiles p
JOIN posts_likes pl ON pl.like_type = 1
WHERE (YEAR(current_date())-YEAR(p.birthday)) < '10';

SELECT count(*) AS total, pl.like_type
FROM posts_likes pl
JOIN profiles p ON pl.like_type = 1 AND (YEAR(current_date())-YEAR(p.birthday)) < '10';

SELECT count(*) AS total, pl.like_type
FROM posts_likes pl
JOIN profiles p ON pl.like_type = 1
WHERE (YEAR(current_date())-YEAR(p.birthday)) < '10';

SELECT count(*) AS total
FROM posts_likes pl
JOIN profiles p ON (YEAR(current_date())-YEAR(p.birthday)) < '10'
WHERE pl.like_type = 1;

SELECT count(*) 
FROM profiles p
JOIN posts_likes pl ON (YEAR(now())-YEAR(p.birthday)) < '10'
WHERE pl.like_type = 1;
/*
 *3. Определить кто больше поставил лайков (всего): мужчины или женщины.
 */

-- вывод общего кол-во 'm' и 'f' в таблице 'profiles'
SELECT gender, COUNT(*) -- выбрать из столбца "gender", общее кол-во из
	FROM profiles -- из таблицы 'profiles'
	WHERE gender = 'm' OR gender = 'f' -- только из значений 'm', 'f'
	GROUP BY gender -- группировать по 'gender'
	ORDER BY gender ASC; -- сортировать по 'gender'
	
-- вывод таблицы лайков, которая соответствует gender
SELECT user_id, like_type, ( -- выбрать из столбцов user_id, like_type
	SELECT gender -- выбрать из столбца 'gender'
	FROM profiles -- таблицы profiles
	WHERE profiles.user_id = posts_likes.user_id) -- значение user_id таблицы profiles которое соответствует значению user_id в таблице posts_like
	AS gender -- название столбца gender
	FROM posts_likes; -- из таблицы posts_like
	

SELECT like_type, ( -- выбрать из столбцов user_id, like_type
	SELECT gender -- выбрать из столбца 'gender'
	FROM profiles -- таблицы profiles
	WHERE profiles.user_id = posts_likes.user_id) -- значение user_id таблицы profiles которое соответствует значению user_id в таблице posts_like
	AS gender -- название столбца gender
	FROM posts_likes
	ORDER BY like_type DESC; -- из таблицы posts_like