package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx4 { //조건 검색(BOOKID=1인 것 검색)

	public static void main(String[] args) {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		
		Statement stmt4 = conn.createStatement();
		
		ResultSet rs4 = stmt4.executeQuery("select bookname, bookid from Book "
											+ "where bookid = 1");
		
		while(rs4.next()) { //출력값 넣는 것 잊지 말기
			System.out.print(rs4.getString("bookname"));
			System.out.println(rs4.getString("bookid"));
	}
	
		
	} catch(ClassNotFoundException e) {
		System.out.println("JDBC 드라이버 로드 에러");
	} catch (SQLException e) {
		System.out.println("DB 연결 오류");
		}
	}
}
