<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 사용</title>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
%>
오늘은 
	<%= cal.get(Calendar.YEAR) %>년
	<%= cal.get(Calendar.MONTH)+1 %>월
	<%= cal.get(Calendar.DATE) %>일
입니다.
</body>
</html>