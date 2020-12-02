CREATE PROCEDURE `set_active` (id INT, isactive INT)
BEGIN
	START TRANSACTION;
		UPDATE customers
        SET 
            customers_active = @isactive
		WHERE
			customers_id = @id;
	COMMIT;
END;