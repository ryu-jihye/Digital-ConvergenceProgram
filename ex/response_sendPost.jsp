<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>response_sendPost 페이지</title>
</head>
<body>
 
Post 부분 입니다.
 
<% request.setCharacterEncoding("UTF-8"); %>
 
<%
String user = (String)request.getParameter("name3");
request.getSession().setAttribute("userName", user);
response.sendRedirect("page_control_end.jsp");
%>
 
</body>
</html>