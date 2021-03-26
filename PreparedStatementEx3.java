package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedStatementEx3 {

	public static void main(String[] args) {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			
			//ã���� �ϴ� �� �Է�
			String sql = "Insert into book values(?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
//			pstmt.setString(2, "�ູ�� ����");
//			pstmt.setString(3,  "���ϵ����ǻ�");
//			pstmt.setInt(4, 12000);
			pstmt.executeQuery();
			
			//ã���� �ϴ� �� ���
			pstmt = conn.prepareStatement("Select * from book where bookid = ?");
			pstmt.setInt(1, 33);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%s\t%s\t%s\t%s\n", 
						rs.getString("bookid"),
						rs.getString(2),
						rs.getString(3),
						rs.getString("price"));
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
		}
		
	}

}
