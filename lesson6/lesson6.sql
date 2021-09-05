/*
* 1. ����� ����� ��������� ������������. �� ���� ������������� ���. ���� ������� ��������, 
* ������� ������ ���� �������  � ��������� ������������� (������� ��� ���������).
*/

SELECT from_user_id, to_user_id, -- ����� ������������ �� ���� � ����
(SELECT concat(first_name,' ', last_name) FROM users WHERE id = messages.from_user_id)  AS name, -- ������� ��� ��� � ������� �� �������
count(*) AS total -- ������� ���-�� ��������� �� messages
FROM messages 
WHERE to_user_id = 6 -- ������ �������� ������������
GROUP BY from_user_id -- ����������
ORDER BY total DESC -- ��������� �� ���������� ���-�� 'total'
LIMIT 1; -- ������� ������ ���� ��������

/*
 * 2. ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.
 */
-- ������� ������������� �� �����������
SELECT user_id, (YEAR(current_date())-YEAR(birthday)) AS age FROM profiles ORDER BY age;

-- ����� ���-�� ������������� ������ 10 ���
SELECT COUNT(*) as quantity_over_10 FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';

-- id �������������, ������� ������ 10 ���
SELECT user_id AS user_10 FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';
-- 
SELECT user_id AS user_10, (SELECT like_type FROM posts_likes WHERE profiles.user_id = user_10 ) FROM profiles WHERE (YEAR(current_date())-YEAR(birthday)) < '10';

-- 
SELECT user_id AS s, (YEAR(current_date())-YEAR(birthday)) AS age, (SELECT like_type FROM posts_likes WHERE user_id = s) FROM profiles ORDER BY age;

/*
 *3. ���������� ��� ������ �������� ������ (�����): ������� ��� �������.
 */

-- ����� ������ ���-�� 'm' � 'f' � ������� 'profiles'
SELECT gender, COUNT(*) -- ������� �� ������� "gender", ����� ���-�� ��
	FROM profiles -- �� ������� 'profiles'
	WHERE gender = 'm' OR gender = 'f' -- ������ �� �������� 'm', 'f'
	GROUP BY gender -- ������������ �� 'gender'
	ORDER BY gender ASC; -- ����������� �� 'gender'
	
-- ����� ������� ������, ������� ������������� gender
SELECT user_id, like_type, ( -- ������� �� �������� user_id, like_type
	SELECT gender -- ������� �� ������� 'gender'
	FROM profiles -- ������� profiles
	WHERE profiles.user_id = posts_likes.user_id) -- �������� user_id ������� profiles ������� ������������� �������� user_id � ������� posts_like
	AS gender -- �������� ������� gender
	FROM posts_likes; -- �� ������� posts_like
	

SELECT like_type, ( -- ������� �� �������� user_id, like_type
	SELECT gender -- ������� �� ������� 'gender'
	FROM profiles -- ������� profiles
	WHERE profiles.user_id = posts_likes.user_id) -- �������� user_id ������� profiles ������� ������������� �������� user_id � ������� posts_like
	AS gender -- �������� ������� gender
	FROM posts_likes
	ORDER BY like_type DESC; -- �� ������� posts_like