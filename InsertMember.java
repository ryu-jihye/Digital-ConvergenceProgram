package May_Fifth02;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class InsertMember {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

//���� �߰� �޼ҵ�
	private static int insertMember(Connection conn, PreparedStatement pstmt, Members mem) { 
	String sql = null;
	int result = 0;
	
	try {
		sql = String.format("INSERT INTO MEMBERS VALUES(USERID_SEQ.nextval, ?,?,?,?, sysdate)");
	
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  mem.userName);
		pstmt.setString(2,  mem.email);
		pstmt.setString(3,  mem.phoneNo);
		pstmt.setString(4,  mem.userPwd);
	}  catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return result;
	}