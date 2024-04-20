-- Задача 1
-- Вариант 1
WITH 
	mess_count AS(
SELECT
    u.id,
    u.firstname,
    u.lastname,
    COUNT(m.id) AS cnt
FROM users u 
LEFT JOIN messages m ON m.from_user_id = u.id
GROUP BY u.id
ORDER BY cnt DESC)

SELECT 
    DENSE_RANK() OVER(ORDER BY IFNULL(mess_count.cnt, 0) DESC) AS `rank_message`,
    firstname,
    lastname,
    cnt
FROM mess_count;

-- Вариант 2
SELECT
	DENSE_RANK() OVER(ORDER BY  COUNT(m.id) DESC) AS `rank_message`,
    u.id,
    u.firstname,
    u.lastname,
    COUNT(m.id) AS cnt
FROM users u 
LEFT JOIN messages m ON m.from_user_id = u.id
GROUP BY u.id
ORDER BY cnt DESC;

-- Задача 2
-- Вариант 1
WITH 
	date_diff AS(
SELECT
LEAD(created_at) OVER(ORDER BY created_at) AS `lead`,
id,
from_user_id,
created_at
FROM messages)

SELECT
	id,
	created_at,
	`lead`,
	TIMESTAMPDIFF(MINUTE, `created_at`, `lead`) AS `diff`
FROM date_diff;

-- Вариант 2

SELECT
	id,
	created_at,
    LEAD(created_at) OVER(ORDER BY created_at) AS `lead`,
    TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at) OVER(ORDER BY created_at)) AS `diff`
FROM messages