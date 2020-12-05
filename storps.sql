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
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_supplier`(sname VARCHAR(255), saddress VARCHAR(255), scity VARCHAR(255), sstate VARCHAR(2), semail  VARCHAR(255), sphone  VARCHAR(18), sactive  INT)
BEGIN
	START TRANSACTION;
		INSERT INTO suppliers (suppliers_name, suppliers_address, suppliers_city, suppliers_state, suppliers_email, suppliers_phone, suppliers_active)
        VALUES (@sname, @saddress, @scity, @sstate, @semail, @sphone, @sactive);
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_supplier`(sid INT, sname VARCHAR(255), saddress VARCHAR(255), scity VARCHAR(255), sstate VARCHAR(2), semail  VARCHAR(255), sphone  VARCHAR(18), sactive  INT)
BEGIN
	START TRANSACTION;
		UPDATE suppliers SET
			suppliers_name = @sname,
            suppliers_address = @saddress,
            suppliers_city = @scity,
            suppliers_state = @sstate,
            suppliers_email = @semail,
            suppliers_phone = @sphone,
            suppliers_active = @sactive
		WHERE
			suppliers_id = @sid;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_supplier_active`(sid INT, sactive INT)
BEGIN
	START TRANSACTION;
		UPDATE suppliers SET
            suppliers_active = @sactive
		WHERE
			suppliers_id = @sid;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_wishlist`(cid INT, pid INT)
BEGIN
	START TRANSACTION;
		INSERT INTO wishlists (customers_id, products_id) VALUES (@cid, @pid);
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_rating_helpful`(rid INT)
BEGIN
	START TRANSACTION;
		UPDATE ratings SET
			ratings_helpful = ratings_helpful + 1,
            ratings_votes = ratings_votes + 1
		WHERE ratings_id = @rid;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_rating_not_helpful`(rid INT)
BEGIN
	START TRANSACTION;
		UPDATE ratings SET
            ratings_votes = ratings_votes + 1
		WHERE ratings_id = @rid;
	COMMIT;
END$$
DELIMITER ;
