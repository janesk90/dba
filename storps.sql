DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_active`(_id INT, _isactive INT)
BEGIN
	START TRANSACTION;
		UPDATE customers
        SET 
            customers_active = _isactive
		WHERE
			customers_id = _id;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer`(_firstname VARCHAR(100), _lastname VARCHAR(100), _email VARCHAR(255))
BEGIN
	START TRANSACTION;
		INSERT INTO customers (customers_firstname, customers_lastname, customers_email, customers_active)
		VALUES (_firstname, _lastname, _email, 1);
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customer`(_id INT, _firstname VARCHAR(100), _lastname VARCHAR(100), _email VARCHAR(255), _isactive INT)
BEGIN
	START TRANSACTION;
		UPDATE customers
        SET 
			customers_firstname = _firstname,
            customers_lastname = _lastname,
            customers_email = _email,
            customers_active = _isactive
		WHERE
			customers_id = _id;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(_products_name VARCHAR(100), _products_price DECIMAL(15,2), _products_stock INT, _products_description VARCHAR(1000), _products_restock_level INT, _products_lastsold TIMESTAMP, _products_sale_flag INT, _products_active INT)
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
			_products_name, 
            _products_price, 
            _products_stock, 
            _products_description, 
            _products_restock_level, 
            _products_lastsold, 
            _products_sale_flag, 
            _products_active);
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_product_active`(_products_id INT, _is_active INT)
BEGIN
	START TRANSACTION;
		UPDATE products SET products_active = _is_active WHERE products_id = _products_id;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product`(_products_id INT, _products_name VARCHAR(100), _products_price DECIMAL(15,2), _products_stock INT, _products_description VARCHAR(1000), _products_restock_level INT, _products_sale_flag INT, _products_active INT)
BEGIN
	START TRANSACTION;
		UPDATE products SET
			products_name = _products_name,
            products_price = _products_price,
            products_stock = _products_stock,
            products_description = _products_description,
            products_restock_level = _products_restock_level,
            products_sale_flag = _products_sale_flag,
            products_active = _products_active
		WHERE
			products_id = _products_id;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_supplier`(sname VARCHAR(255), saddress VARCHAR(255), scity VARCHAR(255), sstate VARCHAR(2), semail  VARCHAR(255), sphone  VARCHAR(18), sactive  INT)
BEGIN
	START TRANSACTION;
		INSERT INTO suppliers (suppliers_name, suppliers_address, suppliers_city, suppliers_state, suppliers_email, suppliers_phone, suppliers_active)
        VALUES (sname, saddress, scity, sstate, semail, sphone, sactive);
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_supplier`(sid INT, sname VARCHAR(255), saddress VARCHAR(255), scity VARCHAR(255), sstate VARCHAR(2), semail  VARCHAR(255), sphone  VARCHAR(18), sactive  INT)
BEGIN
	START TRANSACTION;
		UPDATE suppliers SET
			suppliers_name = sname,
            suppliers_address = saddress,
            suppliers_city = scity,
            suppliers_state = sstate,
            suppliers_email = semail,
            suppliers_phone = sphone,
            suppliers_active = sactive
		WHERE
			suppliers_id = sid;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_supplier_active`(sid INT, sactive INT)
BEGIN
	START TRANSACTION;
		UPDATE suppliers SET
            suppliers_active = sactive
		WHERE
			suppliers_id = sid;
    COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_wishlist`(cid INT, pid INT, sid INT)
BEGIN
	START TRANSACTION;
		INSERT INTO wishlists (customers_id, products_id, suppliers_id) VALUES (cid, pid, cid);
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
		WHERE ratings_id = rid;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_rating_not_helpful`(rid INT)
BEGIN
	START TRANSACTION;
		UPDATE ratings SET
            ratings_votes = ratings_votes + 1
		WHERE ratings_id = rid;
	COMMIT;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rate_product`(cid INT, pid INT, sid INT, r INT, d VARCHAR(1000))
BEGIN
	IF NOT EXISTS (SELECT * FROM ratings WHERE customers_id = cid AND products_id = pid AND suppliers_id = sid) THEN
		START TRANSACTION;
		INSERT INTO 
			ratings (ratings_value, ratings_helpful, ratings_votes, ratings_description, customers_id, products_id, suppliers_id) 
		VALUES 
			(r,1,1,d,cid,pid,sid);
		COMMIT;
	ELSE
		START TRANSACTION;
		UPDATE ratings SET ratings_value = r, ratings_description = d WHERE customers_id = cid AND products_id = pid AND suppliers_id = cid;
		COMMIT;
	END IF;
END$$
DELIMITER ;
