package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class ResultSetMetaDataEx_1 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
					
			String sql = "Select * from music where singer = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "bravegirls");
			
			
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			
			
			while(rs.next()) {
				System.out.println("�÷��� ���� : " + rsmd.getColumnCount());
				System.out.println("1��° �÷� �̸� : " + rsmd.getColumnName(1));
				System.out.println("1��° �÷� Ÿ�� : " + rsmd.getColumnTypeName(1));
				
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
		}

	}

}
