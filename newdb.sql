CREATE TABLE `Customer` (
    `CustomerID` int AUTO_INCREMENT NOT NULL ,
    `firstName` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `email` varchar(25)  NOT NULL ,
    `password` varchar(500)  NOT NULL ,
    `phone` int  NOT NULL ,
    `street` varchar(25)  NOT NULL ,
    `streetdetails` varchar(25)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `state` varchar(25)  NOT NULL ,
    `zip` int  NOT NULL ,
    `type_building` varchar(50),
    PRIMARY KEY (
        `CustomerID`
    )
);



insert into customer (firstName,lastname,email,password,phone,street,streetdetails,city,state,zip)
                       values('danny','sanchez','danny@gmail.com','12345',91232343,'dfdfd ave','hjhhj','white plains','ny',10606);

CREATE TABLE `dryitem` (
    `user_D` int  NULL ,
    `itemID` int  NULL 
);

insert into dryitem values(1,1),
(1,2);

CREATE TABLE `item` (
    `itemID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `itemID`
    )
);
insert into item values(1,'pants',3.25);
insert into item values(2,'shirt',2.50);
insert into item values(3,'jacket',4.50);



CREATE TABLE `customwashdetails` (
    `user_ID` int  auto_increment not  NULL ,
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

insert into customwashdetails(whitetemperature,colortemprature,colorheat,whiteheat,soapID,softnerID)
values('high','low','medium','high',1,1);

CREATE TABLE `soap` (
    `soapID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `soapID`
    )
);

insert into soap values('1','dove',2.50);

CREATE TABLE `softner` (
    `softnerID` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    `price` double  NOT NULL ,
    PRIMARY KEY (
        `softnerID`
    )
);

insert into softner values('1','softner',2.50);

CREATE TABLE `order_table` (
    `orderid` int AUTO_INCREMENT NOT NULL ,
    `dateorder` date  NOT NULL ,
    `amount_of_bags` int   NULL ,
    `amount_of_dryitem` int  NULL ,
    `washfold$` double   NULL ,
    `drycleaning$` double   NULL ,
    `total_pounds` int   NULL ,
    `laundrycarepackage` varchar(25)  NULL ,
    `drycleaning` boolean,
    `pickup` boolean  NOT NULL ,
    `dropoff` boolean  NOT NULL ,
    `cancelorder` boolean  NOT NULL ,
    `driver_on_its_way` boolean  NOT NULL ,
    `pickup_time` varchar(25)  NOT NULL ,
    `pickupdate` date  NOT NULL ,
    `dropoff_time` varchar(25)  NOT NULL ,
    `dropoffdate` date  NOT NULL ,
    `personless_pickup` boolean  NOT NULL ,
    `personless_dropoff` boolean  NOT NULL ,
    `customerid` int  NOT NULL ,
    `pickup_Driver` int  NOT NULL ,
    `dropoff_drivers` int  NOT NULL,
    PRIMARY KEY (
        `orderid`
    )
);
 insert into order_table(dateorder,amount_of_bags,amount_of_dryitem,washfold$,drycleaning$,total_pounds,laundrycarepackage,drycleaning,pickup,dropoff,cancelorder,driver_on_its_way,pickup_time,pickupdate,dropoff_time,dropoffdate,personless_pickup,personless_dropoff,customerid,pickup_Driver,dropoff_drivers)
                              values ('2018-09-03',null,0,null,null,null,null,false,true,false,false,false,'am','2018-09-06','pm','2018-09-08',true,true,1,0,0);
                              
                              
CREATE TABLE `payment` (
    `payment_id` int auto_increment  NOT NULL ,
    `billingname` varchar(25)  NOT NULL ,
    `paymentamount` int   NULL ,
    `service` varchar(50)  NOT NULL ,
    `credit_card_number` int  NOT NULL ,
    `expire_date` varchar(25) not null,
    `payment_type` varchar(25)  NOT NULL ,
     `payment_fk` int not null,
    PRIMARY KEY (
        `payment_id`
    )
);
insert into payment(billingname,paymentamount,service,credit_card_number,expire_date,payment_type,payment_fk)
values('danilo sanchez', null, 'customwashclothes',1234534532,'02-23','visa',1);

CREATE TABLE `zipcodelocation` (
    `zipcode` int  NOT NULL ,
    `city` int  NOT NULL ,
    PRIMARY KEY (
        `zipcode`
    )
);
insert into zipcodelocation values (10606,1);

CREATE TABLE `citytown` (
    `town` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `town`
    )
);

insert into citytown values (1,'white plains');



CREATE TABLE `driver` (
    `driverid` int auto_increment  NOT NULL ,
    `firstname` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `address` varchar(25)  NOT NULL ,
    `state` varchar(25)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `zipcode` int  NOT NULL ,
    `license_id` varchar(100)  NOT NULL ,
    `date_of_birth` date  NOT NULL ,
    PRIMARY KEY (
        `driverid`
    )
);

insert into driver(firstname,lastname,address,state,city,zipcode,license_id,date_of_birth)
values('josh','suearez','20 cooldge ave','ny','white plains',10606,2493245434,'1992-02-08');

CREATE TABLE `assign_driver` (
    `driverid` int  NOT NULL ,
    `city` int  NOT NULL 
);

insert into assign_driver values(1,1);


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

ALTER TABLE `payment` ADD CONSTRAINT `fk_payment_payment_fk` FOREIGN KEY(`payment_fk`)
REFERENCES `Customer` (`customerid`);

ALTER TABLE `customer` ADD CONSTRAINT `fk_customer_zip` FOREIGN KEY(`zip`)
REFERENCES `zipcodelocation` (`zipcode`);

ALTER TABLE `zipcodelocation` ADD CONSTRAINT `fk_zipcodelocation_city` FOREIGN KEY(`city`)
REFERENCES `citytown` (`town`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_driverid` FOREIGN KEY(`driverid`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_city` FOREIGN KEY(`city`)
REFERENCES `zipcodelocation` (`city`);
