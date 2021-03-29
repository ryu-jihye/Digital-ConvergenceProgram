package May_Fifth01_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCEx2 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//DB서버와 연결작업 -> DriverManager 클래스의 getConnection 이용
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "scott","tiger");
			
			//Statement 생성하기 : 자바프로그램은 DB쪽으로 SQL문을 전송하고 DB는 처리된 결과를 다시 자바 프로그램에 전달
			Statement stmt = conn.createStatement();
			
			//SQL 실행하기 
			//test 테이블 실행하기
			stmt.executeUpdate("create table test"
					+ "(id varchar2(5), pwd varchar(5))");
			
			stmt.executeUpdate("insert into test values('aa','11')");
			stmt.executeUpdate("insert into test values('bb','22')");
			stmt.executeUpdate("insert into test values('cc','33')");
			
			ResultSet rs = stmt.executeQuery("select * from test");
			
			while(rs.next()) {
				System.out.print(rs.getString("id")+":"+rs.getString(2)); 
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			 } catch(ClassNotFoundException e) {
		         System.out.println("JDBC 드라이버 로드 에러");
		     } catch (SQLException e) {
		         System.out.println("DB 연결 오류");
		     }
	}

}
