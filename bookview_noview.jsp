<%@ page import="java.sql.*" contentType="text/html; charset=EUC-KR" %>
<%@ page import="javax.naming.*" %> <!-- InitialContext -->
<%@ page import="javax.sql.*" %> <!-- DataSource -->

<html>
<head>
<meta charset="EUC-KR">
<title> ** Book VIEW ** </title>
</head>
<body>

<table border="2" style="width:600px; height: 300px">
<%
	String bookid = request.getParameter("bookid");
	//여기서 bookid를 받아주고
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select* from book where bookid=?");
	pstmt.setString(1, bookid);
	//여기서 넣으면 해당 bookid 정보에 해당하는 데이터만 불러올 수 있음
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	%>
	<tr>
		<td>책제목</td>
		<td><%=rs.getString(2)%></td>
	</tr>
	<tr>	
		<td>출판사</td>
		<td><%=rs.getString(3)%></td>
	</tr>
	<tr>	
		<td>가격</td>
		<td><%=rs.getString(4)%></td>
	</tr>
	<tr>
		<td colspan="2"><a href="bookList.jsp">목록으로</a></td>
	<tr>
	<% 
	rs.close(); pstmt.close(); conn.close();
	//이거 빼먹으면 서버 다시 동작시키지 않는 이상 코드 수정 후 페이지 재실행이 안됨
	
%>
</table>

</body>
</html>