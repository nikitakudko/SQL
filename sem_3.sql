-- 1. Создание базы данных. 
CREATE DATABASE IF NOT EXISTS lesson_3;

-- 2 Подключение к БД
USE lesson_3; 

-- 3. Создание таблицы.
CREATE TABLE IF NOT EXISTS staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8, 2),
    age INT
);

SELECT 
* FROM lesson_3.staff;

-- Sorting
SELECT 
	id,
    salary,
    CONCAT(first_name, '  ', last_name) AS fullname
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Сортировка по 2 полям 
SELECT
	id,
    salary,
    first_name,
    last_name
FROM staff
ORDER BY last_name DESC, first_name;

-- Группировка 

SELECT
	post,
    MIN(salary) AS `min`,
    MAX(salary) AS `max`,
    ROUND(ANG(salary), 2) AS `avg_salary`,
    MAX(salary) - MIN(salary) AS `diff`,
    COUNT(salary) AS `count`
FROM staff
GROUP BY post

 
