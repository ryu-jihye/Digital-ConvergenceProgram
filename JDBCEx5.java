package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx5 {
	public static void main(String[] args) {
		//xe�� book ���̺��� ��� �����͸� ����ϴ� ���α׷���
		//�̸��� "�ǰ� ����"�� å�� �����͸� ����ϴ� ���α׷� �ۼ��ϱ�
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt5 = conn.createStatement();
			
			ResultSet rs5 = stmt5.executeQuery("select * from book where bookname = '�ǰ� ����'");

			while(rs5.next()) {
				System.out.print(rs5.getString("bookid"));
				System.out.print(" " + rs5.getString("bookname"));
				System.out.print(" " + rs5.getString("publisher"));
				System.out.println(" " + rs5.getString("price"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch (SQLException e) {
			System.out.println("DB ���� ����");
			}

		
	}
	
}
