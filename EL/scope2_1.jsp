<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.setAttribute("id", "korea");
	application.setAttribute("siteName", "koreaseoul.co.kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language</title>
</head>
<body>
	<h2> EL의 Scope 2</h2>
	<jsp:forward page="scope2_2.jsp"/>
</body>
</html>