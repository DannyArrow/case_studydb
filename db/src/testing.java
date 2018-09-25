import DAO.AdminDAO;

import java.sql.SQLException;

public class testing {

    public static void main(String[] args) throws SQLException {
        AdminDAO adminDAO = new AdminDAO();
        adminDAO.PickupList_assigndriver();
    }
}
