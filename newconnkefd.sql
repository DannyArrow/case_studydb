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
    `payment` int  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`,`payment`
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
    `amount_of_bags` int  NOT NULL ,
    `amount_of_dryitem` int  NOT NULL ,
    `wash&fold$` double  NOT NULL ,
    `drycleaning$` double  NOT NULL ,
    `total_pounds` int  NOT NULL ,
    `laundrycarepackage` varchar(25)  NULL ,
    `drycleaning` boolean  NULL ,
    `pickup` boolean  NOT NULL ,
    `dropoff` boolean  NOT NULL ,
    `cancelorder` boolean  NOT NULL ,
    `driver_on_its_way` boolean  NOT NULL ,
    `pickup_time` varchar(25)  NOT NULL ,
    `pickupdate` date  NOT NULL ,
    `dropoff_time` varchar(25)  NOT NULL ,
    `dropoffdate` date  NOT NULL ,
    `drivers` int  NOT NULL ,
    `personless_pickup` boolean  NOT NULL ,
    `personless_dropoff` boolean  NOT NULL ,
    `pickup_Driver` int  NOT NULL ,
    `dropoff_drivers` int  NOT NULL ,
    `customerid` int  NOT NULL ,
    PRIMARY KEY (
        `orderid`
    )
);

CREATE TABLE `payment` (
    `payment_id` int  NOT NULL ,
    `billingname` varchar(25)  NOT NULL ,
    `paymentamount` int  NOT NULL ,
    `service` varchar(25)  NOT NULL ,
    `credit_card_number` int  NOT NULL ,
    `paymenttype` varchar(25)  NOT NULL ,
    `customerpayment` int  NOT NULL ,
    PRIMARY KEY (
        `payment_id`
    )
);

CREATE TABLE `zipcodelocation` (
    `zipcode` int  NOT NULL ,
    `city` int  NOT NULL ,
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
    `city` int  NOT NULL 
);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_user_D` FOREIGN KEY(`user_D`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `dryitem` ADD CONSTRAINT `fk_dryitem_itemID` FOREIGN KEY(`itemID`)
REFERENCES `item` (`itemID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_user_ID` FOREIGN KEY(`user_ID`)
REFERENCES `order_table` (`orderid`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_soapID` FOREIGN KEY(`soapID`)
REFERENCES `soap` (`soapID`);

ALTER TABLE `customwashdetails` ADD CONSTRAINT `fk_customwashdetails_softnerID` FOREIGN KEY(`softnerID`)
REFERENCES `softner` (`softnerID`);

ALTER TABLE `order_table` ADD CONSTRAINT `fk_order_table_customerid` FOREIGN KEY(`customerid`)
REFERENCES `Customer` (`CustomerID`);

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment_customerpayment` FOREIGN KEY(`customerpayment`)
REFERENCES `Customer` (`customerID`);

ALTER TABLE `customer` ADD CONSTRAINT `fk_customer_zip` FOREIGN KEY(`zip`)
REFERENCES `zipcodelocation` (`zipcode`);

ALTER TABLE `zipcodelocation` ADD CONSTRAINT `fk_zipcodelocation_city` FOREIGN KEY(`city`)
REFERENCES `city/town` (`city/town`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_driverid` FOREIGN KEY(`driverid`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_city` FOREIGN KEY(`city`)
REFERENCES `zipcodelocation` (`city`);

