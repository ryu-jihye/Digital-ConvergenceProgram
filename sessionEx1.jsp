<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int time = session.getMaxInactiveInterval()/60;
	out.println("세션 유효 시간 : " + time + "분<br>");
%>
</body>
</html>