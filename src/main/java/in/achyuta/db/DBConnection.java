package in.achyuta.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static  Connection con;
	static {
		try {
			Class.forName(DBInfo.DB_DRIVER_CLASS);
			con=DriverManager.getConnection(DBInfo.DB_URL,DBInfo.DB_USERNAME,DBInfo.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private DBConnection(){}
	public static final Connection getConnection() {
		return con;
	}

}
