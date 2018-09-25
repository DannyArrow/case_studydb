package interfaces;

import Model.Pickup;

import java.sql.SQLException;
import java.util.List;

public interface PickupDAOI {

 public final  String pickup_query_dateandtime = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
           "from Customer\n" +
           "join order_table on order_table.customerid = Customer.CustomerID\n" +
           "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id " +
           "where order_table.pickupdate = ? and where pickup_time = ?";


   String sort_querybycity = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
           "from Customer\n" +
           "join order_table on order_table.customerid = Customer.CustomerID\n" +
           "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
           "where customer.city = ?";

    String query_by_city_date_time = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
            "from Customer\n" +
            "join order_table on order_table.customerid = Customer.CustomerID\n" +
            "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
            "where customer.city = ? and order_table.pickupdate = ? and pickup_time = ?";

    String query_bydate = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
            "from Customer\n" +
            "join order_table on order_table.customerid = Customer.CustomerID\n" +
            "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
            "where order_table.pickupdate = ?";



 public List<Pickup> query_dateandtime(String pickupdate, String pickup_time) throws SQLException;

 public List<Pickup> query_city_date_time(String city, String date, String time) throws SQLException;

 public List<Pickup> query_bydate(String date) throws SQLException;

 public List<Pickup> query_city(String city) throws SQLException;



}
