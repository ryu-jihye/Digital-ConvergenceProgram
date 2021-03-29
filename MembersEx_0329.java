package May_Fifth01;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.sun.jdi.connect.spi.Connection;

class Members_0329 {
	int userID;
	String userName, email, phoneNo;
	String userPwd;
	String regDate;

	public Members_0329(int userID, String userName, String email, String phoneNo, String userPwd, String regDate) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.userPwd = userPwd;
		this.regDate = regDate;
	}

	public Members_0329(String userPwd, String userName, String email, String phoneNo) {
		// TODO Auto-generated constructor stub
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
	}

	public Members_0329(int userID, String userPwd, String userName, String email, String phoneNo) {
		// TODO Auto-generated constructor stub
		this.userID = userID;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phoneNo = phoneNo;
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
		return String.format("Members_0329 [userID = %d, userName = %s, email=%s, phoneno=%s, userPwd=%s, regDate=%s]", 
				userID, userName, email, phoneNo, userPwd, regDate);
	}
}

public class MembersEx_0329 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUserID = "scott";
		String dbPwd = "tiger";
		Connection conn = null;
		int menu = 0;
		boolean tf = true;
		List<Members> al = null;
		Members mem = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		int userId = 0;
		String userPwd = null;

		conn = getConnectivity(url, dbUserID, dbPwd);
		
		
		while(tf) {
			System.out.println("=====================================================");
			System.out.println("1. �߰� | 2. ��ȸ | 3. ���� | 4. ���� | 5. ��� ���� | 6. ����");
			System.out.println("=====================================================");
			System.out.println("�޴��� �����Ͻÿ� >>");
			menu = scan.nextInt();


			switch(menu) {
			case 1: // ���� �Է�
				System.out.println("��й�ȣ, �̸�, �̸���, ��ȭ��ȣ ������ �Է��Ͻÿ�");
				mem = new Members(scan.next(), scan.next(), scan.next(), scan.next());
				insertMember(conn, pstmt, mem);

				break;

			case 2: //ȸ�� ���ϰ˻�
				System.out.println("�˻��� ȸ���� �̸��� �Է��Ͻÿ�");

				al = getMembers(conn, pstmt, rs, scan.next()); 
				showAll(al); 

				break;

			case 3: 
				System.out.println("������ ȸ���� ���̵�� ��й�ȣ�� �Է��Ͻÿ�>> ");
				userId = scan.nextInt(); userPwd=scan.next();
				if(isMember(conn, pstmt, rs, userId, userPwd)) {
					System.out.println("��й�ȣ, �̸�, �̸���, ��ȭ��ȣ ������ �Է��Ͻÿ�>> ");
					mem = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next() );
					updateMembers(conn, pstmt, mem);
				}
				else {System.out.println("�������� �ʴ� ȸ���Դϴ�."); 
				}
				break;

			case 4: 
				System.out.println("������ ȸ���� ���̵�� ��й�ȣ�� �Է��Ͻÿ�>> ");
				userId = scan.nextInt(); userPwd=scan.next();
				if(isMember(conn, pstmt, rs, userId, userPwd)) {
					System.out.println("��й�ȣ, �̸�, �̸���, ��ȭ��ȣ ������ �Է��Ͻÿ�>> ");
					mem = new Members(userId, scan.next(), scan.next(), scan.next(), scan.next());
					deleteMembers(conn, pstmt, mem);
				}
				else {System.out.println("�������� �ʴ� ȸ���Դϴ�."); 
				} break;

			case 5: // ȸ�� ��� ���
				al = getMemberListAll(conn, pstmt, rs); 
				showAll(al); 
				break;

			case 6:
				tf = false;
			}
			//scan.close();
	}	
}


//Ŀ�ؼ� �޼ҵ�
private static Connection getConnectivity(String url, String dbUserID, String dbPwd) {
	Connection conn = null;
	try {
		conn = DriverManager.getConnection(url, dbUserID, dbPwd);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return conn;
	}
}

//���� �߰� �޼ҵ�
private static int insertMember(Connection conn, PreparedStatement pstmt, Members mem) { //�Էµ� ���� ������ ��ȯ
	// TODO Auto-generated method stub
	String sql = null;
	int result = 0;
	try {
		sql = String.format("INSERT INTO MEMBERS "
				+ "VALUES(USERID_SEQ.nextval, ?, ?, ?, ?, SYSDATE)");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem.userName);
		pstmt.setString(2, mem.email);
		pstmt.setString(3, mem.phoneNo);
		pstmt.setString(4, mem.userPwd);

		result = pstmt.executeUpdate();

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return result;
	}
}

//���� �޼ҵ�
private static void deleteMembers(Connection conn, PreparedStatement pstmt, Members mem) {
	// TODO Auto-generated method stub
	String sql = null;
	try {		
		sql = String.format("DELETE FROM MEMBERS "
				+ "WHERE USERID = ? AND USERNAME = ? AND EMAIL = ? AND USERPWD = ?");
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mem.userID);
		pstmt.setString(2, mem.userName);
		pstmt.setString(3, mem.email);
		pstmt.setString(4, mem.userPwd);

		pstmt.execute();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}

//ȸ�� ���θ� Ȯ���ؼ� true, false
private static boolean isMember(Connection conn, PreparedStatement pstmt, ResultSet rs, int userId,
		String userPwd) {
	// TODO Auto-generated method stub
	boolean tf = true;
	String sql = null;
	try {
		sql = String.format("SELECT * FROM MEMBERS "
				+ "WHERE USERID = ? AND USERPWD = ?");
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userId);
		pstmt.setString(2, userPwd);

		rs = pstmt.executeQuery();
		if(rs.next()==false) {
			System.out.println("�������� �ʴ� ȸ���Դϴ�.");
			tf = false;
		}else {
			tf = true;
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

	return tf;
}

//��� ���� ��� �޼ҵ�
private static List<Members> getMemberListAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	// TODO Auto-generated method stub

	List<Members> members = new ArrayList<Members>();
	String sql = "select * from members order by userid";
	
	try {
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			members.add(new Members(rs.getInt("userid"), rs.getString("userName"),
					rs.getString("email"), rs.getString("phoneNo"),
					rs.getString("userPwd"),rs.getString("regdate")));
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return members;
}

//ȸ������ �Ǵ� �� Ʃ�� ����
private static void updateMembers(Connection conn, PreparedStatement pstmt, Members mem) {
	// TODO Auto-generated method stub
	String sql = null;
	try {
		sql = String.format("UPDATE MEMBERS "
				+ "SET USERNAME=?, EMAIL=?, PHONENO=?, USERPWD=? "
				+ "WHERE USERID = ?");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mem.userName);
		pstmt.setString(2, mem.email);
		pstmt.setString(3, mem.phoneNo);
		pstmt.setString(4, mem.userPwd);
		pstmt.setInt(5, mem.userID);

		pstmt.execute();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

}


//�̸� �˻� �� ��ü ����Ʈ�� ��ȯ
private static List<Members> getMembers(Connection conn, PreparedStatement pstmt, ResultSet rs, String userName) {
	// TODO Auto-generated method stub
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