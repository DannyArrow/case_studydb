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
    PRIMARY KEY (
        `CustomerID`
    )
);

CREATE TABLE `choose_service` (
    `servicesID` int  NOT NULL ,
    `laundrycarepackage` varchar(25)  NULL ,
    `customwashdetail_ID` int  NOT NULL ,
    `drycleaningID` int  NOT NULL ,
    PRIMARY KEY (
        `servicesID`,`customwashdetail_ID`,`drycleaningID`
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
    `customwashdetail_ID` int  NOT NULL ,
    `whitetemperature` varchar(25)  NOT NULL ,
    `colortemprature` varchar(25)  NOT NULL ,
    `colorheat` varchar(25)  NOT NULL ,
    `whiteheat` varchar(25)  NOT NULL ,
    `soapID` int  NOT NULL ,
    `softnerID` int  NOT NULL ,
    `order` int  NOT NULL 
);

CREATE TABLE `soap` (
    `soapID` id  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `soapID`
    )
);

CREATE TABLE `softner` (
    `softnerID` id  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `softnerID`
    )
);

CREATE TABLE `order` (
    `orderid` int  NOT NULL ,
    `paymentid` int  NOT NULL ,
    `serviceid` int  NOT NULL ,
    `dateorder` date  NOT NULL ,
    `customerid` int  NOT NULL ,
    PRIMARY KEY (
        `orderid`
    )
);

ALTER TABLE `choose_service` ADD CONSTRAINT `fk_choose_service_servicesID` FOREIGN KEY(`servicesID`)
REFERENCES `order` (`orderid`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_drycleaningID` FOREIGN KEY(`drycleaningID`)
REFERENCES `choose_service` (`drycleaningID`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_itemID` FOREIGN KEY(`itemID`)
REFERENCES `item` (`itemID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_customwashdetail_ID` FOREIGN KEY(`customwashdetail_ID`)
REFERENCES `choose_service` (`customwashdetail_ID`);

ALTER TABLE `soap` ADD CONSTRAINT `fk_soap_soapID` FOREIGN KEY(`soapID`)
REFERENCES `customwashdetails` (`soapID`);

ALTER TABLE `softner` ADD CONSTRAINT `fk_softner_softnerID` FOREIGN KEY(`softnerID`)
REFERENCES `customwashdetails` (`softnerID`);

ALTER TABLE `order` ADD CONSTRAINT `fk_order_customerid` FOREIGN KEY(`customerid`)
REFERENCES `Customer` (`CustomerID`);

