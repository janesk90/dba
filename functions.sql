DELIMITER |
CREATE FUNCTION addCustomer(
	firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(255)
)
RETURNS INT
BEGIN
	INSERT INTO customers (customers_firstname, customers_lastname, customers_email) VALUES (firstname, lastname, email);
END;
CREATE FUNCTION addProduct products(
	_name VARCHAR(100),
    _price DECIMAL(15,2),
    _stock INT NOT NULL,
    _description VARCHAR(1000),
    _restock_level INT,
)
RETURNS INT
BEGIN
	INSERT INTO products (products_name, products_price, products_stock, products_description, products_restock_level) 
    VALUES (_name, _price, _stock, _description, _restock_level);
END;
DELIMITER ;