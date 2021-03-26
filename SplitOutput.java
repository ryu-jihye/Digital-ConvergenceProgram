package May_Four_05_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class SplitOutput {

	public static void main(String[] args) {
		//아래 문제는 다른 이름의 자바파일로 분리하여 생성할 것
				//사번, 이름, 월급을 저장할 수 있는 테이블 emp1 생성(자바소스에서 작성)
				//사용자가 입력을 원하지 않을 때까지(n 입력) 지속적으로 직원 정보 입력이 가능한 프로그램 만들기
				
					String n;
			        boolean tf = true;

					
					Scanner scan = new Scanner(System.in);
					
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn = DriverManager.getConnection(
								"jdbc:oracle:thin:@localhost:1521:xe",
								"scott","tiger");
					
					//insert
					
					String sql="insert into emp1\r\n"
							+ "values(?, ?, ?)"; 
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					conn.setAutoCommit(false);

					
					while(tf) {

						
						System.out.print("사번, 이름 월급 순서로 입력하시오.");
						pstmt.setInt(1, scan.nextInt());
						pstmt.setString(2, scan.next());
						pstmt.setInt(3, scan.nextInt());
						pstmt.execute();
						
						
						System.out.println("정보가 추가되었습니다.");
						System.out.println("입력을 계속하시겠습니까?(y/n)");
						
						n = scan.next();
			            if( n.equals("n")) {
			               tf = false;
			               conn.rollback();
			            }else if(n.equals("y")) {
			               conn.commit();
			            }else {
			               System.out.println("yn입력을 잘못하였습니다.");
			               continue;
			            }
					
					}
					} catch(ClassNotFoundException e) {
					System.out.println("JDBC 드라이버 로드 에러");
					} catch (SQLException e) {
					e.printStackTrace();
					}
				
				}
			
	}


