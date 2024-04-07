
CREATE TABLE IF NOT EXISTS movies
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    year INT NOT NULL,
    runnig_time_min INT NOT NULL,
    storyline TEXT
);

SELECT *FROM movies;
INSERT INTO movies(name, year, runnig_time_min)
VALUES 
('HARRY POTTER', 2001, 152),
('GREEN MILE', 1990, 202),
('TITANIC', 1992, 180),
('FORREST GAMP', 1994, 142),
('CAST AWAY', 2000, 182);

CREATE TABLE IF NOT EXISTS author
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
age INT
);

SELECT *FROM author;
INSERT INTO author(name, age)
VALUES 
('DAVID',25),
('MIKE', 35),
('SCKOTT', 50),
('JACK', 45);

ALTER TABLE movies ADD author_id INT;
ALTER TABLE movies ADD CONSTRAINT fk_author
FOREIGN KEY (author_id) REFERENCES author(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

CREATE TABLE IF NOT EXISTS marks
(
stud_id INT PRIMARY KEY AUTO_INCREMENT,
total_marks INT,
grade VARCHAR(45)
);

SELECT total_marks, grade,
CASE
	WHEN grade = 'A++'
		THEN 'DISTINCTION'
	WHEN grade = 'A+'
		THEN 'FIRST CLASS'
	WHEN grade = 'A'
		THEN 'SECOND CLASS'
	WHEN grade = 'B+'
		THEN 'SECOND CLASS'
	WHEN grade = 'C+'
		THEN 'THIRD CLASS'
	ELSE 'FAIL'
END AS class
FROM marks;

SELECT total_marks, grade,
CASE
	WHEN total_marks >= 450
		THEN 'ПЕРВЫЙ КЛАСС С ОТЛИЧИЕМ'
	WHEN total_marks < 450 and total_marks >= 400
 		THEN 'ПЕРВЫЙ КЛАСС'
	WHEN total_marks < 400 and total_marks >= 350
 		THEN 'ВТОРОЙ КЛАСС'
	WHEN total_marks < 350 and total_marks >= 300
 		THEN 'ТРЕТИЙ КЛАСС'
	ELSE 'НЕУДАЧА'
END AS class
FROM marks; 

SELECT IF(1000<200, 'YES', 'NO') AS Result;

SELECT total_marks,
	IF (total_marks>450, 'Отлично', 'Хорошо')
    AS res
FROM marks 