package interfaces;

import Model.Customer;

import java.sql.SQLException;

public interface UserDaoi {

    public static final String registercustomer = "insert into customer (firstName,lastname,email,password,phone,street,city,state,zip,type_of_building) values(?,?,?,?,?,?,?,?,?,?)";
    public static final String loginuser = "select * from Customer where Customer.email = ? and Customer.password = ?";

    public Customer register_customer(Customer customer) throws SQLException;

    public Customer login_user(String email, String password) throws SQLException;



}
