package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx4 { //���� �˻�(BOOKID=1�� �� �˻�)

	public static void main(String[] args) {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		
		Statement stmt4 = conn.createStatement();
		
		ResultSet rs4 = stmt4.executeQuery("select bookname, bookid from Book "
											+ "where bookid = 1");
		
		while(rs4.next()) { //��°� �ִ� �� ���� ����
			System.out.print(rs4.getString("bookname"));
			System.out.println(rs4.getString("bookid"));
	}
	
		
	} catch(ClassNotFoundException e) {
		System.out.println("JDBC ����̹� �ε� ����");
	} catch (SQLException e) {
		System.out.println("DB ���� ����");
		}
	}
}
