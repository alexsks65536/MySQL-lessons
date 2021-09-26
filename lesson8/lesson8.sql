/* 
 * 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 * который больше всех общался с выбранным пользователем (написал ему сообщений).
 */

/*с использованием JOIN*/
SELECT m.from_user_id, m.to_user_id, concat(first_name,' ', last_name) AS name_from_user, count(*) AS total
FROM messages m 
	JOIN users u ON u.id = m.from_user_id
WHERE m.to_user_id = 6 
GROUP BY m.from_user_id -- группируем
ORDER BY total DESC -- сортируем по найденному кол-ву 'total'
LIMIT 1; -- выводим только одно значение
	
/*
<<<<<<< HEAD
 * 2. ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.
=======
 * 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
>>>>>>> e72c26f824eb2848cdb404810825d9b704b1b4a5
 *
SELECT count(*) AS users_under_10_years_old
FROM profiles p
JOIN posts_likes pl ON like_type = 1 AND p.user_id = pl.user_id 
WHERE (YEAR(current_date())-YEAR(p.birthday)) < '10';
/*
 *3. Определить кто больше поставил лайков (всего): мужчины или женщины.
 */
SELECT count(*) AS female, (
		SELECT count(*)
		FROM posts_likes pl 
		JOIN profiles p ON pl.user_id = p.user_id AND p.gender = 'm'
		WHERE pl.like_type = 1
		)  AS man
	FROM posts_likes pl
	JOIN profiles p ON pl.user_id = p.user_id AND p.gender = 'f'
	WHERE pl.like_type = 1 ;
