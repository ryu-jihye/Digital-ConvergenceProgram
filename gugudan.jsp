<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>구구단 출력</h3>
<%
for(int i=2; i<10; i++) {
	for(int j=1; j<10; j++) {
		out.println(i+"*"+j+"="+(i*j)); %>
<br/>
<% 
	}
}
%>
</body>
</html>