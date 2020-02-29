-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Northwind
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Northwind
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Northwind` DEFAULT CHARACTER SET utf8 ;
USE `Northwind` ;

-- -----------------------------------------------------
-- Table `Northwind`.`Region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Region` (
  `RegionID` INT(11) NOT NULL,
  `RegionDescription` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RegionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Territories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Territories` (
  `TerritoryID` VARCHAR(20) NOT NULL,
  `TerritoryDescription` VARCHAR(50) NOT NULL,
  `RegionID` INT(11) NOT NULL,
  PRIMARY KEY (`TerritoryID`),
  INDEX `RegionID_idx` (`RegionID` ASC) VISIBLE,
  CONSTRAINT `RegionID`
    FOREIGN KEY (`RegionID`)
    REFERENCES `Northwind`.`Region` (`RegionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`EmployeeTerritories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`EmployeeTerritories` (
  `EmployeeID` INT(11) NOT NULL,
  `TerritoryID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `TerritoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Employees` (
  `EmployeeID` INT(11) NOT NULL,
  `LastName` VARCHAR(20) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(30) NULL,
  `TitileOfCourtesy` VARCHAR(25) NULL,
  `BirthDate` DATETIME NULL,
  `HireDate` DATETIME NULL,
  `Address` VARCHAR(60) NULL,
  `City` VARCHAR(15) NULL,
  `Region` VARCHAR(15) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Country` VARCHAR(15) NULL,
  `HomePhone` VARCHAR(24) NULL,
  `Extension` VARCHAR(4) NULL,
  `Notes` MEDIUMTEXT NOT NULL,
  `ReportsTo` INT(11) NULL,
  `PhotoPath` VARCHAR(255) NULL,
  `Salary` FLOAT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Shipper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Shipper` (
  `ShipperID` INT(11) NOT NULL,
  `CompanyName` VARCHAR(40) NOT NULL,
  `Phone` VARCHAR(24) NULL,
  PRIMARY KEY (`ShipperID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Customers` (
  `CustomerID` VARCHAR(5) NOT NULL,
  `CompanyName` VARCHAR(40) NOT NULL,
  `ContactName` VARCHAR(30) NULL,
  `ContactTitle` VARCHAR(30) NULL,
  `Address` VARCHAR(60) NULL,
  `City` VARCHAR(15) NULL,
  `Region` VARCHAR(15) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Country` VARCHAR(15) NULL,
  `Phone` VARCHAR(24) NULL,
  `Fax` VARCHAR(24) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Orders` (
  `OrdersID` INT(11) NOT NULL,
  `CustomerID` VARCHAR(5) NULL,
  `EmployeeID` INT(11) NULL,
  `OrderDate` DATETIME NULL,
  `RequiredDate` DATETIME NULL,
  `ShippedDate` DATETIME NULL,
  `ShipVia` INT(11) NULL,
  `Freight` DECIMAL(10,4) NULL,
  `ShipName` VARCHAR(40) NULL,
  `ShipAddress` VARCHAR(60) NULL,
  `ShipCity` VARCHAR(15) NULL,
  `ShipRegion` VARCHAR(15) NULL,
  `ShipPostalCode` VARCHAR(10) NULL,
  `ShipCountry` VARCHAR(15) NULL,
  PRIMARY KEY (`OrdersID`),
  INDEX `EmployeeID_idx` (`EmployeeID` ASC) INVISIBLE,
  INDEX `ShippperID_idx` (`ShipVia` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `EmployeeID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Northwind`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ShipVia`
    FOREIGN KEY (`ShipVia`)
    REFERENCES `Northwind`.`Shipper` (`ShipperID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Northwind`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`OrderDetails` (
  `OrderID` INT(11) NOT NULL,
  `ProductID` INT(11) NOT NULL,
  `UnitPrice` DECIMAL(10,4) NOT NULL,
  `Quantity` SMALLINT(2) NOT NULL,
  `Discount` DOUBLE NOT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Suppliers` (
  `SupplierID` INT(11) NOT NULL,
  `CompanyName` VARCHAR(40) NOT NULL,
  `ContactName` VARCHAR(30) NULL,
  `ContactTitle` VARCHAR(30) NULL,
  `Address` VARCHAR(60) NULL,
  `City` VARCHAR(15) NULL,
  `Region` VARCHAR(15) NULL,
  `PostalCode` VARCHAR(10) NULL,
  `Country` VARCHAR(15) NULL,
  `Phone` VARCHAR(24) NULL,
  `Fax` VARCHAR(24) NULL,
  `HomePage` MEDIUMTEXT NULL,
  PRIMARY KEY (`SupplierID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Categories` (
  `CategoryID` INT(11) NOT NULL,
  `CategoryName` VARCHAR(15) NOT NULL,
  `Description` MEDIUMTEXT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`Products` (
  `ProductID` INT(11) NOT NULL,
  `ProductName` VARCHAR(40) NOT NULL,
  `SupplierID` INT(11) NULL,
  `CategoryID` INT(11) NULL,
  `QuantityPerUnit` VARCHAR(20) NULL,
  `UnitPrice` DECIMAL(10,4) NULL,
  `UnitInStock` SMALLINT(2) NULL,
  `UnitOnOrder` SMALLINT(2) NULL,
  `ReorderLevel` SMALLINT(2) NULL,
  `Discontinued` BIT(1) NOT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `SupplierID_idx` (`SupplierID` ASC) VISIBLE,
  INDEX `CategoryID_idx` (`CategoryID` ASC) VISIBLE,
  CONSTRAINT `SupplierID`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `Northwind`.`Suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CategoryID`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `Northwind`.`Categories` (`CategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`CustomerDemographics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`CustomerDemographics` (
  `CustomerTypeID` VARCHAR(10) NOT NULL,
  `CustomerDesc` MEDIUMTEXT NULL,
  PRIMARY KEY (`CustomerTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Northwind`.`CustomerCustomerDemo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Northwind`.`CustomerCustomerDemo` (
  `CustomerID` VARCHAR(5) NOT NULL,
  `CustomerTypeID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CustomerID`, `CustomerTypeID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
