package May_Fifth02;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpDateMembers {

	public static void main(String[] args) {
		

	}

}

//ȸ�� ���θ� �Ǵ��� ��, ȸ���� ��� �ش��ϴ� Ʃ�� ����
private static void updateMembers(Connection conn, 
									PreparedStatement pstmt, 
									Members mem) {
	String sql = null;
	try {
		sql = String.format("UPDATE MEMBERS "
				+ "SET USERNAME = ?, EMAIL = ?, PHONENO = ?, USERPWD = ?"
				+ "WHERE USERID = ?");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  mem.getuserName);
		pstmt.setString(2,  mem.email);
		pstmt.setString(3, mem.phoneNo);
		pstmt.setString(4,  mem.userPwd);
		pstmt.setString(5,  mem.userID);
		
		pstmt.execute();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
}