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
			pstmt.setString(1, "�౸�� ����");
			
			
			ResultSet rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			
			
			while(rs.next()) {
				System.out.println("�÷��� ���� : " + rsmd.getColumnCount());
				System.out.println("2��° �÷� �̸� : " + rsmd.getColumnName(2));
				System.out.println("2��° �÷� Ÿ�� : " + rsmd.getColumnTypeName(2));
				
			}
					
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
		}

	}


}
