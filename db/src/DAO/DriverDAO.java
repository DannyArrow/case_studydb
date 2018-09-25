package DAO;

import Model.Driver;
import interfaces.DriversDAOI;
import testdatabase.OracleConnection;

import javax.xml.transform.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DriverDAO extends OracleConnection implements DriversDAOI {
    @Override
    public int insertDriver(Driver driver) throws SQLException {
        int key = 0;
        String sql = "insert into driver(firstname,lastname,address,state,city,zipcode,license_id,date_of_birth) " +
                "values(?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        preparedStatement.setString(1,driver.getFirstname());
        preparedStatement.setString(2,driver.getLastname());
        preparedStatement.setString(3,driver.getAddress());
        preparedStatement.setInt(4,driver.getZipcode());
        preparedStatement.setString(5,driver.getLicense_id());
        preparedStatement.setString(6,driver.getDate_of_birth());

         preparedStatement.executeQuery();
        ResultSet rs = preparedStatement.getGeneratedKeys();

        if(rs.next()){
            key = rs.getInt(1);
        }
        getConnection().close();
        return key;
    }

    @Override
    public void assign_driver(int driver, int city,String time) throws SQLException {




    }


}
