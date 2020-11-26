CREATE
    ALGORITHM = UNDEFINED
    DEFINER = `shapirod1`@`%`
    SQL SECURITY DEFINER
VIEW `AdventureWorksProducts` AS
    SELECT
        `adventureworks`.`product`.`ProductID` AS `ProductID`,
        `adventureworks`.`product`.`Name` AS `Name`,
        `adventureworks`.`product`.`ProductNumber` AS `ProductNumber`,
        `adventureworks`.`product`.`Color` AS `Color`,
        `adventureworks`.`product`.`ListPrice` AS `ListPrice`,
        `adventureworks`.`product`.`Weight` AS `Weight`,
        GETADVENTUREWORKSPRODUCTCATEGORY(`adventureworks`.`product`.`ProductSubcategoryID`) AS `Category`,
        GETADVENTUREWORKSPRODUCTDISCRIPTION(`adventureworks`.`product`.`ProductID`) AS `Description`,
        `adventureworks`.`product`.`ModifiedDate` AS `ModifiedDate`
    FROM
        `adventureworks`.`product`
