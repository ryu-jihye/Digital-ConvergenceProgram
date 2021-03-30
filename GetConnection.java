package May_Fifth02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

	public static void main(String[] args) {
		

	}

}

//DB와 연결되는 Connection 객체 반환
public static Connection getConnectivity(String url, String dbID, String dbPwd) {
	Connection conn = null;
	try {
		conn = DriverManager.getConnection(url, dbUserID, dbPwd);
	} catch(SQLException e) { //userID : 시퀀스
		e.printStackTrace();
	}
	return conn;
}