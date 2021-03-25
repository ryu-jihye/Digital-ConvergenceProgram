package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx2_1 { //CAFE 테이블의 모든 내용 출력
						//Statement stmt2 = conn.createStatement();
					    //ResultSet rs2 = stmt2.executeQuery("select * from cafe");

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt2 = conn.createStatement();
			
			ResultSet rs2 = stmt2.executeQuery("select * from cafe");
			
			while(rs2.next()) { //출력값 넣는 것 잊지 말기
				System.out.print(rs2.getString("CAFEID"));
				System.out.print(rs2.getString("CAFENAME"));
				System.out.print(rs2.getString("CORPORATION"));
				System.out.println(rs2.getString("PRICE"));
		}
		
			
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}
	}

}
