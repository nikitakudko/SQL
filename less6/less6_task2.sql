-- Создание процедуры, которая добавляет нового юзера с использованием  ROLLBACK/COMMIT 
DROP PROCEDURE IF EXISTS user_add;
DELIMITER //
CREATE PROCEDURE user_add(firstname varchar(100), lastname varchar(100), email varchar(100),  
hometown varchar(50), photo_id INT, birthday DATE,
OUT  tran_result varchar(100))
BEGIN

  DECLARE `_rollback` BIT DEFAULT b'0';
  DECLARE error_code varchar(100);
  DECLARE error_str varchar(100);
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
  BEGIN
	SET `_rollback` = b'1';
    GET stacked DIAGNOSTICS CONDITION 1
		error_code = RETURNED_SQLSTATE, error_str = MESSAGE_TEXT;
	END;
    
    START TRANSACTION;
	INSERT INTO users (firstname, lastname, email)
    VALUES (firstname, lastname, email);
    -- SET @last_user_id = last_insert_id();
    INSERT INTO profiles (user_id, hometown, birthday, photo_id)
    VALUES (last_insert_id(), hometown, birthday, photo_id);
    
    IF `_rollback` THEN
		SET tran_result = CONCAT('Ошибка -', error_code, 'Текст ошибки - ', error_str);
		ROLLBACK;
    ELSE 
		SET tran_result = 'OK';
        COMMIT;
	END IF;
END//
DELIMITER ;

CALL user_add('New', 'User', 'new_user1@mail.com', 'Moscow', -1, '1998-01-01', @tran_result); 
SELECT @tran_result;

CALL user_add('New', 'User', 'new_user1@mail.com', 'Moscow', 10, '1998-01-01', @tran_result); 
SELECT @tran_result;

SELECT * FROM users;
