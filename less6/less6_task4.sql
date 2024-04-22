SELECT * FROM lesson_3.bankaccounts;
START TRANSACTION; 
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1'; 
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2'; 
COMMIT; 
SELECT * FROM bankaccounts;

DROP PROCEDURE operation;
DELIMITER //
CREATE PROCEDURE operation(IN N INT, OUT  tran_result varchar(100))
BEGIN
	START TRANSACTION; 
	IF (SELECT funds FROM bankaccounts WHERE accountno='ACC1') > n THEN 
		UPDATE bankaccounts SET funds=funds - n  WHERE accountno='ACC1';
        UPDATE bankaccounts SET funds=funds + n WHERE accountno='ACC2'; 
        SET tran_result = 'Ok';
        COMMIT;
	ELSE 
		SET tran_result = 'Недостаточно средств';
		ROLLBACK;
	END IF;
END//
DELIMITER ;

