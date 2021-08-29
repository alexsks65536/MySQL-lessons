-- i. Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)

-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

SELECT DISTINCT first_name FROM users;

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER TABLE profiles ADD is_active boolean DEFAULT true;

-- устанавливаем значение таблицы profiles в столбце is_active, вычисляя его по формуле

UPDATE profiles SET is_active = ((to_days(now()) - to_days(birthday)) / 365.25 - 18) > 0;

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

DELETE FROM messages WHERE created_at > now();

-- v. Написать название темы курсового проекта (в комментарии)

Тема курсовой работы: "Электронный планировщик поручений руководителя сотрудникам"