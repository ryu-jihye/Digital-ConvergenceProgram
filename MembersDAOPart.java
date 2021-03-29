package May_Fifth01;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.sun.jdi.connect.spi.Connection;

class MembersDAO {//연습문제
	
	int userID;
	String userName, email, phoneNo;
	String userPwd, regDate;

	public MembersDAO(int userID, 
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



public class MembersDAOPart{

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String dbUserId = "scott"; 	
		String dbPwd = "tiger";
		Scanner scan = new Scanner(System.in);
		int menu=0;  //선택된 메뉴 저장용 변수
		
		//DB 연동에 필요한 객체들 참조변수 초기화 
		Connection conn = null; 
		PreparedStatement pstmt=null; 
		ResultSet rs = null; 
		
		//DML 작업에 필요한 변수들 초기화
		int userId = 0;
		String userPwd = null;
		Members mem = null; 
		List<Members> al = null;
		
		
		
		//DB 연결
		conn = getConnectivity1(url, dbUserId, dbPwd);
		BREAK:
			while(true) {
				System.out.println("================================================");
				System.out.println("1.추가\t2.조회\t3.수정\t4.삭제\t5.모두 보기\t6.종료");
				System.out.println("================================================");
				System.out.println("메뉴를 선택하시오 >>");
				menu = scan.nextInt();
				switch(menu) {
				case 1: //추가 
					System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
					mem = new Members(scan.next(), scan.next(), scan.next(), scan.next() );
					insertMember1(conn, pstmt, mem); 
					break;
				case 2: //조회 
					System.out.println("검색할 회원의 이름을 입력하시오>> ");
					al = getMembers(conn, pstmt, rs, scan.next()); 
					showAll(al); 
					break;
				case 3: //수정
					System.out.println("수정할 회원의 아이디와 비밀번호를 입력하시오>> ");
//					userId = scan.nextInt(); userPwd=scan.next();
					if(isMember(conn, pstmt, rs, userId1, userPwd)) {
						System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
						mem = new Members(userId1, scan.next(), scan.next(), scan.next(), scan.next() );
						updateMembers(conn, pstmt, mem);
					}
					else {System.out.println("존재하지 않는 회원입니다."); 
					}
					break;
				case 4: //삭제
					System.out.println("삭제할 회원의 이름과 비밀번호를 입력하시오>> ");
//					userId = scan.nextInt(); userPwd=scan.next();
					if(isMember(conn, pstmt, rs, userId1, userPwd)) {
						System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
						mem = new Members(userId1, scan.next(), scan.next(), scan.next(), scan.next() );
						deleteMembers(conn, pstmt, userId1);
						}
					else {System.out.println("존재하지 않는 회원입니다."); 
					} break;
				case 5: //모두보기 
					al = getMemberListAll(conn, pstmt, rs); 
					showAll(al); 
					break;
				case 6:
					break BREAK;
				}
			}
		
		public static Connection getConnectivity1(String url, String dbUserId, String dbPwd) {
			//DB와 연결되는 Connection 객체 반환
			Connection conn1 = null;
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn1 = (Connection) DriverManager.getConnection(url, dbUserId, dbPwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.getStackTrace();}
		return conn1;
		}
		
		public static int insertMember1(Connection conn, 
				PreparedStatement pstmt, 
				Members mem) {
			int result = 0;
			
			String sql = "insert into members "
					+ "values(seq_members.nextval, ?, ?, ?, ?, sysdate)";
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  mem.getUserPwd());
			pstmt.setString(1,  mem.getUserName());
			pstmt.setString(1,  mem.getEmail());
			pstmt.setString(1,  mem.getPhoneNo());
			pstmt.executeUpdate();
			
			result = pstmt.executeUpdate(); 
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.getStackTrace();}
			return conn;
			}
			
//		}		
}

	private static Connection getConnectivity1(String url, String dbUserId, String dbPwd) {
		// TODO Auto-generated method stub
		return null;
	}
}