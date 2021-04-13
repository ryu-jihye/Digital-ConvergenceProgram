<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>JSP</h3>
<%
Enumeration<String> list = request.getHeaderNames();
while(list.hasMoreElements()) {
	String key = list.nextElement();
	out.print("<br>" +key+ ":"+request.getHeader(key));
	}
%>
<hr/>
<h3>EL</h3>
${header}
</body>
</html>