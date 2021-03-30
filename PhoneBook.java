package May_Fifth02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Members{
	int userID;
	String userName, email, phoneNo;
	String userPwd, regDate;
	
	public Members(int userID, String userName, String email, 
			String phoneNo, String userPwd, String regDate) {//모든필드 초기화
		super();
		this.userID = userID;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.userPwd = userPwd;
		this.regDate = regDate;
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
	public String toString() {
		return String.format("Members [userId = %d, userName = %s, userPwd = %s, "
				+ "email = %s, phoneNo = %s, regDate = %s ]",
					userID, userName, userPwd, email, phoneNo, regDate); 
	}
}

public class PhoneBook {

	public static void main(String[] args) {
		//userID : 1부터 순차적 증가, 자동생성되는 번호, 식별자(기존회원 탈퇴 후 재사용 불가)
		//-> SQL에서 시퀀스를 만들어야 함, userId와 userPwd 초기화 필요
		//regDate : 가입일, 가입 당시 시스템 시간 정보를 기본값으로 설정, 다른 회원 정보를 수정하더라도 변경 불가
		//검색할 경우 이름이 동일한 회원에 대한 정보들 모두 출력
		//수정 및 삭제 메뉴에서는 userID, userPwd를 확인 후 실행
		
		Scanner scan = new Scanner(System.in);
		boolean tf = true;
		int number = scan.nextInt();
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		Connection conn = null;
		Members mems = null; //class Members 이용
		PreparedStatement pstmt = null; //SQL 실행하기 위한 객체
		ResultSet rs = null; //Select문 결과를 가지는 객체
		
		int userId = 0; //자동생성번호, 
		String userPwd = null;
		
		List<Members> al = null;
		
		//private static Connection getConnectivity와 연결됨
		conn = getConnectivity(url, user, password); 
		
		while(tf) {
			
			System.out.println("===========================================");
			System.out.println("1.추가 2.조회 3.수정 4.삭제 5.모두 6.종료");
			System.out.println("===========================================");
			System.out.println("메뉴를 선택하세요 >> ");
			
			switch(number) {
			case 1://입력 -> public static int insertMember
				System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오");
				mems = new Members(scan.next(), scan.next(), scan.next(),  scan.next());
				insertMember(conn, pstmt, mems);
				break;
			case 2://검색 -> private static void showAll
				System.out.println("검색할 회원의 이름을 입력하시오");
				al = getMembers(conn, pstmt, rs, scan.next());
				showAll(al);
				break;
			case 3://수정
				System.out.println("수정할 회원의 아이디와 비밀번호를 입력하시오>> ");
				userId = scan.nextInt();
				userPwd = scan.next();
				if(isMember(conn, pstmt, rs, userId, userPwd)) {
					System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
					mems = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next());
					updateMembers(conn, pstmt, mems);
				}
				break;
			case 4://삭제
				System.out.println("삭제할 회원의 아이디와 비밀번호를 입력하시오>> ");
				userId = scan.nextInt();
				userPwd = scan.next();
				if(isMember(conn, pstmt, rs, userId, userPwd)) {
					System.out.println("비밀번호, 이름, 이메일, 전화번호 순으로 입력하시오>> ");
					mems = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next());
					deleteMembers(conn, pstmt, mems);
				}else {System.out.println("존재하지 않는 회원입니다."); 
				}break;
			case 5://조회
				al = getMembersListAll(conn, pstmt, rs); 
				showAll(al); 
				break;
			case 6://종료
				tf = false;
				break;
			
			}
		}
	}
		
	//DB와 연결되는 Connection 객체 반환
	private static Connection getConnectivity(String url, String user, 
											  String password) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static int insertMember(Connection conn , PreparedStatement pstmt, Members mems) {
		
		String sql = null; //레코드 추가 구문
		int result = 0;
		
		try {//시퀀스 이용하기 위해서는 String sql = "insert ~ values(ooo_seq.nextval, ?, ?, sysdate);
			//USERID, USERPWD, USERNAME, EMAIL, PHONENO, REGDATE순서대로 넣기
			//USERID는 시퀀스를 이용하므로 SEQ_MEMBERS(시퀀스 이름).NEXTVAL 이용
			sql = String.format("Insert into members values(SEQ_MEMBERS.nextval, ?, ?, ?, ?, sysdate");
			pstmt = conn.prepareStatement(sql);
			//USERID = 시퀀스 사용, REGDATE = SYSDATE사용 총 6개 중 4개 값만 입력하면 됨
			pstmt.setString(1, mems.userName);
			pstmt.setString(2, mems.email);
			pstmt.setString(3, mems.phoneNo);
			pstmt.setString(4,  mems.userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static void showAll(List<Members> al) {
		List<Members> members = al;
		
		for(Members m : members) {
			System.out.println(m.toString());
		}
	}
	
	public static boolean isMember(Connection conn, PreparedStatement pstmt,
									ResultSet rs, int userId, String userPwd) {
		String sql = null;
		boolean tf = true;
		
		try {
			sql = String.format("select * from members where userId=? and userPwd =?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			pstmt.setString(2, userPwd);
			
			rs = pstmt.executeQuery();
			if(rs.next() == false) {
				System.out.println("존재하지 않는 회원입니다.");
				tf = false;
			} else {
				tf = true;
			} 
		}catch (Exception e) {
				e.printStackTrace();
			}return tf;
		}
		
	
	public static void updateMembers(Connection conn, PreparedStatement pstmt, 
									Members mems) {
		String sql = null;
		try {
		sql = String.format("Update members set username = ?, email = ?, phoneno = ?,"
				+ "userpwd =? where userid =?");
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mems.userName);
		pstmt.setString(2, mems.email);
		pstmt.setString(3, mems.phoneNo);
		pstmt.setString(4, mems.userPwd);
		pstmt.setInt(5, mems.userID);
		
		pstmt.execute();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteMembers(Connection conn, PreparedStatement pstmt, 
									Members mems) {
		String sql = null;
		try {
			sql = String.format("delete from members where userId = ? and userName =? "
					+ "and email=? and userPwd =?");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mems.userID);
			pstmt.setString(2, mems.userName);
			pstmt.setString(3, mems.email);
			pstmt.setString(4, mems.userPwd);
			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static List<Members> getMembers(Connection conn, PreparedStatement pstmt,
			 								ResultSet rs, String userName) {
		String sql = null;
		List<Members> members = new ArrayList<Members>();
		try {
			
			//sql = String.format("SELECT * FROM MEMBERS WHERE USERNAME LIKE '%'||?||'%'");
			sql = "select * from members where username like '%'||?||'%'";
			//System.out.println("sql?"+sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				members.add(new Members(rs.getInt("userid"), rs.getString("userpwd"),
						rs.getString("username"), rs.getString("email"),
						rs.getString("phoneno"),rs.getString("regdate")));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return members;
		
	}
	
	public static List<Members> getMembersListAll(Connection conn, PreparedStatement pstmt,
													ResultSet rs) {
		List<Members> members = new ArrayList<Members>();
		String sql = "select * from members order by userid";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				members.add(new Members(rs.getInt("userid"), rs.getString("userName"),
						rs.getString("email"), 
						rs.getString("phoneNo"),
						rs.getString("userPwd"),
						rs.getString("regdate")));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	
}
