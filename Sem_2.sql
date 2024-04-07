CREATE SCHEMA seminar_2 ;
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

