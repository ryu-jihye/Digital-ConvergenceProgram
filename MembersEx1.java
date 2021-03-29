package May_Fifth01;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.sun.jdi.connect.spi.Connection;

class Members1 {//연습문제
	
	int userID;
	String userName, email, phoneNo;
	String userPwd, regDate;

	public Members1(int userID, 
					String userName, 
					String email, 
					String phoneNo, 
					String userPwd, 
					String regDate) {
		this.userID = userID; this.userName = userName;
		this.email = email; this.phoneNo = phoneNo;
		this.userPwd = userPwd; this.regDate = regDate;
		}
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Members [userName=" + userName + ", email=" + email + ", phoneNo=" + phoneNo
				+ ", userPwd=" + userPwd + "]";
	}
}
public class MembersEx1 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUserId = "scott";
		String dbPwd = "tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userID = null;
		String sql = "";
		int menu = 0; //선택된 메뉴 저장용
		Members1 mem = null;
	
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = (Connection) DriverManager.getConnection(url, dbUserId, dbPwd);
		
		
		BREAK:
		while(true) {
			System.out.println("=================================");
			System.out.println("1.추가 || 2조회 || 3.수정 || 4. 삭제 || 5. 모두보기 || 6. 종료");
			System.out.println("=================================");
			System.out.println("메뉴를 선택하시오 >> ");
			menu = scan.nextInt();
			
			switch(menu) {
			case 1: //추가작업 -> INSERT INTO MEMBERS VALUES(SEQ 
				System.out.println("비밀전호, 이름, 이메일, 전화번호 순으로 입력하시오");
				sql = "insert into members "
						+ "values(seq_members.nextval, ?, ?, ?, ?, sysdate)";
				pstmt = ((java.sql.Connection) conn).prepareStatement(sql);
				pstmt.setString(1, scan.next());
				pstmt.setString(2, scan.next());
				pstmt.setString(3, scan.next());
				pstmt.setString(4, scan.next());
				pstmt.executeUpdate();
				
				break;
			case 2: //이름으로 검색
				System.out.println("검색할 회원의 이름을 입력하시오 >>");
				sql = "select * from emmebrs where username like '%' || ? || ;%'";
				pstmt = ((java.sql.Connection) conn).prepareStatement(sql);
				pstmt.setString(1,  scan.next());
				rs = pstmt.executeQuery();
				while(rs.next()) {//Members1 객체의 toString()이 호출된 형태
					//Members1(int userID,
							//String userPwd,
							//String userName,
							//String email,
							//String phoneNo,
							//String regDate)
					mem = new Members1(rs.getString("userId"),
									rs.getString("userPwd"),
									rs.getString("email"),
									rs.getString("phoneNo"),
									rs.getString("regDate")
							);
				break;
			case 3: //아이디와 비밀번호 입력받아 수정
				break;
			case 4: //아이디어와 비밀번호 입력받아 삭제
				break;
			case 5: //디비에 저장된 내용 모두 삭제
				sql = "select * from members";
				pstmt = ((java.sql.Connection) conn).prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {//Members1 객체의 toString()이 호출된 형태
					//Members1(int userID,
							//String userPwd,
							//String userName,
							//String email,
							//String phoneNo,
							//String regDate)
					mem = new Members(rs.getString("userId"),
									rs.getString("userPwd"),
									rs.getString("email"),
									rs.getString("phoneNo"),
									rs.getString("regDate")
							);
					System.out.println(mem.toString());
				}
				break;
			case 6:
				break BREAK;
			
			}
		}
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
		}
        }

}
