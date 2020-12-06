CREATE TABLE customers (
	customers_id INT AUTO_INCREMENT PRIMARY KEY,
    customers_firstname VARCHAR(100) NOT NULL,
    customers_lastname VARCHAR(100) NOT NULL,
    customers_email VARCHAR(255) NOT NULL UNIQUE,
    customers_lastupdate TIMESTAMP NOT NULL DEFAULT NOW(),
    customers_active INT NOT NULL DEFAULT 1 CHECK(customers_active BETWEEN 0 AND 1)
);
CREATE TABLE suppliers (
	suppliers_id INT AUTO_INCREMENT PRIMARY KEY,
	suppliers_name VARCHAR(255) NOT NULL UNIQUE,
    suppliers_address VARCHAR(255) NOT NULL,
    suppliers_city VARCHAR(255) NOT NULL,
    suppliers_state VARCHAR(2) NOT NULL,
    suppliers_email VARCHAR(255) NOT NULL,
    suppliers_phone VARCHAR(18) NOT NULL,
	suppliers_active INT NOT NULL DEFAULT 1 CHECK(suppliers_active BETWEEN 0 AND 1)
);
CREATE TABLE products (
	products_id INT AUTO_INCREMENT PRIMARY KEY,
    products_name VARCHAR(100) NOT NULL,
    products_price DECIMAL(15,2) NOT NULL DEFAULT 0,
    products_stock INT NOT NULL,
    products_description VARCHAR(1000) NOT NULL DEFAULT "",
    products_restock_level INT NOT NULL,
    products_lastsold TIMESTAMP, -- nullable, where null means the product has never sold ever
    products_sale_flag INT(1) NOT NULL,
	products_active INT NOT NULL DEFAULT 1 CHECK(products_active BETWEEN 0 AND 1),
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id)
);
CREATE TABLE categories (
	categories_id INT AUTO_INCREMENT PRIMARY KEY,
    categories_name VARCHAR(255)
);
CREATE TABLE products_to_categories (
	products_to_categories_id INT AUTO_INCREMENT PRIMARY KEY,
    products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id),
    categories_id INT,
    FOREIGN KEY (categories_id) REFERENCES categories (categories_id),
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id)
);
CREATE TABLE orders (
	orders_id INT AUTO_INCREMENT PRIMARY KEY,
	orders_address VARCHAR(255) NOT NULL,
    orders_city VARCHAR(255) NOT NULL,
    orders_state VARCHAR(2) NOT NULL,
    orders_zip VARCHAR(10) NOT NULL, -- for instance, if we go to Canada, their concept of what we call a ZIP code has letters
    orders_purchasedate TIMESTAMP NOT NULL DEFAULT NOW(),
    orders_shipdate TIMESTAMP NOT NULL DEFAULT NOW(), -- todo: default this to four business days from now
    orders_cost DECIMAL(15,2) NOT NULL,
	customers_id INT,
    FOREIGN KEY (customers_id) REFERENCES customers (customers_id)
);
CREATE TABLE ratings ( -- customers can create one rating for a product and then alter it as much as they'd like
	ratings_value INT NOT NULL DEFAULT 3 CHECK(ratings_value BETWEEN 0 AND 5),
    ratings_date TIMESTAMP NOT NULL DEFAULT NOW(),
    ratings_helpful INT NOT NULL DEFAULT 1,
    ratings_votes INT NOT NULL DEFAULT 1,
    ratings_description VARCHAR(1000) NOT NULL DEFAULT '',
    customers_id INT,
    FOREIGN KEY (customers_id) REFERENCES customers (customers_id),
    products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id),
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id)
);
ALTER TABLE ratings ADD CONSTRAINT ratings UNIQUE(customers_id, products_id, suppliers_id);
CREATE TABLE wishlists ( -- many customers can wish for many products
	wishlists_id INT AUTO_INCREMENT PRIMARY KEY,
    wishlists_date TIMESTAMP NOT NULL DEFAULT NOW(),
	customers_id INT,
    FOREIGN KEY (customers_id) REFERENCES customers (customers_id),
    products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id),
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id)
);
ALTER TABLE wishlists ADD CONSTRAINT wishlists UNIQUE(customers_id, products_id, suppliers_id);
CREATE TABLE supplies (
	supplies_id INT AUTO_INCREMENT PRIMARY KEY,
    supplies_cost DECIMAL(15,2) NOT NULL DEFAULT 0,
    supplies_date TIMESTAMP NOT NULL DEFAULT NOW(), -- realized we might need to know when we request a supply
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id),
    products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id)
);
CREATE TABLE restockorders (
	restockorders_id INT AUTO_INCREMENT PRIMARY KEY,
    restockorders_date TIMESTAMP DEFAULT NOW(),
    restockorders_quantity INT NOT NULL,
    restockorders_totalcost DECIMAL(15,2) NOT NULL,
    products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id),
    suppliers_id INT,
    FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id)
);
CREATE TABLE orderitems (
	orderitems_id INT AUTO_INCREMENT PRIMARY KEY,
    orderitems_saleprice DECIMAL(15,2) NOT NULL,
    quantity INT NOT NULL,
	products_id INT,
    FOREIGN KEY (products_id) REFERENCES products (products_id),
	suppliers_id INT,
	FOREIGN KEY (suppliers_id) REFERENCES suppliers (suppliers_id),
    orders_id INT,
    FOREIGN KEY (orders_id) REFERENCES orders (orders_id)
);