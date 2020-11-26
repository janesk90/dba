CREATE DEFINER=`shapirod1`@`%` FUNCTION `getAdventureWorksProductCategory`(ProductSubcategoryID INT) RETURNS varchar(50) CHARSET utf8mb4
BEGIN
RETURN (SELECT Name FROM adventureworks.productcategory WHERE ProductSubcategoryID = ProductCategoryID);
END
