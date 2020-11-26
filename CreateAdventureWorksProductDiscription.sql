CREATE DEFINER=`shapirod1`@`%` FUNCTION `getAdventureWorksProductDiscription`(ProductID INT) RETURNS mediumtext CHARSET utf8mb4
BEGIN
RETURN (SELECT Description FROM adventureworks.productdescription WHERE ProductID = ProductDescriptionID);
END
