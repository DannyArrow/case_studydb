-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/--1Xk15mf02EMCe_JpNgMg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Customer` (
    `CustomerID` int  NOT NULL ,
    `firstName` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `email` varchar(25)  NOT NULL ,
    `password` varchar(25)  NOT NULL ,
    `phone` int  NOT NULL ,
    `street` varchar(25)  NOT NULL ,
    `streetdetails` varchar(25)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `state` varchar(25)  NOT NULL ,
    `zip` int  NOT NULL ,
    `orderid` int  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`,`orderid`
    )
);

CREATE TABLE `laundrycarepackage` (
    `laundrycarepackageID` id  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `laundrycarepackageID`
    )
);

CREATE TABLE `choose_service` (
    `servicesID` id  NOT NULL ,
    `laundrycarepackageID` int  NULL ,
    `customwashdetail_ID` int  NULL ,
    `drycleaningID` int  NULL ,
    PRIMARY KEY (
        `servicesID`
    )
);

CREATE TABLE `item` (
    `itemID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `itemID`
    )
);

CREATE TABLE `dryitem` (
    `drycleaningID` int  NOT NULL ,
    `itemID` int  NOT NULL 
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

CREATE TABLE `order` (
    `orderid` int  NOT NULL ,
    `paymentid` int  NOT NULL ,
    `serviceid` int  NOT NULL ,
    `dateorder` date  NOT NULL 
);

ALTER TABLE `Customer` ADD CONSTRAINT `fk_Customer_orderid` FOREIGN KEY(`orderid`)
REFERENCES `order` (`orderid`);

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

ALTER TABLE `order` ADD CONSTRAINT `fk_order_orderid` FOREIGN KEY(`orderid`)
REFERENCES `choose_service` (`servicesID`);

