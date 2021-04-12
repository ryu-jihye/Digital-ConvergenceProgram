<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" scope="application" class="org.global.beans.Members"/>
<jsp:getProperty name="member" property="name"/>
<jsp:getProperty name="member" property="userId"/>님 안녕!
<jsp:forward page="useObject.jsp"/>


<table>
	<tr>
	<td colspan=2><jsp:include page="include/top.jsp"/></td>
	<td>회원 가입 정보</td>
	</tr>
	<tr>
	<td><jsp:include page="include/menu.jsp"/></td>
	<td>소환사의 계곡에 오신것을 환영합니다.<br>
	<img src="../images/image.jpg" width=200;>
	</td>
	</tr>
	<tr>
	<td colspan=2><jsp:include page="include/bottom.jsp"/></td>
	</tr>
</table>
</body>
</html>