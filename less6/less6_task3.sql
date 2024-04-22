CREATE TABLE IF NOT EXISTS students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    st_name VARCHAR(45),
    age INT
);

CREATE TABLE IF NOT EXISTS marks(
	id INT PRIMARY KEY AUTO_INCREMENT,
    mark INT,
    student_id INT,
    date_mark DATE,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
 
DROP TEMPORARY TABLE student_mark; 
CREATE TEMPORARY TABLE student_mark
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    mark INT,
    data_create DATE 
);

INSERT INTO student_mark(mark, data_create)
SELECT mark, date_mark
FROM marks
WHERE student_id = 1 AND date_mark BETWEEN '2024-03-30' AND '2024-04-05';

SELECT * FROM student_mark;

DROP PROCEDURE create_student_grade;
DELIMITER //
CREATE PROCEDURE create_student_grade(IN id_st INT)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS student_mark;
	CREATE TEMPORARY TABLE student_mark(
		id INT PRIMARY KEY AUTO_INCREMENT,
		mark INT,
		data_create DATE 
	);
	INSERT INTO student_mark(mark, data_create)
	SELECT mark, date_mark
	FROM marks
	WHERE student_id = id_st AND date_mark BETWEEN '2024-03-30' AND '2024-04-05';
END//
DELIMITER ;

CALL create_student_grade(1);
SELECT * FROM student_mark;

DROP FUNCTION fib
DELIMITER //
CREATE FUNCTION fib(n INT)
RETURNS VARCHAR(200)
DETERMINISTIC
	BEGIN
		DECLARE i INT DEFAULT 0;
        DECLARE x1 INT DEFAULT 1;
        DECLARE x2 INT DEFAULT 1;
		DECLARE temp INT;
        DECLARE res VARCHAR(200) DEFAULT '1 1';
        WHILE i < n - 2 DO
			SET temp = x2;
			SET x2 = x2 + x1;
            SET x1 = temp;
            SET res = CONCAT(res,' ', x2);
            SET i = i + 1;
		END WHILE;
        RETURN res; 
END //
DELIMITER ;

SELECT fib(5);

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));
INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

