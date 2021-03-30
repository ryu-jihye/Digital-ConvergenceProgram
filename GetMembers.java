package May_Fifth02;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class GetMembers {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

//이름 검색 후 해당 이름을 가진 Members 객체 리스트 반환

private static List<Members> getMembers(Connection conn, 
		PreparedStatement pstmt,
		 ResultSet rs, String userName) {
	
	String sql = null;
	List<Members> members = new ArrayList<Members>();
	
	try {
		//방법 1
		//sql = String.format("select * from members where username like '%'||?||'%'"); 
		//방법2
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