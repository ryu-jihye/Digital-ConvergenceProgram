<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbId = "scott";
String dbPwd = "tiger";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	sql = "select * from personal_info where Id='hong'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	
	%>

<form action="updatePro.jsp" method="post">
<left>
		<h3>수정하기</h3>
		<table border=1>
			<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>나이</td><td><input type="text" name="age"></td></tr>
			<tr><td>성별(male/female)</td><td><input type="text" name="gender"></td></tr>
			<tr><td>연락처</td><td><input type="text" name="phonenum"></td></tr>
			<tr>
			<td colspan="2" align=center>
			<input type="submit" value="수정하기">
			</tr>
		</table>
	</left>
</form>

<%
}catch(SQLException e){
	e.printStackTrace();
}catch(ClassNotFoundException e){
	e.printStackTrace();
}finally{
	conn.close();
}
%>

</body>
</html>