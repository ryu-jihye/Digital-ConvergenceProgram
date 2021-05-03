<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String did = "scott";
	String dpw = "tiger";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	int num = 1;
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String iqdate = request.getParameter("iqdate");
	String content = request.getParameter("content");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		conn = DriverManager.getConnection(url, did, dpw);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT REF, INDENT, STEP FROM inquiry WHERE IQNO=" + idx;
	 	rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE inquiry SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO inquiry(IQNO, USERID, PASSWORD, TITLE, IQDATE, CONTENT, REF, INDENT, STEP) "+
				"values(n_seq.nextval, ?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, iqdate);
		pstmt.setString(5, content);
		pstmt.setInt(6, ref);
		pstmt.setInt(7, indent+1);
		pstmt.setInt(8, step+1);
		
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		
	}
%>
</body>
</html>
  <script language=javascript>
   self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
   location.href="nlist.jsp?idx=<%=idx%>";
  </script>