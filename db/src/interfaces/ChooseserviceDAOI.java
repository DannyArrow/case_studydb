package interfaces;

import Model.CustomWashDetails;
import Model.Order_table;
import Model.Payment;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ChooseserviceDAOI {



public static final String insert_neworder = "insert into order_table(dateorder,amount_of_bags,amount_of_dryitem,washfold_total,drycleaning_total,total_pounds,laundrycarepackage_id,drycleaning," +
        "pickup_status,dropoff_status,cancelorder,driver_on_its_way,pickup_time,pickupdate,dropoff_time,dropoffdate,personless_pickup,personless_dropoff," +
        "pickupnotes,dropoffnotes,customerid,pickup_Driver,dropoff_drivers,payment_id)"+

        "values ('?',null,null,null,null,null,?,?," +
        "true,false,false,false,?,?,?,?,?,?," +
        "?,?, ?,null,null,?)";



public static final String insert_newpayment = "insert into payment(billingname,credit_card_number,expire_date,payment_type)\n" +
        "values('?','?',?,'?')";


public static final String insert_customwashdetails  = " insert into customwashdetails(orderid,whitetemperature,colortemprature,colorheat,whiteheat,soapID,softnerID)\n" +
        "values(?,?,?,?,?,?,?)";



public int insert_order (Order_table table) throws SQLException;

public int insertpayment(Payment payment) throws SQLException;

public int insertinto_customwashdetails(CustomWashDetails customWashDetails) throws SQLException;



/*

    public static final String choose_service = " insert into choose_service (laundrycarepackage,drycleaning) values (?,?)";

    // user choose which service they would like
    public void choose_service(Choose_service choose_service);



    // if user choose the custom wash details service user would have to input information how they want their laundry done
    public static final String insert_customwashdetails = "insert into customwashdetails(customwashdetail_ID,whitetemperature,colortemprature,colorheat,whiteheat,soapID,softnerID) values(?,?,?,?,?,?,?)";
    public void customwashdetail(CustomWashDetails customWashDetails);

    // user can include a dry cleaning item service and add which item they want dry clean (in the future the admin would have the
    // functionality, but for now we leaving it to the customer
    public void dryitem(List<Dryitem> dryitem);


    // find which service user belongs to

    public static String getserivce = " select from choose_service where choose_service.servicesID = ?";
    public Choose_service getserviceofuser(int userid);


    //get the dry item of the user
    public static String dryitem = "select Customer.firstName, Customer.lastname, item.name, item.price from customer join order_table on Customer.CustomerID = order_table.orderid join choose_service on choose_service.servicesID = order_table.serviceid join dryitem on choose_service.servicesID = dryitem.user_D join item on dryitem.itemID = item.itemID where Customer.CustomerID = ?";
    public Dryitem get_userdryitem ();

    // get the custom service of the user
    public static String get_customwashdetails = "select * from customwashdetails where customwashdetails.user_ID = ?";
    public customwashdetail get_custom(int userid);

    // get all service of the user including laundry and washing details
    public static allservice_of_user = "select * from Customer left join order_table on Customer.CustomerID = order_table.orderid left join choose_service on order_table.orderid = choose_service.servicesID left join dryitem on dryitem.user_D = choose_service.servicesID left join item on dryitem.itemID = item.itemID left join customwashdetails on customwashdetails.user_ID = choose_service.servicesID where Customer.CustomerID = ?""
    public static allservice get_allservice(int user_id);

*/


}
