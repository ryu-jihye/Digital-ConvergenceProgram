package May_Four_04_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx6_1 {//레코드 추가, 삭제

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			Statement stmt6 = conn.createStatement();
			
			//레코드 추가
			//stmt6.executeUpdate("INSERT INTO CAFE VALUES"
			//		+ "("+45+", \'쥬씨\', \'쥬씨주식회사\', "+2000+")");
			
			
			//데이터 수정 
			//stmt6.executeUpdate("update CAFE set cafename = '커피베이' where cafeid =45");
			//ResultSet rs6 = stmt6.executeQuery("select * from cafe");

			//데이터 삭제 - 안 될경우 SQL의 트리거에서 오류 삭제
			stmt6.executeUpdate("delete from cafe where cafename = '커피베이'");
			ResultSet rs6 = stmt6.executeQuery("select * from cafe");
			
			while(rs6.next()) {
				System.out.print(rs6.getString("cafeid"));
				System.out.print(" " + rs6.getString("cafename"));
				System.out.print(" " + rs6.getString("corporation"));
				System.out.println(" " + rs6.getString("price"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC 드라이버 로드 에러");
		} catch (SQLException e) {
			System.out.println("DB 연결 오류");
			}


	}

}
