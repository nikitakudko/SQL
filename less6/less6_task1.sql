USE lesson_3;
SELECT * FROM staff;

-- Создадим процедуру, которая будет выводит статус сотрудника по ЗП 
-- от 0 до 49 999 вк-но, то это "Средняя ЗП"
-- от 50 000 до 69 999 вкл-но, то это "ЗП выше средней"
-- ЗП > 70 000, "ВЫсокая ЗП" 
-- Номер сотрудника(id), статус ЗП в переменную 
SELECT @res := 10;
DROP PROCEDURE IF EXISTS get_status;
DELIMITER $$ 
CREATE PROCEDURE get_status
(
	IN staff_number INT,
    OUT staff_status VARCHAR(45)
)
BEGIN
	DECLARE staff_salary DOUBLE;
    
    SELECT salary INTO staff_salary 
    FROM staff
	WHERE staff_number = id;
    
    IF staff_salary BETWEEN 0 AND 49999
		THEN SET staff_status = 'Средняя ЗП ';
	ELSEIF staff_salary BETWEEN 50000 AND 69999
		THEN SET staff_status = 'ЗП выше средней';
	ELSEIF staff_salary >= 70000
		THEN SET staff_status = 'Высокая ЗП';
	END IF;
END$$
DELIMITER ; 
CALL get_status(4, @res);
SELECT @res;

DROP PROCEDURE IF EXISTS print_num;
DELIMITER $$ 
CREATE PROCEDURE print_num(IN input_number INT)
BEGIN
	DECLARE n INT;
	DECLARE result VARCHAR(45) DEFAULT '';
    SET n = input_number;
    REPEAT 
		SET result = CONCAT(result, n, ' ');
        SET n = n - 1;
		UNTIL n <= 0
	END REPEAT;
	SELECT result;
END;

CALL print_num(10);