<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript">
	// 자바 스크립트 시작
	function deleteCheck() {
		var form = document.deleteform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>
<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
	userID = (String) session.getAttribute("userID"); //userID값 가져옴
//nview.jsp에서 보낸 idx값 저장
int idx = Integer.parseInt(request.getParameter("idx"));
%>
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
<title>삭제 페이지</title>
<%-- <jsp:include page="../menu.jsp" /> --%>
<br>
<br>
<h1>삭제 페이지</h1>
</head>
<body>
	<table>
		<form name=deleteform method=post
			action="ndeleteProc.jsp?idx=<%=idx%>">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
					</table>
					<table>
						<%-- <c:set var="username" value="manager" />
					<c:choose>
			    	 <c:when test="${username != null}">
			       <tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="username" size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="password" size="50" maxlength="50"></td>
							<td>&nbsp;</td>
						</tr>
			    </c:when>    
			    <c:when test="${username eq 'manager'}">
			         <tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="username" size="50" maxlength="50" value="manager" disabled></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="password" size="50" maxlength="50" value="100" disabled></td>
							<td>&nbsp;</td>
						</tr>
			    </c:when>
				</c:choose>	 --%>
						
						<c:if test="${userID==null}">
							<tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input name="password" type="text" size="50"
									maxlength="100"></td>
								<td>&nbsp;</td>
							</tr>
						</c:if>
						
						<c:if test="${userID!=null}">
							<tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input name="password" type="text" size="50"
									maxlength="100"></td>
								<td>&nbsp;</td>
							</tr>
						</c:if>
						
						<c:if test="${userID == 'manager'}">
							<tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input name="password" size="50" maxlength="50"
									value="100" disabled ></td>
								<td>&nbsp;</td>
							</tr>
						</c:if>
						
						<!-- <tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="password" type="text" size="50"
								maxlength="100" value="100"></td>
							<td>&nbsp;</td>
						</tr> -->
						
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<input type=button value="삭제" onClick="javascript:deleteCheck();">
							<input type=button value="취소"
								OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
	</table>
</body>
</html>