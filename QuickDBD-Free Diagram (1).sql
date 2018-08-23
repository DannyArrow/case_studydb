-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/--1Xk15mf02EMCe_JpNgMg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE `Customer` (
    `CustomerID` id  NOT NULL ,
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
        `CustomerID`,`city`,`orderid`
    )
);

CREATE TABLE `order` (
    `orderid` id  NOT NULL ,
    `pickupinstruction` string  NOT NULL ,
    `dropoffinstruction` string  NOT NULL ,
    `attend_pickup` boolean  NOT NULL ,
    `atten_dropoff` boolean  NOT NULL ,
    `pickupdateid` id  NOT NULL ,
    `paymentID` id  NOT NULL ,
    PRIMARY KEY (
        `pickupdateid`,`paymentID`
    )
);

CREATE TABLE `pickupdate` (
    `pickupdateid` id  NOT NULL ,
    `pick_upID` id  NOT NULL ,
    `drop_offID` id  NOT NULL ,
    PRIMARY KEY (
        `pick_upID`,`drop_offID`
    )
);

CREATE TABLE `pickup` (
    `pickupid` id  NOT NULL ,
    `Date` DATE  NOT NULL ,
    `time` String  NOT NULL 
);

CREATE TABLE `dropoff` (
    `dropoffid` id  NOT NULL ,
    `Date` DATE  NOT NULL ,
    `time` String  NOT NULL 
);

CREATE TABLE `status` (
    `orderid` id  NOT NULL ,
    `pick_up` boolean  NOT NULL ,
    `drop_off` boolean  NOT NULL 
);

CREATE TABLE `payment` (
    `paymentID` id  NOT NULL ,
    `payment_date` string  NOT NULL ,
    `payment` amount  NOT NULL ,
    `payment_cardnumber` int  NOT NULL 
);

CREATE TABLE `driverlocation` (
    `driverid` id  NOT NULL ,
    `city` id  NOT NULL 
);

CREATE TABLE `drivers` (
    `driverid` id  NOT NULL ,
    `name` string  NOT NULL ,
    `vehicle` string  NOT NULL ,
    `time` string  NOT NULL ,
    PRIMARY KEY (
        `driverid`
    )
);

CREATE TABLE `zipcode` (
    `code` id  NOT NULL ,
    `city` string  NOT NULL ,
    PRIMARY KEY (
        `code`
    )
);

ALTER TABLE `order` ADD CONSTRAINT `fk_order_orderid` FOREIGN KEY(`orderid`)
REFERENCES `Customer` (`orderid`);

ALTER TABLE `order` ADD CONSTRAINT `fk_order_pickupdateid` FOREIGN KEY(`pickupdateid`)
REFERENCES `pickupdate` (`pickupdateid`);

ALTER TABLE `pickup` ADD CONSTRAINT `fk_pickup_pickupid` FOREIGN KEY(`pickupid`)
REFERENCES `pickupdate` (`pick_upID`);

ALTER TABLE `dropoff` ADD CONSTRAINT `fk_dropoff_dropoffid` FOREIGN KEY(`dropoffid`)
REFERENCES `pickupdate` (`drop_offID`);

ALTER TABLE `status` ADD CONSTRAINT `fk_status_orderid` FOREIGN KEY(`orderid`)
REFERENCES `Customer` (`orderid`);

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment_paymentID` FOREIGN KEY(`paymentID`)
REFERENCES `order` (`paymentID`);

ALTER TABLE `drivers` ADD CONSTRAINT `fk_drivers_driverid` FOREIGN KEY(`driverid`)
REFERENCES `driverlocation` (`driverid`);

ALTER TABLE `zipcode` ADD CONSTRAINT `fk_zipcode_code` FOREIGN KEY(`code`)
REFERENCES `Customer` (`zip`);

ALTER TABLE `zipcode` ADD CONSTRAINT `fk_zipcode_city` FOREIGN KEY(`city`)
REFERENCES `driverlocation` (`city`);

CREATE INDEX `idx_Customer_firstName`
ON `Customer` (`firstName`);

CREATE INDEX `idx_Customer_lastname`
ON `Customer` (`lastname`);

CREATE INDEX `idx_Customer_email`
ON `Customer` (`email`);

CREATE INDEX `idx_Customer_password`
ON `Customer` (`password`);

