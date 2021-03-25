package May_Four_04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCEx3 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn =
					DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			Statement stmt = conn.createStatement();
			
			//stmt.executeUpdate("INSERT INTO BOOK VALUES(20, 'AAAA', 'BBBB', 13000)");
			stmt.executeUpdate("INSERT INTO BOOK VALUES(30, 'CCCC', 'DDDD', 20000)");
			
			
			
			String sql = String.format("SELECT * " 
										+ "FROM BOOK"
										+ "WHERE BOOKNAME = '%s'", scan.nextLine());
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
					System.out.print(rs.getString("BOOKID"));
					System.out.print(rs.getString("BOOKNAME"));
					System.out.print(rs.getString("PUBLISHER"));
					System.out.println(rs.getString(4));
			}
			
		
			System.out.println("DB ���� �Ϸ�");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC ����̹� �ε� ����");
		} catch(SQLException e) {
			System.out.println("DB ���� ����");
		}
	
	//sql���� ���ڿ��� ��Ŭ�������� ���ڿ��� ������ �� ����(���ڷ� ��޵�)
	}

}