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
	//���⼭ bookid�� �޾��ְ�
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select* from book where bookid=?");
	pstmt.setString(1, bookid);
	//���⼭ ������ �ش� bookid ������ �ش��ϴ� �����͸� �ҷ��� �� ����
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	%>
	<tr>
		<td>å����</td>
		<td><%=rs.getString(2)%></td>
	</tr>
	<tr>	
		<td>���ǻ�</td>
		<td><%=rs.getString(3)%></td>
	</tr>
	<tr>	
		<td>����</td>
		<td><%=rs.getString(4)%></td>
	</tr>
	<tr>
		<td colspan="2"><a href="bookList.jsp">�������</a></td>
	<tr>
	<% 
	rs.close(); pstmt.close(); conn.close();
	//�̰� �������� ���� �ٽ� ���۽�Ű�� �ʴ� �̻� �ڵ� ���� �� ������ ������� �ȵ�
	
%>
</table>

</body>
</html>