package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SplitInput {

	public static void main(String[] args) {
		//아래 문제는 다른 이름의 자바파일로 분리하여 생성할 것
		//사번, 이름, 월급을 저장할 수 있는 테이블 emp1 생성(자바소스에서 작성)
		//사용자가 입력을 원하지 않을 때까지(n 입력) 지속적으로 직원 정보 입력이 가능한 프로그램 만들기
				
				
				System.out.println("사원, 이름, 월급 순서로 입력하시오");
				Connection conn = null; //초기화
				PreparedStatement pstmt = null; //초기화
				String sql=null; //초기화
				ResultSet rs = null; //초기화
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
					
					//테이블 생성
					sql="create table emp1(\r\n"
							+ "empno number, \r\n"
							+ "ename varchar2(15),\r\n"
							+ "sal number\r\n"
							+ ")"; 
					
					
					pstmt = conn.prepareStatement(sql);
					pstmt.execute();
					
					
					sql = "select * from emp1";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					
					while(rs.next()) {
						System.out.print(rs.getString(1));
						System.out.print(" "+rs.getString(2));
						System.out.println(" " +rs.getString(3));
					}
					
				} catch(ClassNotFoundException e) {
					System.out.println("JDBC 드라이버 로드 에러");
				} catch (SQLException e) {
					e.printStackTrace();
					}

	}

}
