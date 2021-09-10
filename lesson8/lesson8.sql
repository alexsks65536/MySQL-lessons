/* 
 * ����� ����� ��������� ������������. �� ���� ������������� ���. ���� ������� ��������, 
 * ������� ������ ���� ������� � ��������� ������������� (������� ��� ���������).
 */

/*� �������������� JOIN*/
SELECT m.from_user_id, m.to_user_id, concat(first_name,' ', last_name) AS name_from_user, count(*) AS total
FROM messages m 
	JOIN users u ON u.id = m.from_user_id
WHERE m.to_user_id = 6 
GROUP BY m.from_user_id -- ����������
ORDER BY total DESC -- ��������� �� ���������� ���-�� 'total'
LIMIT 1; -- ������� ������ ���� ��������
	
/*
 * 2. ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.
 */
SELECT count(*) AS users_under_10_years_old
FROM profiles p
JOIN posts_likes pl ON like_type = 1 AND p.user_id = pl.user_id 
WHERE (YEAR(current_date())-YEAR(p.birthday)) < '10';

/*
 *3. ���������� ��� ������ �������� ������ (�����): ������� ��� �������.
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