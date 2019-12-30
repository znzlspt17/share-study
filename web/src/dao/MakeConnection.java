package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MakeConnection {

	final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String[] URL = { "jdbc:oracle:thin:@192.168.0.35:1521:orcl",
			"jdbc:oracle:thin:@192.168.0.58:1521:orcl" };
	final static String user = "scott";
	final static String pwd = "tiger";
	Connection conn = null;
	int selector = 0;

	private static MakeConnection mc;

	private MakeConnection() {
	}

	public static MakeConnection getInstance() {

		if (mc == null) {
			mc = new MakeConnection();
		}
		return mc;
	}

	public Connection getConnection() {
		if (conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL[selector], user, pwd);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	public Connection getConnection(Object obj) {
		if (conn == null) {
			try {
				Class.forName(DRIVER);
				if (obj.getClass() == BoardDAO.class)
					selector = 0;
				else if (obj.getClass() == MemoDAO.class)
					selector = 1;

				conn = DriverManager.getConnection(URL[selector], user, pwd);

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

}
