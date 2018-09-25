package DAO;

import Model.Customer;
import com.mysql.jdbc.Statement;
import interfaces.UserDaoi;
import testdatabase.OracleConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends OracleConnection implements UserDaoi {

    @Override
    public Customer register_customer(Customer customer) throws SQLException {
      String sql =  "insert into customer (firstName,lastname,email,password,phone,street,city,state,zip,type_of_building) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = getConnection().prepareStatement(registercustomer, Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1,customer.getFirstName());
        preparedStatement.setString(2,customer.getLastname());
        preparedStatement.setString(3,customer.getEmail());
        preparedStatement.setString(4,customer.getPassword());
        preparedStatement.setLong(5,customer.getPhone());
        preparedStatement.setString(6,customer.getStreet());
        preparedStatement.setInt(7,customer.getCity());
        preparedStatement.setString(8,customer.getState());
        preparedStatement.setInt(9,customer.getZip());
        preparedStatement.setString(10,customer.getType_of_building());
        preparedStatement.executeUpdate();
        ResultSet key = preparedStatement.getGeneratedKeys();
        if(key.next()) {
            customer.setCustomerID(key.getInt(1));
        }

        return customer;
    }

    @Override
    public Customer login_user(String email, String password) throws SQLException {

        String sql = "select * from Customer where Customer.email = ? and Customer.password = ?";
        PreparedStatement preparedStatement = getConnection().prepareStatement(loginuser);
        preparedStatement.setString(1,email);
        preparedStatement.setString(2,password);
        ResultSet resultSet = preparedStatement.executeQuery();

        Customer customer = new Customer();
        while(resultSet.next()){
            customer.setCustomerID(resultSet.getInt(1));
            customer.setFirstName(resultSet.getString(2));
            customer.setLastname(resultSet.getString(3));
            customer.setEmail(resultSet.getString(4));
            customer.setPassword(resultSet.getString(5));
            customer.setPhone(resultSet.getLong(6));
            customer.setStreet(resultSet.getString(7));
            customer.setCity(resultSet.getInt(8));
            customer.setState(resultSet.getString(9));
            customer.setZip(resultSet.getInt(10));
            customer.setType_of_building(resultSet.getString(11));

        }


        return customer;
    }
}
