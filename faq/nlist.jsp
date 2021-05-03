<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h1 {
	text-align: center;
}

table {
	width: 980px;
	border: 3px solid #E2E8CA;
}

#order {
	padding-top: 15px;
	padding-bottom: 15px;
}

tr, th {
	padding-top: 8px;
	padding-bottom: 8px;
	border-bottom: 1px solid #E2E8CA;
}

#tablebt {
	align: left;
	padding-top: 10px;
	font-size: 18px;
}

#boardtable {
	padding-top: 30px;
	padding-bottom: 20px;
}

.faqName {
	padding-bottom: 30px;
}

.faqh1 {
	text-align: center;
	color: white;
}

.total {
	float: right;
	color: white;
}

.container {
	padding-top: 100px;
	padding-bottom: 30px;
}
</style>
<title>FAQ페이지</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<br>
	<br>
	<h1>FAQ페이지</h1>
	<%
		String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
		userID = (String) session.getAttribute("userID"); //userID값 가져옴
	/* String sql = null; */

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
		String sqlCount = "SELECT COUNT(*) FROM inquiry";
		pstmt = conn.prepareStatement(sqlCount);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			total = rs.getInt(1);
		}
		rs.close();
	%>
	<div>
		<div class="total">
			<span>총 게시물 <%=total%>개
			</span>
		</div>
	</div>
	<%
		String sqlList = "SELECT iqNo, USERID, title , IQDATE, hit, indent from inquiry order by IQNO DESC";
	pstmt = conn.prepareStatement(sqlList);
	rs = pstmt.executeQuery(sqlList);
	%>
	<table class="type06" width="100%" cellpadding="0" cellspacing="0"
		border="0">

		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr style="background: repeat-x; text-align: center;">
			<th width="5"><img src="" width="5" height="30" />
			</td>
			<th width="73">번호
			</td>
			<th width="73">제목
			</td>
			<th width="73">작성자
			</td>
			<th width="164">작성일
			</td>
			<th width="58">조회수
			</td>
			<th width="7"><img src="" width="5" height="30" />
			</td>
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
				String userid = rs.getString(2);
				String title = rs.getString(3);
				String iqdate = rs.getString(4);
				int hit = rs.getInt(5);
				int indent = rs.getInt(6);
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td><%=idx%></td>
			<!-- idx가 페이지 번호 구분 -->
			<td align="left">
				<%
					for (int j = 0; j < indent; j++) { //기존 넘버링 : num but 답글 : ref, step
				%> &nbsp;&nbsp;&nbsp;<%
 	}
 if (indent != 0) {
 %> <img src='img/re_icon2.png' width="15px" /> <%
 	}
 %> <a href="nview.jsp?idx=<%=idx%>"><%=title%></a>
			<td align="center"><%=userid%></td>
			<td align="center"><%=iqdate%></td>
			<td align="center"><%=hit%></td>
			<td>&nbsp;</td>
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
			<td align="center"></td>
		</tr>
		<c:if test="${userID != null}">
			<!-- login OK -->
			<tr align="right">
				<!-- <td><input type=button value="유저 글쓰기"
				OnClick="window.location='nwrite.jsp'"></td> -->
				<a href="nwrite.jsp" onclick="chenForm();" style="float: right;">글쓰기</a>
			</tr>
		</c:if>
		<c:if test="${userID == 'manager'}">
			<!-- <tr align="right">
			<td><input type=button value="관리자 글쓰기"
				OnClick="window.location='nwrite.jsp'"></td> 
		</tr> -->
			<a href="nwrite.jsp" onclick="chenForm();" style="float: right;">글쓰기</a>
		</c:if>
	</table>
</body>

</script>
</html>

