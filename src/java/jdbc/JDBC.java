package jdbc;

import java.sql.*;
import static jdbc.DatabaseInfo.DBURL;
import static jdbc.DatabaseInfo.DRIVERNAME;
import static jdbc.DatabaseInfo.PASSDB;
import static jdbc.DatabaseInfo.USERDB;

public class JDBC {


    public static Connection getConnection() {
		   try{ 
            Class.forName(DRIVERNAME); 
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();

                System.out.println("Close MySQL successfully!");
            }
        } catch (SQLException ex) {
            System.err.println("Close MySQL failure!");
        }
    }
}
