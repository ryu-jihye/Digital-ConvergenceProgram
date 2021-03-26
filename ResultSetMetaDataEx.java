package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class ResultSetMetaDataEx {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
					
			String sql = "Select * from book where bookname = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "축구의 역사");
			
			
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			
			
			while(rs.next()) {
				System.out.println("컬럼의 개수 : " + rsmd.getColumnCount());
				System.out.println("2번째 컬럼 이름 : " + rsmd.getColumnName(2));
				System.out.println("2번째 컬럼 타입 : " + rsmd.getColumnTypeName(2));
				
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}

	}


}
