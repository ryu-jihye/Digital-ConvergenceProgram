<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script language="javascript">
	// 자바 스크립트 시작
	function modifyCheck() {
		var form = document.modifyform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.content.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}
		form.submit();
	}
</script>
<%
	request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "scott";
String pass = "tiger";

String userid = "";
String password = "";
String title = "";
String content = "";
int idx = Integer.parseInt(request.getParameter("idx"));

try {

	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement();

	String sql = "SELECT userid, PASSWORD, TITLE, CONTENT FROM inquiry WHERE IQNO=" + idx;
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {

		userid = rs.getString(1);
		password = rs.getString(2);
		title = rs.getString(3);
		content = rs.getString(4);
	}

	rs.close();
	stmt.close();
	conn.close();
} catch (SQLException e) {
	out.println(e.toString());
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h1 {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<title>수정 페이지</title>
<%--  <jsp:include page="../menu.jsp"/> --%>
</head>
<br>
<br>
<h1>수정 페이지</h1>
<body>
	<%
		String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
		userID = (String) session.getAttribute("userID"); //userID값 가져옴
	%>
	<table>
		<form name=modifyform method=post
			action="nmodifyProc.jsp?idx=<%=idx%>">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					</table>
					<table>
						<tr>
							<br>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input type=text name=title size=50 maxlength=50
								value="<%=title%>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><%=userid%><input type=hidden name=username size=50
								maxlength=50 value="<%=userid%>"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
					<c:set var="userid" value="manager" />
					<c:choose>
			     <c:when test="${userid != null}">
			       <tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input type=text name="password" id="pass" size=50
									maxlength=50></td>
								<td>&nbsp;</td>
							</tr>
			    </c:when>    
			    <c:when test="${userid eq 'manager'}">
			         <tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input type=text name=password size=50 maxlength=50
								value="<%=password%>"></td>
							<td>&nbsp;</td>
							</tr>
			    </c:when>
			   </c:choose>
					<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name=content cols=50 rows=13><%=content%></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2"><input type="button" value="수정"
								OnClick="javascript:modifyCheck();"> <input type=button
								value="취소" OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>