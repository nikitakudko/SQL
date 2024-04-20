USE lesson_3;
SELECT * FROM staff;

-- Ранжирование 
-- Вывести список всех сотрудников, указать место по ЗП в общем списке 
SELECT
	salary,
    post,
    CONCAT(first_name, ' ', last_name) AS fullname,
    DENSE_RANK() OVER(ORDER BY salary DESC) as `dense_rank`
FROM staff;

-- Ранжирование 
-- Вывести список всех сотрудников, указать место по ЗП
-- Для каждой должности
SELECT
	salary,
    post,
    CONCAT(first_name, ' ', last_name) AS fullname,
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) as `dense_rank`
FROM staff;

-- ФНС ищет самых выс-ых сотрудников 
-- 1 сотрудник получает больше всех 

SELECT * FROM ( 
SELECT
	salary,
    post,
    CONCAT(first_name, ' ', last_name) AS fullname,
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) as `dense_rank`
FROM staff) rank_staff 
WHERE `dense_rank` = 1;

-- Агрегация . Для каждой должнойсти: 
-- срендняя ЗП(1)
-- суммарная ЗП (2)
-- процентное соотношение отдельно взятой зп внутри должности к суммарной ЗП по должности(3)
-- процентное соотношение отдельно взятой зп внутри должности к суммарной ЗП(4)
SELECT
	salary,
    post,
    CONCAT(first_name, ' ', last_name) AS fullname,
    AVG(salary) OVER w AS avg_salary,
    SUM(salary) OVER w AS sum_salary,
    SUM(salary) OVER w1,
    ROUND(salary * 100 / SUM(salary) OVER w,2) AS percent_SUM,
    ROUND(salary * 100 / SUM(salary) OVER w1,2) AS percent_sum_salary 
FROM staff
WINDOW w AS(PARTITION BY post),
w1 AS ();

-- Представления 
SELECT 
	post,
    COUNT(*) AS count_staff,
    AVG(salary) AS avg_staff
FROM staff
GROUP BY post
ORDER BY count_staff DESC;

CREATE OR REPLACE VIEW v_count_post
AS
SELECT 
	post,
    COUNT(*) AS count_staff,
    AVG(salary) AS avg_staff
FROM staff
GROUP BY post
ORDER BY count_staff DESC;

SELECT * FROM v_count_post;



