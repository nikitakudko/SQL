-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION format_date;
DELIMITER $$
CREATE FUNCTION format_date(n INT)
RETURNS VARCHAR(200)
DETERMINISTIC
	BEGIN
    DECLARE d INT;
    DECLARE h INT;
    DECLARE m INT;
    DECLARE s INT;
    DECLARE res VARCHAR(200);
    SET d = n DIV 86400;
    SET h = (n - d * 86400) DIV 3600;
    SET m = (n - d * 86400 - h * 3600) DIV 60;
    SET s = n - d * 86400 - h * 3600 - m * 60;
    SET res = CONCAT(d,' days ', h, ' hours ', m, ' minutes ', s, ' seconds ');
    RETURN res;
    END$$
DELIMITER $$

SELECT format_date(123456);

-- Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
-- Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)

DROP PROCEDURE even_num;
DELIMITER //
CREATE PROCEDURE even_num()
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(45) DEFAULT '';
    WHILE i <= 10 DO
		IF i % 2 = 0 THEN
			SET result = CONCAT(result, i, ' ');
            SET i = i + 1;
		ELSE SET i = i + 1;
        END IF;
	END WHILE;
    SELECT result;
END//
DELIMITER ;

CALL even_num;