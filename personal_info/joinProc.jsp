<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="info" class="javabeans.personal_info"/>
<jsp:setProperty property="*" name="info"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="2" style="width: 750px;">
<caption>사용자가 입력한 데이터</caption>
<tr>
	<td style="width: 20%;">아이디</td>
	<td style="width: 40%;">${info.id }</td>
	<td style="width: 20;%">비밀번호</td>
	<td style="width: 40%;">${info.pw }</td>
</tr>
<tr>
	<td style="width: 20%;">이름</td>
	<td style="width: 40%;">${info.name }</td>
	<td style="width: 20%;">나이</td>
	<td style="width: 40%;">${info.age }</td>
</tr>
<tr>
	<td style="width: 20%">성별</td>
	<td style="width: 40%;">${info.gender }</td>
	<td style="width: 20%;">연락처</td>
	<td style="width: 40%;">${info.phonenum }</td>
</tr>
</table>

<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "scott";
	String dbPwd = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, dbId, dbPwd);
		sql = "insert into personal_info values(?,?,?,?,?,?,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, info.getId());
		pstmt.setString(2, info.getPw());
		pstmt.setString(3, info.getName());
		pstmt.setString(4, info.getAge());
		pstmt.setString(5, info.getGender());
		pstmt.setString(6, info.getPhonenum());
	pstmt.execute();
		
	sql = "select * from personal_info where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, info.getId());
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
	<td style="width: 15%;">나이</td>
	<td style="width: 35%;"><%=rs.getString(4) %></td>
</tr>
<tr>
	<td style="width: 15%;">성별</td>
	<td style="width: 35%;"><%=rs.getString(5) %></td>
	<td style="width: 15%;">연락처</td>
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