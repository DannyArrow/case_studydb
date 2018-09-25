select * from customer;



                       
select * from order_table;

insert into customer (firstName,lastname,email,password,phone,street,streetdetails,city,state,zip)
                       values('danny','sanchez','danny@gmail.com','12345',91232343,'dfdfd ave','hjhhj','white plains','ny',10606);

 insert into order_table(dateorder,amount_of_bags,amount_of_dryitem,washfold$,drycleaning$,total_pounds,laundrycarepackage,drycleaning,pickup,dropoff,cancelorder,driver_on_its_way,pickup_time,pickupdate,dropoff_time,dropoffdate,personless_pickup,personless_dropoff,customerid,pickup_Driver,dropoff_drivers)
                              values ('2018-09-03',null,0,null,null,null,null,false,true,false,false,false,'am','2018-09-06','pm','2018-09-08',true,true,1,0,0);
                              
 insert into payment(billingname,paymentamount,service,credit_card_number,expire_date,payment_type,payment_fk)
values('danilo sanchez', null, 'customwashclothes',1234534532,'02-23','visa',1);
                             


 insert into customwashdetails(whitetemperature,colortemprature,colorheat,whiteheat,soapID,softnerID)
values('high','low','medium','high',1,1);

select * from Customer join order_table on Customer.CustomerID = order_table.orderid;


