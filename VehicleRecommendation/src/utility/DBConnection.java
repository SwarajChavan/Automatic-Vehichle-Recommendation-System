package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static Connection con=null;
	//create static method
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //load Driver			
			//Create connection using jdbc
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/1712","root","");   
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con; // return Connection object
		
		
	}
}
	