package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedStatementEx_1 {

	public static void main(String[] args) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			//찾고자하는 값 입력
			String sql = "Insert into music values(?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 2);
			pstmt.setString(2, "IU");
			pstmt.setString(3,  "bbb");
			pstmt.setInt(4, 30);
			pstmt.executeQuery();
			
			//찾은 값 출력위함
			pstmt = conn.prepareStatement("Select * from music where mnumber = ?");
			pstmt.setInt(1,2);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%s\t%s\t%s\t%s\t\n", 
									rs.getString(1), //mnumber
									rs.getString(2), //singer
									rs.getString(3), //agency
									rs.getString(4)); //sell
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
		}
		
	}

}
