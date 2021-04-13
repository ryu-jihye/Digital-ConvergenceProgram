<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 <%=session.getAttribute("id") %>로 로그인 한 상태<br>
<a href='logout.jsp'>로그아웃</a>
</body>
</html>