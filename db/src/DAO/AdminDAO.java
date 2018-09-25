package DAO;

import Model.CustomerInArea;
import Model.drivers_customer;
import interfaces.AdminDAOI;
import testdatabase.OracleConnection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;

public class AdminDAO extends OracleConnection implements AdminDAOI {
    @Override
    public boolean loginAdmin(String username, String password) throws SQLException {
        Boolean b = false;
        PreparedStatement preparedStatement = this.getConnection().prepareStatement("select * from admin where username = ? and password = ?");
        ResultSet resultSet = preparedStatement.executeQuery();
       resultSet.next();
           if(resultSet.getString(2) != null){
              b = true;
           }else{
               b = false;
           }
        return b;
    }




    @Override
    public List<CustomerInArea> PickupList_assigndriver() throws SQLException {

        PreparedStatement preparedStatement = getConnection().prepareStatement(querypickup);

            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<CustomerInArea> arrayList = new ArrayList<>();
            while (rs.next()){

  CustomerInArea customerInArea = new CustomerInArea
          (rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7));

  arrayList.add(customerInArea);

            }
        return arrayList;

    }

    @Override
    public void assignDriver(CustomerInArea customer,String type) throws SQLException {
        //(driverid,city,time,date,type_of_delivery)
        PreparedStatement preparedStatement = getConnection().prepareStatement(assign_driver);

        preparedStatement.setInt(1, customer.getDriverID());
        preparedStatement.setInt(2,customer.getCityID());
        preparedStatement.setString(3,customer.getDelivery_time());
        preparedStatement.setDate(4,customer.getDeliverydate());
        preparedStatement.setString(5,type);
        preparedStatement.executeUpdate();
    }

    @Override
    public List<drivers_customer> drivers_customer_delivery(int driverid, String type_of_delivery) throws SQLException {

        PreparedStatement preparedStatement = getConnection().prepareStatement(drivers_customers);

        preparedStatement.setInt(1,driverid);
        preparedStatement.setString(2,type_of_delivery);
        ResultSet resultSet = preparedStatement.executeQuery();
        ArrayList<drivers_customer> list = new ArrayList<>();
        while (resultSet.next()){
         list.add(new drivers_customer(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),
             resultSet.getString(4),resultSet.getDate(5),resultSet.getString(6)));
        }

        return list;
    }

    @Override
    public void update_order_pickupdriver(int driverid, Date pickupdate, int city, String pickuptime) throws SQLException {
        PreparedStatement preparedStatement = getConnection().prepareStatement(update_ordertable_driverpickup);

        preparedStatement.setInt(1,driverid);
        preparedStatement.setDate(2, pickupdate);
        preparedStatement.setInt(3,city);
        preparedStatement.setString(4,pickuptime);

    }

    @Override
    public void update_order_dropoffdriver(int driverid, Date dropoffudate, int city, String dropofftime) throws SQLException {
        PreparedStatement preparedStatement = getConnection().prepareStatement(update_ordertable_driverdropoff);

        preparedStatement.setInt(1,driverid);
        preparedStatement.setDate(2, dropoffudate);
        preparedStatement.setInt(3,city);
        preparedStatement.setString(4,dropofftime);
    }

    @Override
    public List<CustomerInArea> dropoffList_assigndriver() throws SQLException {

        PreparedStatement preparedStatement = getConnection().prepareStatement(querydropoff);
        ResultSet resultSet = preparedStatement.executeQuery();
        ArrayList<CustomerInArea> arrayList = new ArrayList<>();
        while (resultSet.next()){

            CustomerInArea customerInArea = new CustomerInArea
  (resultSet.getInt(1),resultSet.getString(2),resultSet.getDate(3),resultSet.getString(4),resultSet.getString(5),resultSet.getInt(6),resultSet.getInt(7));

            arrayList.add(customerInArea);
        }

        return arrayList;
    }
}

