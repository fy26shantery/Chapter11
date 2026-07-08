package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SnsDAO {
	private final String DSN = "jdbc:mysql://localhost:3306/sns?useSSL=false";
	private final String USER = "root";
	private final String PASSWORD = "root";

	//データベースの接続情報を返す
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(DSN, USER, PASSWORD);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
