<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@locamelhost:1521:xe";
	String id = "scott";
	String pass = "tiger";
	String password = "";
	
		try{
			
			request.setCharacterEncoding("UTF-8");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String passw = request.getParameter("password");
		
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
		
			String sql = "SELECT PASSWORD FROM notice4 WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		
		 if(password.equals(passw)) {
				sql = "UPDATE notice4 SET TITLE='" + title+ "' ,content='"+ content +"' WHERE NUM=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="nview.jsp?idx=<%=idx%>";
				  </script>
<%

			rs.close();
			stmt.close();
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


</body>
</html>