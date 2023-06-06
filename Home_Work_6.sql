/*
Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
CREATE DATABASE IF NOT EXISTS home_work_6;
USE home_Work_6;

DELIMITER //
CREATE PROCEDURE seconds_in_day(seconds INT)
	BEGIN
   		SET @days := floor(seconds / 86400);
		SET @hours := floor((seconds - 86400 * @days) / 3600);
		SET @minutes := floor((seconds - 86400 *@days - 3600 * @hours) / 60);
		SET @seconds := seconds - 86400 *@days - 3600 * @hours - 60 * @minutes;
		SELECT concat(@days,' days ',@hours,' hours ',@minutes,' minutes ',@seconds,' seconds ') AS "Результат";
	END //
delimiter ;

CALL seconds_in_day(123456);

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

  
DELIMITER //
    CREATE FUNCTION even(num INT)
    RETURNS VARCHAR(45)
    DETERMINISTIC
    BEGIN
    DECLARE result VARCHAR(45) DEFAULT 2;
    DECLARE i INT DEFAULT 3;
	WHILE i <= num
    DO  
	IF (i / 2 - floor(i / 2)) = 0
	THEN
	SET result = CONCAT(result,' ', i);
	END IF;
	SET i = i + 1;
    END WHILE;
    RETURN result;
	END //
DELIMITER ;

SELECT even(10);