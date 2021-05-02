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
	int i;
	String pageno = request.getParameter("pageno");
	if(pageno == null || pageno.trim().equals("")) {
		pageno = "0";
	}
	else {
		
	}
	
	i = Integer.parseInt(pageno);
%>
</body>
</html>