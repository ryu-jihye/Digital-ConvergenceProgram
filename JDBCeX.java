package May_Four_04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCeX {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn =
					DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select bookid, bookname " 
											+ "from book " 
											+ "where bookid = 3");
			while(rs.next()) {
				System.out.print(rs.getString("bookid"));
				System.out.println(" " + rs.getString("bookname"));
//				System.out.print(" " + rs.getString("publisher"));
//				System.out.println(" " + rs.getString(3));
			}
			System.out.println("DB 연결 완료");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch(SQLException e) {
			System.out.println("DB 연결 오류");
		}
	
	//sql에서 숫자여도 이클립스에서 문자열로 가져올 수 있음(문자로 취급됨)
	}

}
