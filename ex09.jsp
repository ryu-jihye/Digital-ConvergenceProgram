<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page errorPage="errHandler.jsp" %>
	<%
	int one = 1;
	int zero = 0;
	%>
	one과 zero의 사칙연산
	one+zero = <%=one + zero %>
	one-zero = <%=one - zero %>
	one*zero = <%=one * zero %>
	one/zero = <%=one / zero %>
</body>
</html>