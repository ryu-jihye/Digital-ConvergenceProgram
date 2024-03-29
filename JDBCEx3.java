package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx3 { //특정 열(bookid)만 검색
						// Statement stmt3 = conn.createStatement();
						//ResultSet rs3 = stmt3.executeQuery("select bookid from Book");

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt3 = conn.createStatement();
			
			ResultSet rs3 = stmt3.executeQuery("select bookid from Book");
			
			while(rs3.next()) { //출력값 넣는 것 잊지 말기
				System.out.println(rs3.getString("BOOKID"));
		}
		
			
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}

	}

}
