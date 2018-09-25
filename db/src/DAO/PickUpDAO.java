package DAO;

import Model.Pickup;
import interfaces.DriversDAOI;
import interfaces.PickupDAOI;
import testdatabase.OracleConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PickUpDAO extends OracleConnection implements PickupDAOI {
    @Override
    public List<Pickup> query_dateandtime(String pickupdate, String pickup_time) throws SQLException {
        String sql = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
                "from Customer\n" +
                "join order_table on order_table.customerid = Customer.CustomerID\n" +
                "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id " +
                "where order_table.pickupdate = ? and where pickup_time = ?";

        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        preparedStatement.setString(1,pickupdate);
        preparedStatement.setString(2,pickup_time);
        ResultSet resultSet = preparedStatement.executeQuery();
        ArrayList<Pickup> arrayListpickup = new ArrayList<>();
        while(resultSet.next()){
            Pickup pickup = new Pickup();
            pickup.setFirstName(resultSet.getString(1));
            pickup.setLastname(resultSet.getString(2));
            pickup.setPhone(resultSet.getString(3));
            pickup.setStreet(resultSet.getString(4));
            pickup.setCity(resultSet.getString(5));
            pickup.setZip(resultSet.getString(6));
            pickup.setType_of_building(resultSet.getString(7));
            pickup.setDrycleaning(resultSet.getString(8));
            pickup.setPickupnotes(resultSet.getString(9));
            pickup.setPackage(resultSet.getString(10));
            arrayListpickup.add(pickup);
        }

        return arrayListpickup;
    }

    @Override
    public List<Pickup> query_city_date_time(String city, String date, String time) throws SQLException {
        String sql = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
                "from Customer\n" +
                "join order_table on order_table.customerid = Customer.CustomerID\n" +
                "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
                "where customer.city = ? and order_table.pickupdate = ? and pickup_time = ?";
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        preparedStatement.setString(1,city);
        preparedStatement.setString(2,date);
        preparedStatement.setString(3,time);

        ResultSet resultSet = preparedStatement.executeQuery();
        ArrayList<Pickup> arrayListpickup = new ArrayList<>();
        while(resultSet.next()){
            Pickup pickup = new Pickup();
            pickup.setFirstName(resultSet.getString(1));
            pickup.setLastname(resultSet.getString(2));
            pickup.setPhone(resultSet.getString(3));
            pickup.setStreet(resultSet.getString(4));
            pickup.setCity(resultSet.getString(5));
            pickup.setZip(resultSet.getString(6));
            pickup.setType_of_building(resultSet.getString(7));
            pickup.setDrycleaning(resultSet.getString(8));
            pickup.setPickupnotes(resultSet.getString(9));
            pickup.setPackage(resultSet.getString(10));
            arrayListpickup.add(pickup);
        }

        return arrayListpickup;


    }

    @Override
    public List<Pickup> query_bydate(String date) throws SQLException {
        String sql = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
                "from Customer\n" +
                "join order_table on order_table.customerid = Customer.CustomerID\n" +
                "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
                "where order_table.pickupdate = ?";

         PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
         preparedStatement.setString(1,date);

         ResultSet resultSet = preparedStatement.executeQuery();
        ArrayList<Pickup> arrayListpickup = new ArrayList<>();
        while(resultSet.next()){
            Pickup pickup = new Pickup();
            pickup.setFirstName(resultSet.getString(1));
            pickup.setLastname(resultSet.getString(2));
            pickup.setPhone(resultSet.getString(3));
            pickup.setStreet(resultSet.getString(4));
            pickup.setCity(resultSet.getString(5));
            pickup.setZip(resultSet.getString(6));
            pickup.setType_of_building(resultSet.getString(7));
            pickup.setDrycleaning(resultSet.getString(8));
            pickup.setPickupnotes(resultSet.getString(9));
            pickup.setPackage(resultSet.getString(10));
            arrayListpickup.add(pickup);
        }

        return arrayListpickup;
    }

    @Override
    public List<Pickup> query_city(String city) throws SQLException {
        String sql = "select Customer.firstName, Customer.lastname, Customer.phone, Customer.street, Customer.city, Customer.zip, Customer.type_of_building,order_table.drycleaning,order_table.pickupnotes ,laundrycarepackage.package\n" +
                "from Customer\n" +
                "join order_table on order_table.customerid = Customer.CustomerID\n" +
                "join laundrycarepackage on laundrycarepackage.laundrycarepackage_id = order_table.laundrycarepackage_id\n" +
                "where customer.city = ?";
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        preparedStatement.setString(1,city);
        ResultSet resultSet = preparedStatement.executeQuery();

        ArrayList<Pickup> arrayListpickup = new ArrayList<>();
        while(resultSet.next()){
            Pickup pickup = new Pickup();
            pickup.setFirstName(resultSet.getString(1));
            pickup.setLastname(resultSet.getString(2));
            pickup.setPhone(resultSet.getString(3));
            pickup.setStreet(resultSet.getString(4));
            pickup.setCity(resultSet.getString(5));
            pickup.setZip(resultSet.getString(6));
            pickup.setType_of_building(resultSet.getString(7));
            pickup.setDrycleaning(resultSet.getString(8));
            pickup.setPickupnotes(resultSet.getString(9));
            pickup.setPackage(resultSet.getString(10));
            arrayListpickup.add(pickup);
        }

        return arrayListpickup;
    }
}
