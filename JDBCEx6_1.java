package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx6_1 {//���ڵ� �߰�, ����

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt6 = conn.createStatement();
			
			//���ڵ� �߰�
			//stmt6.executeUpdate("INSERT INTO CAFE VALUES"
			//		+ "("+45+", \'�꾾\', \'�꾾�ֽ�ȸ��\', "+2000+")");
			
			
			//������ ���� 
			//stmt6.executeUpdate("update CAFE set cafename = 'Ŀ�Ǻ���' where cafeid =45");
			//ResultSet rs6 = stmt6.executeQuery("select * from cafe");

			//������ ���� - �� �ɰ�� SQL�� Ʈ���ſ��� ���� ����
			stmt6.executeUpdate("delete from cafe where cafename = 'Ŀ�Ǻ���'");
			ResultSet rs6 = stmt6.executeQuery("select * from cafe");
			
			while(rs6.next()) {
				System.out.print(rs6.getString("cafeid"));
				System.out.print(" " + rs6.getString("cafename"));
				System.out.print(" " + rs6.getString("corporation"));
				System.out.println(" " + rs6.getString("price"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
			}


	}

}
