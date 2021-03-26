package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedStatementEx2 {

	public static void main(String[] args) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
					
			String sql = "Select * from book where bookname = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "�౸�� ����");
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%s\t\n", 
									rs.getString("bookname"));
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
		}
		
	}

}
