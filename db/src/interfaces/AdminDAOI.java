package interfaces;

import Model.CustomerInArea;
import Model.drivers_customer;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public interface AdminDAOI {

    public boolean loginAdmin(String username, String password) throws SQLException;


    public static final String querypickup = "select Count(customer.customerID) as pickup_total, citytown.name, order_table.pickupdate, order_table.pickup_time,driver.firstname as driver, driver.driverid, citytown.town\n" +
            "from customer \n" +
            "join order_table on customer.customerID = order_table.customerID\n" +
            "join citytown on citytown.town = customer.city\n" +
            "LEFT join driver on order_table.pickup_Driver = driver.driverid\n" +
            " group by order_table.pickup_Driver, customer.city,order_table.pickup_time,order_table.pickupdate\n" +
            " order by order_table.pickupdate,order_table.pickup_time ";

   public static final String querydropoff =  "select Count(customer.customerID) as pickup_total, citytown.name as city, order_table.dropoffdate, order_table.dropoff_time, driver.firstname as driver, driver.driverid, citytown.town\n" +
           "from customer \n" +
           "join order_table on customer.customerID = order_table.customerID\n" +
           "join citytown on citytown.town = customer.city\n" +
           "LEFT join driver on order_table.dropoff_drivers = driver.driverid\n" +
           " group by order_table.dropoff_drivers, customer.city,order_table.dropoff_time,order_table.dropoffdate\n" +
           "  order by order_table.dropoffdate,order_table.dropoff_time";

   public static final String assign_driver =  "insert into assign_driver(driverid,city,time,date,type_of_delivery)" +
           "values(?,?,?,?,?)";

   public static final String drivers_customers = "select customer.firstname, Customer.lastname, citytown.name, Customer.street,order_table.pickupdate, order_table.pickup_time from driver \n" +
           "join assign_driver on assign_driver.driverid = driver.driverid\n" +
           "join Customer on Customer.city = assign_driver.city\n" +
           "join order_table on order_table.orderid = Customer.CustomerID\n" +
           "join citytown on citytown.town = Customer.city\n" +
           "where  driver.driverid = ? \n" +
           "and assign_driver.type_of_delivery = ?";

   public static final String update_ordertable_driverpickup = "UPDATE order_table \n" +
           "JOIN  Customer \n" +
           "ON Customer.CustomerID = order_table.customerid\n" +
           "SET order_table.pickup_Driver  = ? \n" +
           "Where order_table.pickupdate = ? and  customer.city = ? and order_table.pickup_time = ?";

    public static final String update_ordertable_driverdropoff = "UPDATE order_table \n" +
            "JOIN  Customer \n" +
            "ON Customer.CustomerID = order_table.customerid\n" +
            "SET order_table.dropoff_drivers  = ? \n" +
            "Where order_table.dropoffdate = ? and  customer.city = ? and order_table.dropoff_time = ?";


    // list of pickups with dates and city to assign to the driver
    public List<CustomerInArea> PickupList_assigndriver() throws SQLException;
    // list of dropoff with dates and city to assign to the driver
    public List<CustomerInArea> dropoffList_assigndriver() throws SQLException;

    public void assignDriver(CustomerInArea customerInArea,String type) throws SQLException;

    public List<drivers_customer> drivers_customer_delivery(int driverid, String type_of_delivery) throws SQLException;

    public void update_order_pickupdriver(int driverid, Date pickupdate, int city, String pickuptime) throws SQLException;


    public void update_order_dropoffdriver(int driverid, Date dropoffudate, int city, String dropofftime) throws SQLException;



}
