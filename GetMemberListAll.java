package May_Fifth02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class GetMemberListAll {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

//테이블에 저장된 정보들을 리스트 객체에 저장 후 반환
public staic List<Members> getMembers(Connection conn, PreparedStatement pstmt,
										ResultSet rs, String userName) {
	//Array 배열 예시 double [] dArray = new double [4];
	List<Members> members = new ArrayList<Members>();
	String sql = "select * from members order by userid";
	
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			members.add(new Members(rs.getInt("userId"), rs.getString("userName"),
									rs.getString("email"), rs.getString("phoneNo"),
									re.getString("userPwd"), rs.getString("regdate"));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	return members;
}
