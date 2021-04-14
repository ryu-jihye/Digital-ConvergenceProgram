<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="javabeans.Members"/>
<jsp:setProperty property="*" name="member"/>

<table border="2" style="width: 700px;">
<caption>수정하기 위해 입력한 데이터</caption>
<tr>
	<td style="width: 15%;">아이디</td>
	<td style="width: 35%;">${member.userId}</td>
	<td style="width: 15%;">비밀번호</td>
	<td style="width: 35%;">${member.userPwd}</td>
</tr>
<tr>
	<td style="width: 15%;">이름</td>
	<td style="width: 35%;">${member.userName}</td>
	<td style="width: 15%;">전화번호</td>
	<td style="width: 35%;">${member.phoneNo}</td>
</tr>
<tr>
	<td style="width: 15%;">주소</td>
	<td style="width: 35%;">${member.address}</td>
	<td style="width: 15%;">이메일</td>
	<td style="width: 35%;">${member.email}</td>
</tr>
</table>

<hr>

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
sql = "update members set userPwd=?, userName=?, phoneNo=?, address=?, email=? where userId=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member.getUserPwd());
pstmt.setString(2, member.getUserName());
pstmt.setString(3, member.getPhoneNo());
pstmt.setString(4, member.getAddress());
pstmt.setString(5, member.getEmail());
pstmt.setString(6, member.getUserId());
pstmt.execute();

sql = "select * from members where userId=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member.getUserId());
rs = pstmt.executeQuery();
rs.next();
%>

<table border="2" style="width: 700px;">
<caption>테이블에서 읽어온 데이터</caption>
<tr>
	<td style="width: 15%;">아이디</td>
	<td style="width: 35%;"><%=rs.getString(1) %></td>
	<td style="width: 15%;">비밀번호</td>
	<td style="width: 35%;"><%=rs.getString(2) %></td>
</tr>
<tr>
	<td style="width: 15%;">이름</td>
	<td style="width: 35%;"><%=rs.getString(3) %></td>
	<td style="width: 15%;">전화번호</td>
	<td style="width: 35%;"><%=rs.getString(4) %></td>
</tr>
<tr>
	<td style="width: 15%;">주소</td>
	<td style="width: 35%;"><%=rs.getString(5) %></td>
	<td style="width: 15%;">이메일</td>
	<td style="width: 35%;"><%=rs.getString(6) %></td>
</tr>
<tr>
	<td colspan="1">가입일</td>
	<td colspan="3"><%=rs.getString(7) %></td>
</tr>
</table>

<% 
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}finally{
	conn.close();
}
%>
</body>
</html>