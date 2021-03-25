package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JDBCEX2 { //Book 테이블의 모든 내용 출력 1축구의 역사굿스포츠7000 ~ 16어린왕자땡땡과학서적17000

	public static void main(String[] args) {
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt2 = conn.createStatement();
			
			ResultSet rs2 = stmt2.executeQuery("select * from Book");
			
			while(rs2.next()) { //출력값 넣는 것 잊지 말기
				System.out.print(rs2.getString("BOOKID"));
				System.out.print(rs2.getString("BOOKNAME"));
				System.out.print(rs2.getString("PUBLISHER"));
				System.out.println(rs2.getString("Price"));
		}
		
			
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}

	}

}
