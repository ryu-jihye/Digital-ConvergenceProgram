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
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));
%>

<%=num1 %> / <%=num2 %> = <%= (double) num1 / (double) num2 %>
<br>
<a href="div.html">back</a>

<%@page errorPage="error/div_error.jsp" %>

</body>
</html>