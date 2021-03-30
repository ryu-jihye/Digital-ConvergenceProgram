package May_Fifth02;

import java.sql.PreparedStatement;

public class IsMember {

	public static void main(String[] args) {
		
	}

}

//입력된 정보를 가진 회원의 존재여부를 확인하여 회원이면 true, 아니면 false 반환

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
			System.out.println("존재하지 않는 회원입니다.");
			tf = false;
		} else {
			tf = true;
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
}
	