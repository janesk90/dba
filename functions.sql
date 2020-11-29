-- I think this is right? I need someone to review this as I'm completely in the dark; I just know how to model data tbh
DELIMITER |
CREATE FUNCTION addCustomer(
	firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(255)
)
RETURNS INT
BEGIN
	INSERT INTO customers (customers_firstname, customers_lastname, customers_email) VALUES (firstname, lastname, email);
    RETURN 1;
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
    RETURN 1;
END;
CREATE FUNCTION findProductsCategories(
	_products_id
)
RETURNS INT
BEGIN
	SELECT categories.categories_id, categories.categories_name
    INTO @catid, @catname
    FROM products_to_categories JOIN categories WHERE products_id = _products_id;
END
DELIMITER ;