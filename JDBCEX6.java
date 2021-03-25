package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEX6 {//레코드 추가, 변경, 삭제

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt6 = conn.createStatement();
			
			
			//레코드 추가
//			stmt6.executeUpdate("INSERT INTO BOOK VALUES"
//					+ "("+17+", \'AAAA\', \'BBBB\', "+1000+")"); 
			
			//데이터 변경
			//stmt6.executeUpdate("update book set bookname = 'OOOO' where bookid =30");
			
			//데이터 삭제
			stmt6.executeUpdate("delete from book where bookname = 'AAAA'");
			
			ResultSet rs6 = stmt6.executeQuery("select * from BOOK");

			while(rs6.next()) {
				System.out.print(rs6.getString("bookid"));
				System.out.print(" " + rs6.getString("bookname"));
				System.out.print(" " + rs6.getString("publisher"));
				System.out.println(" " + rs6.getString("price"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
			}


	}

}
