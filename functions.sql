DELIMITER //

CREATE FUNCTION IsPrime(number INT) RETURNS BOOLEAN
BEGIN
    DECLARE divisor INT DEFAULT 2;

    IF number <= 1 THEN
        RETURN FALSE;
    END IF;

    WHILE divisor < number DO
        IF number % divisor = 0 THEN
            RETURN FALSE;
        END IF;
        SET divisor = divisor + 1;
    END WHILE;

    RETURN TRUE;
END//

DELIMITER ;
