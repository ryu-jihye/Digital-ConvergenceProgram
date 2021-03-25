package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx5 {
	public static void main(String[] args) {
		//xe의 book 테이블의 모든 데이터를 출력하는 프로그램과
		//이름이 "피겨 교본"인 책의 데이터를 출력하는 프로그램 작성하기
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt5 = conn.createStatement();
			
			ResultSet rs5 = stmt5.executeQuery("select * from book where bookname = '피겨 교본'");

			while(rs5.next()) {
				System.out.print(rs5.getString("bookid"));
				System.out.print(" " + rs5.getString("bookname"));
				System.out.print(" " + rs5.getString("publisher"));
				System.out.println(" " + rs5.getString("price"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
			}

		
	}
	
}
