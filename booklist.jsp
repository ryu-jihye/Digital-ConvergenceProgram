<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="javax.naming.*" %> <!-- InitialContext -->
<%@ page import="javax.sql.*" %> <!-- DataSource -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="2">
<tr>
	<th>BookName</th>
	<th>Publisher</th>
	<th>Price</th>
</tr>
<%	
	//JNDI 서버 객체 생성(커넥션 풀에 접근)
	//JNDI : 서버에서 관리하고 있는 리소스 정보를 알고 있고 특정 리소스를 찾아서
	//사용할 수 있도록 객체를 반환해주는 역할
	InitialContext ic = new InitialContext();
	//ic.lookup() : 리소스를 찾은 후 리소스를 사용할 수 있도록 객체를 반환해주는 메소드
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select * from book");
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		%>
		<tr>
			<td><a href="bookView.jsp?bookid=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></td>
			<!-- a링크로 클릭 시 bookView페이지로 넘어가는데 bookid를 get방식으로 같이 넘겨줌 -->
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%
	}
	rs.close(); pstmt.close(); conn.close();
	//이거 빼먹으면 서버 다시 동작시키지 않는 이상 코드 수정 후 페이지 재실행이 안됨
%>	
</table>
</table>
</body>
</html>