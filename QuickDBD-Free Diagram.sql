-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/--1Xk15mf02EMCe_JpNgMg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE `Customer` (
    `CustomerID` int  NOT NULL ,
    `firstName` string  NOT NULL ,
    `lastname` string  NOT NULL ,
    `email` string  NOT NULL ,
    `password` string  NOT NULL ,
    `phone` int  NOT NULL ,
    `street` string  NOT NULL ,
    `streetdetails` string  NOT NULL ,
    `city` string  NOT NULL ,
    `state` string  NOT NULL ,
    `zip` int  NOT NULL ,
    `hasdoorman` bolean  NOT NULL ,
    `drycleaning` boolean  NOT NULL ,
    `washandfold` boolean  NOT NULL ,
    `orderid` id  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`,`orderid`
    )
);

CREATE TABLE `laundrycarepackage` (
    `laundrycarepackageID` id  NOT NULL ,
    `name` string  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `laundrycarepackageID`
    )
);

CREATE TABLE `choose_service` (
    `servicesID` id  NOT NULL ,
    `laundrycarepackageID` id  NULL ,
    `customwashdetail_ID` id  NULL ,
    `drycleaningID` id  NULL ,
    PRIMARY KEY (
        `servicesID`,`drycleaningID`
    )
);

CREATE TABLE `drycleaning` (
    `drycleaningID` id  NOT NULL ,
    `user_pick_drycleaning` boolean  NOT NULL ,
    PRIMARY KEY (
        `drycleaningID`
    )
);

CREATE TABLE `item` (
    `itemID` id  NOT NULL ,
    `name` string  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `itemID`
    )
);

CREATE TABLE `dryitem` (
    `drycleaningID` id  NOT NULL ,
    `itemID` id  NOT NULL 
);

CREATE TABLE `customwashdetails` (
    `customwashdetail_ID` id  NOT NULL ,
    `whitetemperature` string  NOT NULL ,
    `colortemprature` string  NOT NULL ,
    `colorheat` string  NOT NULL ,
    `whiteheat` string  NOT NULL ,
    `soapID` id  NOT NULL ,
    `softnerID` id  NOT NULL ,
    `order` id  NOT NULL ,
    PRIMARY KEY (
        `customwashdetail_ID`
    )
);

CREATE TABLE `soap` (
    `soapID` id  NOT NULL ,
    `name` string  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `soapID`
    )
);

CREATE TABLE `softner` (
    `softnerID` id  NOT NULL ,
    `name` string  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `softnerID`
    )
);

ALTER TABLE `Customer` ADD CONSTRAINT `fk_Customer_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `choose_service` (`servicesID`);

ALTER TABLE `choose_service` ADD CONSTRAINT `fk_choose_service_laundrycarepackageID` FOREIGN KEY(`laundrycarepackageID`)
REFERENCES `laundrycarepackage` (`laundrycarepackageID`);

ALTER TABLE `choose_service` ADD CONSTRAINT `fk_choose_service_customwashdetail_ID` FOREIGN KEY(`customwashdetail_ID`)
REFERENCES `customwashdetails` (`customwashdetail_ID`);

ALTER TABLE `choose_service` ADD CONSTRAINT `fk_choose_service_drycleaningID` FOREIGN KEY(`drycleaningID`)
REFERENCES `dryitem` (`drycleaningID`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_itemID` FOREIGN KEY(`itemID`)
REFERENCES `item` (`itemID`);

ALTER TABLE `soap` ADD CONSTRAINT `fk_soap_soapID` FOREIGN KEY(`soapID`)
REFERENCES `customwashdetails` (`soapID`);

ALTER TABLE `softner` ADD CONSTRAINT `fk_softner_softnerID` FOREIGN KEY(`softnerID`)
REFERENCES `customwashdetails` (`softnerID`);

CREATE INDEX `idx_Customer_firstName`
ON `Customer` (`firstName`);

CREATE INDEX `idx_Customer_lastname`
ON `Customer` (`lastname`);

CREATE INDEX `idx_Customer_email`
ON `Customer` (`email`);

CREATE INDEX `idx_Customer_password`
ON `Customer` (`password`);

