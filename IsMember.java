package May_Fifth02;

import java.sql.PreparedStatement;

public class IsMember {

	public static void main(String[] args) {
		
	}

}

//�Էµ� ������ ���� ȸ���� ���翩�θ� Ȯ���Ͽ� ȸ���̸� true, �ƴϸ� false ��ȯ

public static boolean isMember(Connection conn, PreparedStatement pstmt,
								ResultSet rs, int userID, String userPwd) {
	
	boolean tf = true;
	String sql = null;
	try {
		sql = String.format("select from members where userId = ? and userPwd =?");
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userId);
		pstmt.setString(2, userPwd);
		
		rs = pstmt.executeQuery();
		if(rs.next() == false) {
			System.out.println("�������� �ʴ� ȸ���Դϴ�.");
			tf = false;
		} else {
			tf = true;
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
}
	