<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int count=0;
%>
	1이 증가된 후 카운트 값은
<%
	out.println(++count);
%>
</body>
</html>