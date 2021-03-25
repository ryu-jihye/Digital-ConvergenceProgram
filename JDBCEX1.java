package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCEX1 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			System.out.println("DB 연결 완료");
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}

	}

}

//DATABAS         JDBC URL
//Oracle          jdbc:oracle:thin:@dbhost:port:sid
//MS SQL Server   jdbc:odbc:DemoDSN
//MySQL           jdbc:mysql://localhost:3306/orcl