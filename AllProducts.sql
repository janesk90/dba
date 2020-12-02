CREATE
    ALGORITHM = UNDEFINED
    DEFINER = `shapirod1`@`%`
    SQL SECURITY DEFINER
VIEW `AllProducts` AS
    SELECT
        `film_list`.`title` AS `Name`,
        `film_list`.`description` AS `Description`,
        `film_list`.`category` AS `Category`,
        `film_list`.`price` AS `Price`,
        CONCAT('Actors : ',
                `film_list`.`actors`,
                ' Rating : ',
                `film_list`.`rating`,
                ' length : ',
                `film_list`.`length`) AS `MoreInfo`,
        'sakila' AS `Provider`
    FROM
        `sakila`.`film_list`
    UNION SELECT
        `adventureworks`.`product`.`Name` AS `Name`,
        CONCAT('TODO') AS `Description`,
        CONCAT('TODO') AS `Category`,
        `adventureworks`.`product`.`ListPrice` AS `Price`,
        CONCAT('Color : ',
                `adventureworks`.`product`.`Color`,
                ' Size : ',
                `adventureworks`.`product`.`Size`) AS `MoreInfo`,
        'adventureworks' AS `Provider`
    FROM
        `adventureworks`.`product`
    UNION SELECT
        `northwind`.`products`.`product_name` AS `Name`,
        `northwind`.`products`.`description` AS `Description`,
        `northwind`.`products`.`category` AS `Category`,
        `northwind`.`products`.`list_price` AS `Price`,
        CONCAT('N/A') AS `MoreInfo`,
        'northwind' AS `Provider`
    FROM
        `northwind`.`products`
    UNION SELECT
        `products`.`products_name` AS `Name`,
        `products`.`products_description` AS `Description`,
        `products`.`products_category` AS `Category`,
        `products`.`products_price` AS `Price`,
        CONCAT('N/A') AS `MoreInfo`,
        'AMAZON2.0' AS `Provider`
    FROM
        `products`
