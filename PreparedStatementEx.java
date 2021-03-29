package May_Fifth01_Review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class PreparedStatementEx {

	public static void main(String[] args) {
		//String id = request.getParameter("id");
		//String pwd = request.getParameter("pwd");
		
		//Statement
		//Statement stmt = conn.createStatement();
		//stmt.executeUpdate("insert into test values('"+id+"', '"+pwd+"')");
		
		//PreparedStatement
		//PreparedStatement pstmt = conn.preparedStatement("insert into test(id, pwd) values(?, ?)");
		//pstmt.setString(1,  id);
		//pstmt.setString(2, pwd);
		//pstmt.executeUpdate(); //insert 실행문의 작은 따옴 쉼표의 짝을 맞춤
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//DB서버와 연결작업 -> DriverManager 클래스의 getConnection 이용
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "scott","tiger");
			
			String present = "insert into test (id, pwd) values(?, ?)";
			
			//PreparedStatement
			PreparedStatement pstmt = conn.prepareStatement(present);
			

//			Member m1 = new MemberBean();
//			m1.setUserId("user1");
//			m1.setPasswd("123");
//			memberList.add(m1);
//			 
//			Member m2 = new MemberBean();
//			m2.setUserId("user2");
//			m2.setPasswd("456");
//			memberList.add(m2);
//			 
//			Member m3 = new MemberBean();
//			m3.setUserId("user3");
//			m3.setPasswd("789");
//			memberList.add(m3);
//			
			
//			List<Member> memberList = new ArrayList<Member>();
//			int count = memberList.size();
//			Member tMember;
			
			pstmt.setString(1,  "dd");
			pstmt.setString(2,  "44");
			pstmt.executeQuery();
			
			ResultSet rs = pstmt.executeQuery("select * from test");
			
			while(rs.next()) {
				 System.out.printf("%s\t%s\t",
						 rs.getString(1),
						 rs.getString(2));
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			 } catch(ClassNotFoundException e) {
		         System.out.println("JDBC 드라이버 로드 에러");
		     } catch (SQLException e) {
		         System.out.println("DB 연결 오류");
		     }
	
	}

}
