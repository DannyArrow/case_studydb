package interfaces;

import DAO.DriverDAO;
import Model.Driver;

import java.sql.SQLException;

public interface DriversDAOI {
public static final String insert_newdriver = "insert into driver(firstname,lastname,address,state,city,zipcode,license_id,date_of_birth) " +
        "values(?,?,?,?,?,?,?,?)";

public static final String assign_driver = "insert into assign_driver values(?,?,?)";



public int insertDriver (Driver driver) throws SQLException;

public void assign_driver (int driver, int city,String time) throws SQLException;


}
