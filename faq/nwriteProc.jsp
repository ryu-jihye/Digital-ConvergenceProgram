<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("utf-8"); //한글 인코딩

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int num = 1; //각 게시판마다 넘버링 해주는 존재
 	String userid = request.getParameter("userid"); 
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String iqdate = request.getParameter("iqdate");
	String content = request.getParameter("content");
	
	/* int max = 0; */
	
	try {	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String did = "scott";
		String dpw = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn = DriverManager.getConnection(url,did,dpw);
		
		/* if(rs.next()) {
			max = rs.getInt(1);
		} */
		
		String sql = "insert into inquiry (iqno, userid, password,title, iqdate, content) values(n_seq.nextval, ?,?,?,sysdate,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		/* pstmt.setInt(5, max+1); */
		
		pstmt.execute();
		pstmt.close();
		conn.close();
		
} catch(SQLException e) {
	out.println(e.toString() );
	}
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="nlist.jsp"; 
   </script>
</script>
