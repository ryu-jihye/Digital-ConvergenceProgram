<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(session.isNew() || session.getAttribute("userId")==null) {
	String msg = (String)request.getAttribute("error"); %>
	
<form action="loginProc.jsp" method="POST">
ID:<input type="text" name="userId"/><br>
PW: <input type="password" name="userPwd"><br>	
<input type="submit" value="로그인">
<!-- ../responseProc.jsp (여러개면 && 연결) ? fruit=사과(name=value 형식)&season=여름 -->
</form>
<% } else {%>
<a href="loginProc.jsp">로그아웃</a>
<% } %>
</body>
</html>