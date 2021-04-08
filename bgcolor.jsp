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
	request.setCharacterEncoding("UTF-8"); 
	String name = request.getParameter("name");	
	String color = request.getParameter("color");
	
	
	
	if (color.equals("파랑색")) {
			%> <body bgcolor="blue">
				
			<% 		
	}
	%>
	<%
	if (color.equals("붉은색")) {
			%> <body bgcolor="red">
	<% 		
	}
	%>
	<%
	if (color.equals("초록색")) {
			%> <body bgcolor="green">
	<% 		
	}
	%>
	<%
	if (color.equals("오렌지색")) {
			%> <body bgcolor="orange">			
	<% 		
	}
	%>
	<%
	if (color.equals("기타(하얀색)")) {
			%> <body bgcolor="white">
	<% 		
	}
	%>
	
	<h1>IF-else Example</h1> 
	이름 : <%=name %> / 좋아하는 색깔 : <%=color %>
</body>
</html>