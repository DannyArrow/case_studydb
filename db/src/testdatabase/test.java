package testdatabase;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class test {
    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        try {
           connection = getConnection();
           if (connection != null){
               System.out.println("Connection established");
           }
        } catch (Exception e){

            e.printStackTrace();
        }finally {

        }

        OracleConnection oracleConnection = new OracleConnection();
        Connection connection1 = oracleConnection.getConnection();
        if(connection1 != null){
            System.out.println("it workks!!!!");
        }
       String sql = "select * from customer";

        Statement statement = connection.createStatement();
        ResultSet rs =statement.executeQuery(sql);
        List<String> emails= new ArrayList<String>();
        while(rs.next()) {
            emails.add(rs.getString(1));
            System.out.println(rs.getString(2));
        }

    }

    public static Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connect = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";

            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost/new_schema","root","123456");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }

}


