package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; /*데이터베이스에 접근하는 객체*/
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	/*생성자 부분*/
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/885";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	public int login(String userID, String userPassword) {
		String sql = "select userPassword from USER WHERE userID = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID); /*?에 해당하는 답 userID 넣어줌*/
		rs = pstmt.executeQuery(); /*결과를 담을 수 있는 객체에 결과 넣어줌*/
		if (rs.next()) {
			if(rs.getString(1).equals(userPassword)) {
				return 1; /*로그인 성공*/
			}
			else 
				return 0; /*비밀번호 불일치*/
		}
		return -1; /*아이디가 없음*/
	} catch(Exception e) {
		e.printStackTrace();
	}
	return -2; /*데이터 베이스 오류*/
	}
}
