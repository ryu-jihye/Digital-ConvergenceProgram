<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 글쓰기</title>
<jsp:include page="../menu.jsp" />
</head>
<style>
h1 {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script language="javascript">
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;

		if (!form.userid.value) // form 에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요"); // 경고창 띄움
			form.userid.focus(); // form 에 있는 name 위치로 이동
			return;
		}

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
			form.content.focus();
			return;
		}

		form.submit();
	}
</script>
<body>
<br>
<br>
	<h1>글쓰기 페이지</h1>
	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
    userID = (String)session.getAttribute("userID"); //userID값 가져옴
    
	
    String userPassword = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userPassword") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
    userPassword = (String)session.getAttribute("userPassword"); //userID값 가져옴
    
    
	SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
	Date time = new Date();
	String iqdate = sdformat.format(time);
	%>
	<table>
		<form name=writeform method=post action="nwriteProc.jsp">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input name="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
			<c:set var="userID" value="userID" />
			<c:choose> 
			    <c:when test="${userID eq 'manager'}">
					<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="userid" size="50" maxlength="50" value=<%=userID%> disabled></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="password" size="50" maxlength="50" value=<%=userPassword%> disabled></td>
							<td>&nbsp;</td>
						</tr>			      
			    </c:when>
			    <c:otherwise>
			       <tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="userid" size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="password" size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
			    </c:otherwise>
			</c:choose>

		<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">작성날짜</td>
							<td><input type="text" name="iqdate" value=<%=iqdate%>
								size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name="content" cols="50" rows="13"></textarea></td>
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
							<td colspan="2"><input type=button value="등록"
								OnClick="javascript:writeCheck();"> <input type=button
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