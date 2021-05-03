<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
			
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pass = "tiger";
	String password = "null";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pw = request.getParameter("password");
	
	try{
		
		
		String sql = "select password from inquiry where iqNo=" + idx;
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		//pw : ndelete.jsp에서 입력한 비밀번호, password : 데이터베이스에 있는 값(서로 비교)
		
		
		if(rs.next()){
				password = rs.getString(1);
		 }
		//int값이라고 하더라도 입력 시 넘어올 때 String type이 됨
		 if(password.equals(pw)) {
			   			
			sql = "delete from inquiry where iqno=" + idx;	
			pstmt.executeUpdate(sql);	 
	
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="nlist.jsp";
  			</script>

<%
		rs.close();
		pstmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>

