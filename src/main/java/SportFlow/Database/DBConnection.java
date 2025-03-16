package SportFlow.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/db_SportFlow?allowPublicKeyRetrieval=true&useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "admin";
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
