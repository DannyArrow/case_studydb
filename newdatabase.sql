-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/--1Xk15mf02EMCe_JpNgMg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Customer` (
    `CustomerID` int AUTO_INCREMENT NOT NULL ,
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
    `servicesID` int AUTO_INCREMENT NOT NULL ,
    `laundrycarepackage` varchar(25)  NULL ,
    `drycleaning` boolean  NULL ,
    PRIMARY KEY (
        `servicesID`
    )
);

CREATE TABLE `dryitem` (
    `user_D` int  NULL ,
    `itemID` int  NULL 
);

CREATE TABLE `item` (
    `itemID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `itemID`
    )
);

CREATE TABLE `customwashdetails` (
    `user_ID` int  NOT NULL ,
    `whitetemperature` varchar(25)  NULL ,
    `colortemprature` varchar(25)  NULL ,
    `colorheat` varchar(25)  NULL ,
    `whiteheat` varchar(25)  NULL ,
    `soapID` int  NULL ,
    `softnerID` int  NULL ,
    PRIMARY KEY (
        `user_ID`
    )
);

CREATE TABLE `soap` (
    `soapID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `soapID`
    )
);

CREATE TABLE `softner` (
    `softnerID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `softnerID`
    )
);

CREATE TABLE `order_table` (
    `orderid` int AUTO_INCREMENT NOT NULL ,
    `dateorder` date  NOT NULL ,
    PRIMARY KEY (
        `orderid`
    )
);

CREATE TABLE `payment` (
    `payment_id` int  NOT NULL ,
    `firstname` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `billingname` varchar(25)  NOT NULL ,
    `paymentamount` int  NOT NULL ,
    `service` varchar(25)  NOT NULL ,
    `last_4_digits` int  NOT NULL ,
    `paymenttype` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `payment_id`
    )
);

CREATE TABLE `history` (
    `historyid` int  NOT NULL ,
    `orderdate` date  NOT NULL ,
    `pickup_date` date  NOT NULL ,
    `dropoff_date` date  NOT NULL ,
    `pickuptime` varchar(25)  NOT NULL ,
    `dropofftime` varchar(25)  NOT NULL ,
    `total_amount` double  NOT NULL ,
    `service` varchar(25)  NOT NULL ,
    `dryitem` varchar(25)  NOT NULL ,
    `drivername` varchar(25)  NOT NULL ,
    `address` varchar(25)  NOT NULL ,
    `zipcode` int  NOT NULL ,
    `doorman` boolean  NOT NULL ,
    `customer_id` int  NOT NULL ,
    PRIMARY KEY (
        `historyid`
    )
);

CREATE TABLE `delivery` (
    `deliveryid` int  NOT NULL ,
    `pickup_time` varchar(25)  NOT NULL ,
    `pickupdate` date  NOT NULL ,
    `dropoff_time` varchar(25)  NOT NULL ,
    `dropoffdate` date  NOT NULL ,
    PRIMARY KEY (
        `deliveryid`
    )
);

CREATE TABLE `status_delivery` (
    `statusid` int  NOT NULL ,
    `pickup` boolean  NOT NULL ,
    `dropoff` bolean  NOT NULL ,
    `cancelorder` boolean  NOT NULL ,
    `driver_on_its_way` boolean  NOT NULL ,
    PRIMARY KEY (
        `statusid`
    )
);

CREATE TABLE `zipcodelocation` (
    `zipcode` int  NOT NULL ,
    `town/city` int  NOT NULL ,
    PRIMARY KEY (
        `zipcode`
    )
);

CREATE TABLE `city/town` (
    `city/town` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `city/town`
    )
);

CREATE TABLE `driver` (
    `driverid` int  NOT NULL ,
    `firstname` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `address` varchar(25)  NOT NULL ,
    `state` varchar(25)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `zipcode` int  NOT NULL ,
    `license_id` int  NOT NULL ,
    `date_of_birth` date  NOT NULL ,
    PRIMARY KEY (
        `driverid`
    )
);

CREATE TABLE `assign_driver` (
    `driverid` int  NOT NULL ,
    `city/town_id` int  NOT NULL 
);

ALTER TABLE `Customer` ADD CONSTRAINT `fk_Customer_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `choose_service` ADD CONSTRAINT `fk_choose_service_servicesID` FOREIGN KEY(`servicesID`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_user_D` FOREIGN KEY(`user_D`)
REFERENCES `choose_service` (`servicesID`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_itemID` FOREIGN KEY(`itemID`)
REFERENCES `item` (`itemID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_user_ID` FOREIGN KEY(`user_ID`)
REFERENCES `choose_service` (`servicesID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_soapID` FOREIGN KEY(`soapID`)
REFERENCES `soap` (`soapID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_softnerID` FOREIGN KEY(`softnerID`)
REFERENCES `softner` (`softnerID`);

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment_payment_id` FOREIGN KEY(`payment_id`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `history` ADD CONSTRAINT `fk_history_customer_id` FOREIGN KEY(`customer_id`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `delivery` ADD CONSTRAINT `fk_delivery_deliveryid` FOREIGN KEY(`deliveryid`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `status_delivery` ADD CONSTRAINT `fk_status_delivery_statusid` FOREIGN KEY(`statusid`)
REFERENCES `delivery` (`deliveryid`);

ALTER TABLE `zipcodelocation` ADD CONSTRAINT `fk_zipcodelocation_zipcode` FOREIGN KEY(`zipcode`)
REFERENCES `Customer` (`zip`);

ALTER TABLE `zipcodelocation` ADD CONSTRAINT `fk_zipcodelocation_town/city` FOREIGN KEY(`town/city`)
REFERENCES `city/town` (`city/town`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_driverid` FOREIGN KEY(`driverid`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_city/town_id` FOREIGN KEY(`city/town_id`)
REFERENCES `city/town` (`city/town`);

