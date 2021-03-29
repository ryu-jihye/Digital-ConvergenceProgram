package May_Fifth01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Scanner;

class Members {//��������
	
	int userID;
	String userName, email, phoneNo;
	String userPwd, regDate;

	public Members(int userID, 
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
public class ContactList_OracleEx2 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		String name = "";

		try {//�ڹٷκ��� ����Ŭ ���̺� ������ �Է� insert
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			System.out.println("���� ����");

			sql="SELECT * FROM MEMBERS"; 
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			Loop :  while (true) {
				System.out.println("1.�߰� || 2��ȸ || 3.���� || 4. ���� || 5. ��κ��� || 6. ����");
				switch (scan.nextInt()) {
				case 1 : //�߰�
					System.out.println("�Է��� �̸�, �̸���, ��ȣ, ��й�ȣ-->");
					sql = "INSERT INTO MEMBERS VALUES (?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, scan.next());
					pstmt.setString(2, scan.next());
					pstmt.setString(3, scan.next());
					pstmt.setString(4, scan.next());
					pstmt.executeQuery();
					break;
				case 2 : //��ȸ
					System.out.println("��ȸ�� �̸��� �Է�-->");
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
				case 3 : //����
					System.out.println("������ �̸��� �Է�-->");
					name = scan.next();
					sql = "DELETE * MEMBERS WHERE USERNAME = '"+name+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					System.out.println("���� �Է��� �̸�, �̸���, ��ȣ, ��й�ȣ-->");
					sql = "INSERT INTO MEMBERS VALUES (?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, scan.next());
					pstmt.setString(2, scan.next());
					pstmt.setString(3, scan.next());
					pstmt.setString(4, scan.next());
					pstmt.executeQuery();
					break;
				case 4 : //����
					System.out.println("������ �̸��� �Է�-->");
					name = scan.next();
					sql = "DELETE FROM MEMBERS WHERE USERNAME = '"+name+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					System.out.println("�����Ǿ����ϴ�.");
					break;
				case 5 : //��κ���
					sql = "SELECT * FROM MEMBERS";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						Members members = new Members(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
						System.out.println(members.toString());
					}
					break;
				case 6 : //����
					break Loop;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("���� ����");
		}
	
	}
}