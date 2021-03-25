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
			System.out.println("DB ���� �Ϸ�");
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
		}

	}

}

//DATABAS         JDBC URL
//Oracle          jdbc:oracle:thin:@dbhost:port:sid
//MS SQL Server   jdbc:odbc:DemoDSN
//MySQL           jdbc:mysql://localhost:3306/orcl