
CREATE TABLE `Customer` (
    `CustomerID` int AUTO_INCREMENT NOT NULL ,
    `firstName` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `email` varchar(80)  NOT NULL ,
    `password` varchar(25)  NOT NULL ,
    `phone` long  NOT NULL ,
    `street` varchar(25)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `state` varchar(25)  NOT NULL ,
    `zip` int  NOT NULL ,
    `type_of_building` varchar(25) not null,
    PRIMARY KEY (
        `CustomerID`
    )
);



select * from customer;

insert into citytown values(1,'white plains');

insert into zipcodelocation values(10606,1);

insert into customer (firstName,lastname,email,password,phone,street,city,state,zip,type_of_building)
                       values('danny','sanchez','danny@gmail.com','password',91232343,'20 coolidge ave','white plains','ny',10606,'house');

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

insert into item values(1,'pants',3.25),
(2,'shirt',2.50),
(3,'jacket',4.50);

CREATE TABLE `customwashdetails` (
    `user_ID` int not null,
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
insert into customwashdetails(user_ID,whitetemperature,colortemprature,colorheat,whiteheat,soapID,softnerID)
values(1,'high','low','medium','high',1,1);

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
    `amount_of_bags` int  NULL ,
    `amount_of_dryitem` int  NULL ,
    `washfold_total` double  NULL ,
    `drycleaning_total` double  NULL ,
    `total_pounds` int  NULL ,
    `laundrycarepackage_id` int null,
    `drycleaning` boolean  NULL ,
    `pickup_status` boolean  NOT NULL ,
    `dropoff_status` boolean  NOT NULL ,
    `cancelorder` boolean  NOT NULL ,
    `driver_on_its_way` boolean  NOT NULL ,
    `pickup_time` varchar(25)  NOT NULL ,
    `pickupdate` date  NOT NULL ,
    `dropoff_time` varchar(25)  NOT NULL ,
    `dropoffdate` date  NOT NULL ,
    `personless_pickup` boolean  NOT NULL ,
    `personless_dropoff` boolean  NOT NULL ,
    `pickupnotes` varchar(200)  NOT NULL ,
    `dropoffnotes` varchar(200)  NOT NULL ,
    `customerid` int  NOT NULL ,
    `pickup_Driver` int   NULL ,
    `dropoff_drivers` int   NULL ,
    `payment_id` int  NOT NULL ,
    PRIMARY KEY (
        `orderid`
    )
);
insert into order_table(dateorder,amount_of_bags,amount_of_dryitem,washfold_total,drycleaning_total,total_pounds,laundrycarepackage_id,drycleaning,pickup_status,dropoff_status,cancelorder,driver_on_its_way,pickup_time,pickupdate,dropoff_time,dropoffdate,personless_pickup,personless_dropoff,pickupnotes,dropoffnotes,customerid,pickup_Driver,dropoff_drivers,payment_id)
                              values ('2018-09-03',null,null,null,null,null,1,false,true,false,false,false,'am','2018-09-06','pm','2018-09-08',true,true,'pick up my laundry from the doorm','drop off my laundry with the doorman', 3,null,null,1);


select * from order_table;

Create table `laundrycarepackage` (
      `laundrycarepackage_id` int auto_increment,
	   `package` varchar(50),
       `price` double,
       primary key (
       `laundrycarepackage_id`
       )
);

insert into laundrycarepackage (package,price)
values('natural care laundry package',2.99),
('custom care package',1.50);

                              
                              

CREATE TABLE `payment` (
    `payment_id` int  auto_increment,
    `billingname` varchar(25)  NOT NULL ,
    `credit_card_number` long  NOT NULL ,
    `expire_date` varchar(25)  NOT NULL ,
    `payment_type` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `payment_id`
    )
);
insert into payment(billingname,credit_card_number,expire_date,payment_type)
values('danilo sanchez','12345367766677664532','02-23','visa');

CREATE TABLE `zipcodelocation` (
    `zipcode` int  NOT NULL ,
    `city` int  NOT NULL softnercitytownCustomerdriversoapCustomerlaundrycarepackage
);

insert into zipcodelocation values(10530,2),(10573,3),(10580,4),(10573,5),(10577,5),(10580,5),(10604,5),(10605,5);



CREATE TABLE `citytown` (
    `town` int  NOT NULL ,
    `name` varchar(25)  NOT NULL ,
    PRIMARY KEY (
        `town`
    )
);
insert into citytown values(2,'Scarsdale'),(3,'portchester'),(4,'Rye'),(5,'Harrison');


CREATE TABLE `driver` (
    `driverid` int AUTO_INCREMENT NOT NULL ,
    `firstname` varchar(25)  NOT NULL ,
    `lastname` varchar(25)  NOT NULL ,
    `address` varchar(25)  NOT NULL ,
    `state` varchar(4)  NOT NULL ,
    `city` varchar(25)  NOT NULL ,
    `zipcode` int  NOT NULL ,
    `license_id` varchar(100)  NOT NULL ,
    `date_of_birth` date  NOT NULL ,
    PRIMARY KEY (
        `driverid`
    )
);

insert into driver(firstname,lastname,address,state,city,zipcode,license_id,date_of_birth) values('Jason','Todd','15 ralph ave','NY','White Plains',10606,'1452645634456','1993-02-12');

CREATE TABLE `assign_driver` (
    `driverid` int  NOT NULL ,
    `city` int  NOT NULL,
    `time` varchar(5) not null
);
insert into assign_driver values(1,1,'am');

CREATE TABLE `admin` (
             `adminID` int auto_increment not null,
			`username` varchar(50) not null,
            `password` varchar(50) not null,
            primary key(
            `adminID`
    )
);

insert into admin (username,password) values('theguyjason','flyingtothemoon'),
('dannybatman','ghostoftown455');

select * from admin where username = 'theguyjason' and password = 'flyingtothemoon';
       


alter table `order_table` add constraint `fk_order_table_laundrycarepackage_id` foreign key(`laundrycarepackage_id`)
references `laundrycarepackage`(`laundrycarepackage_id`);

ALTER TABLE `Customer` ADD CONSTRAINT `fk_Customer_zip` FOREIGN KEY(`zip`)
REFERENCES `zipcodelocation` (`zipcode`);

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

ALTER TABLE `order_table` ADD CONSTRAINT `fk_order_table_pickup_Driver` FOREIGN KEY(`pickup_Driver`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `order_table` ADD CONSTRAINT `fk_order_table_dropoff_drivers` FOREIGN KEY(`dropoff_drivers`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `order_table` ADD CONSTRAINT `fk_order_table_payment_id` FOREIGN KEY(`payment_id`)
REFERENCES `payment` (`payment_id`);

ALTER TABLE `zipcodelocation` ADD CONSTRAINT `fk_zipcodelocation_city` FOREIGN KEY(`city`)
REFERENCES `citytown` (`town`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_driverid` FOREIGN KEY(`driverid`)
REFERENCES `driver` (`driverid`);

ALTER TABLE `assign_driver` ADD CONSTRAINT `fk_assign_driver_city` FOREIGN KEY(`city`)
REFERENCES `zipcodelocation` (`city`);