CREATE PROCEDURE `add_customer` (firstname VARCHAR(100), lastname VARCHAR(100), email VARCHAR(255))
BEGIN
	START TRANSACTION;
		INSERT INTO customers (customers_firstname, customers_lastname, customers_email, customers_active)
		VALUES (@firstname, @lastname, @email, 1);
	COMMIT;
END;