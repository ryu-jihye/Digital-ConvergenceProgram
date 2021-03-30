package May_Fifth02;

public class DeleteMembers {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

//ȸ���� ������ �ش��ϴ� Ʃ�� ����
private static void deleteMembers(Connection conn, 
									PreparedStatement pstmt, 
									Members mem) {
	String sql = null;
	try {
		sql = String.format("delete from members "
				+ "where userId = ? "
				+ "and userName = ? "
				+ "and email =? "
				+ "and userPwd = ?");
		
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
	
}