package May_Fifth02;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GetMembers {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

//�̸� �˻� �� �ش� �̸��� ���� Members ��ü ����Ʈ ��ȯ

private static List<Members> getMembers(Connection conn, 
		PreparedStatement pstmt,
		 ResultSet rs, String userName) {
	
	String sql = null;
	List<Members> members = new ArrayList<Members>();
	
	try {
		//��� 1
		//sql = String.format("select * from members where username like '%'||?||'%'"); 
		//���2
		sql = "select * from members where username like '%'||?||'%'";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  userName);
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