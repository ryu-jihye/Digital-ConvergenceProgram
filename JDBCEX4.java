package May_Four_04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCEX4 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn =
					DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			Statement stmt = conn.createStatement();
			
			stmt.executeUpdate("update book" +
								"set bookname = 'ffff' where bookid=13");
//			stmt.executeUpdate("delete from book " +
//									"where bookid = 13");
			
			
			String sql = String.format("SELECT * " 
										+ "FROM BOOK "
										+ "WHERE BOOKNAME = '%s'", scan.nextLine());
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
					System.out.print(rs.getString("BOOKID"));
					System.out.print(rs.getString("BOOKNAME"));
					System.out.print(rs.getString("PUBLISHER"));
					System.out.println(rs.getString(4));
			}
			
		
			System.out.println("DB 연결 완료");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch(SQLException e) {
			System.out.println("DB 연결 오류");
		}
	
	//sql에서 숫자여도 이클립스에서 문자열로 가져올 수 있음(문자로 취급됨)
	}

}
