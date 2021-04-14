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
	sql = "select * from members where userId='kcm7327'";//이건 제가 넣은 정보니까 개인이 db에 넣은 값으로 변경해줘야 합니다. 
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	
	%>

<form action="updatePro.jsp" method="post">
<left>
		<table border=1>
				<tr><td>아이디 : </td><td><input type="text" name="userId"></td></tr>
				<tr><td>비밀번호 : </td><td><input type="password" name="userPwd"></td></tr>
				<tr><td>이름 : </td><td><input type="text" name="userName"></td></tr>
				<tr><td>전화번호 : </td><td><input type="text" name="phoneNo"></td></tr>
				<tr><td>주소 : </td><td><input type="text" name="address"></td></tr>
				<tr><td>이메일 : </td><td><input type="text" name="email"></td></tr>
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