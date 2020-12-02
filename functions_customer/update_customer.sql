CREATE PROCEDURE `update_customer` (id INT, firstname VARCHAR(100), lastname VARCHAR(100), email VARCHAR(255), isactive INT)
BEGIN
	START TRANSACTION;
		UPDATE customers
        SET 
			customers_firstname = @firstname,
            customers_lastname = @lastname,
            customers_email = @email,
            customers_active = @isactive
		WHERE
			customers_id = @id;
	COMMIT;
END;