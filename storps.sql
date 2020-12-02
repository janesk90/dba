DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_active`(id INT, isactive INT)
BEGIN
	START TRANSACTION;
		UPDATE customers
        SET 
            customers_active = @isactive
		WHERE
			customers_id = @id;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer`(firstname VARCHAR(100), lastname VARCHAR(100), email VARCHAR(255))
BEGIN
	START TRANSACTION;
		INSERT INTO customers (customers_firstname, customers_lastname, customers_email, customers_active)
		VALUES (@firstname, @lastname, @email, 1);
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer`(id INT, firstname VARCHAR(100), lastname VARCHAR(100), email VARCHAR(255), isactive INT)
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
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(products_name VARCHAR(100), products_price DECIMAL(15,2), products_stock INT, products_description VARCHAR(1000), products_restock_level INT, products_lastsold TIMESTAMP, products_sale_flag INT, products_active INT)
BEGIN
	START TRANSACTION;
		INSERT INTO products (
			products_name, 
            products_price, 
            products_stock, 
            products_description, 
            products_restock_level, 
            products_lastsold, 
            products_sale_flag, 
            products_active )
		VALUES (
			@products_name, 
            @products_price, 
            @products_stock, 
            @products_description, 
            @products_restock_level, 
            @products_lastsold, 
            @products_sale_flag, 
            @products_active);
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_product_active`(products_id INT, is_active INT)
BEGIN
	START TRANSACTION;
		UPDATE products SET products_active = @is_active WHERE products_id = @products_id;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product`(products_id INT, products_name VARCHAR(100), products_price DECIMAL(15,2), products_stock INT, products_description VARCHAR(1000), products_restock_level INT, products_sale_flag INT, products_active INT)
BEGIN
	START TRANSACTION;
		UPDATE products SET
			products_name = @products_name,
            products_price = @products_price,
            products_stock = @products_stock,
            products_description = @products_description,
            products_restock_level = @products_restock_level,
            products_sale_flag = @products_sale_flag,
            products_active = @products_active
		WHERE
			products_id = @products_id;
    COMMIT;
END$$
DELIMITER ;