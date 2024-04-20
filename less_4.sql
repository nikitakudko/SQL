DROP DATABASE IF EXISTS lesson4;
CREATE DATABASE lesson4;
USE lesson4;
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teacher; 
DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teacher(id)
);
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4),
    ("Нейронные сети", NULL); -- Учитель, который ведет данный предмет, временно отстутствует

SELECT 
	t.surname AS 'Фамилия',
    l.course AS 'Название курса'
FROM teacher t
JOIN lesson l
ON t.id = l.teacher_id;	

SELECT 
	t.surname AS 'Фамилия',
    l.course AS 'Название курса'
FROM teacher t
LEFT JOIN lesson l
ON t.id = l.teacher_id	
WHERE l.teacher_id IS NULL;

SELECT 
	t.surname AS 'Фамилия',
    l.course AS 'Название курса'
FROM teacher t
JOIN lesson l
ON t.id = l.teacher_id
WHERE l.course = 'Знакомство с веб-технологиями';

SELECT  
	t.*,
    web_lesson.* 
FROM teacher t
JOIN (SELECT course, teacher_id FROM lesson
WHERE course = 'Знакомство с веб-технологиями') web_lesson
ON t.id = web_lesson.teacher_id;
