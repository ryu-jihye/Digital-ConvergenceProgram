package May_Fifth01_Review;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Scanner;

class Members1{
	Members1(){}
	String userPwd,userName, email, phoneNo;

	public String getUserName() {return userName;}
	public void setUserName(String userName) {this.userName = userName;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getPhoneNo() {return phoneNo;}
	public void setPhoneNo(String phoneNo) {this.phoneNo = phoneNo;}
	public String getUserPwd() {return userPwd;}
	public void setUserPwd(String userPwd) {this.userPwd = userPwd;}

	public Members1(String userPwd, String userName, String email, String phoneNo) {
		super();
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
	}

	@Override
	public String toString() {
		return "Members [userName=" + userName + ", email=" + email + ", phoneNo=" + phoneNo
				+ ", userPwd=" + userPwd + "]";
	}
	

}
public class Contact_number {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		String name = "";

		try {//자바로부터 오라클 테이블에 데이터 입력 insert
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			System.out.println("연결 성공");

			sql="SELECT * FROM MEMBERS"; 
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			Loop :  while (true) {
				System.out.println("1.추가 || 2조회 || 3.수정 || 4. 삭제 || 5. 모두보기 || 6. 종료");
				switch (scan.nextInt()) {
				case 1 : //추가
					System.out.println("입력할 이름, 이메일, 번호, 비밀번호-->");
					sql = "INSERT INTO MEMBERS VALUES (?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, scan.next());
					pstmt.setString(2, scan.next());
					pstmt.setString(3, scan.next());
					pstmt.setString(4, scan.next());
					pstmt.executeQuery();
					break;
				case 2 : //조회
					System.out.println("조회할 이름을 입력-->");
					name = scan.next();
					sql = "SELECT * FROM MEMBERS WHERE USERNAME = '"+name+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						System.out.printf("%s\t%s\t%s\t%s\n"
								,rs.getString(1)
								,rs.getString(2)
								,rs.getString(3)
								,rs.getString(4));
					}
					break;
				case 3 : //수정
					System.out.println("수정할 이름을 입력-->");
					name = scan.next();
					sql = "DELETE * MEMBERS WHERE USERNAME = '"+name+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					System.out.println("새로 입력할 이름, 이메일, 번호, 비밀번호-->");
					sql = "INSERT INTO MEMBERS VALUES (?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, scan.next());
					pstmt.setString(2, scan.next());
					pstmt.setString(3, scan.next());
					pstmt.setString(4, scan.next());
					pstmt.executeQuery();
					break;
				case 4 : //삭제
					System.out.println("삭제할 이름을 입력-->");
					name = scan.next();
					sql = "DELETE FROM MEMBERS WHERE USERNAME = '"+name+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					System.out.println("삭제되었습니다.");
					break;
				case 5 : //모두보기
					sql = "SELECT * FROM MEMBERS";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						Members1 members = new Members1(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
						System.out.println(members.toString());
					}
					break;
				case 6 : //종료
					break Loop;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("연결 오류");
		}
	}
}