package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx3_1 {//특정 열(cafename, price)만 검색
						//

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt3 = conn.createStatement();
			
			ResultSet rs3 = stmt3.executeQuery("select cafename, price from cafe");
			
			while(rs3.next()) { //출력값 넣는 것 잊지 말기
				System.out.print(rs3.getString("cafename"));
				System.out.println(rs3.getString("price"));
		}
		
			
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}

	}

}
