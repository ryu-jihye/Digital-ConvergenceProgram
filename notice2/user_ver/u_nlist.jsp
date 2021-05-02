<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
</head>
<body>
<h1>사용자 게시판</h1>
	<%
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String str = "";
		int total = 0;
		
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String did = "scott";
		String dpw = "tiger";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, did, dpw);
		
		//게시물 글자수 표현
		String sqlCount = "SELECT COUNT(*) FROM notice4";
		pstmt = conn.prepareStatement(sqlCount);
		rs = pstmt.executeQuery();
	

		if (rs.next()) {
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");

		String sqlList = "SELECT num, username, title , time, hit, indent from notice4 order by num DESC";
		pstmt = conn.prepareStatement(sqlList);
		rs = pstmt.executeQuery(sqlList);
		
	%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: repeat-x; text-align: center;">
			<td width="5"><img src="" width="5"
				height="30" /></td>
			<td width="73">번호</td>
			<td width="379">제목</td>
			<td width="73">작성자</td>
			<td width="164">작성일</td>
			<td width="58">조회수</td>
			<td width="7"><img src="" width="5"
				height="30" /></td>
		</tr>
		<%
			if (total == 0) {
		%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {

			while (rs.next()) {
				int idx = rs.getInt(1);
				String username = rs.getString(2);
				String title = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				int indent = rs.getInt(6);
			/* 	
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				String yea = time.substring(0,10); */
		%>
		<tr height="25" align="center">
			<td >&nbsp;</td>
			<td><%=idx%></td> <!-- idx가 페이지 번호 구분 -->
			<td align="left">
			<% 
		
	for(int j=0;j<indent;j++){ //기존 넘버링 : num but 답글 : ref, step
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent!=0){
%>		<img src='img/re_icon2.png' width="30px" height="30px" />
<%
	}
%>
	<a href="u_nview.jsp?idx=<%=idx%>"><%=title %></a>

			<!-- <img src='img/new.jpg' /> -->
			<td align="center"><%=username %></td>
			<td align="center"><%=time %></td>
			<td align="center"><%=hit %></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<%
			}
		}
		rs.close();
		pstmt.close();
		conn.close();
		} catch (SQLException e) {
			out.println(e.toString());
		}
		%>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
		<td align="center">
		</td>
		</tr>
		  <tr align="center">
			<td><input type=button value="글쓰기" OnClick="window.location='u_nwrite.jsp'"></td> 
		</tr>
	</table>
</body>
</script>
</html>

