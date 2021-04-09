<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Forward Tag Example</h1>
	<% 
	String code = request.getParameter("bloodType");
	String viewPageURI = null;
	
	if(code.equals("a")) {
		viewPageURI = "Result/a.jsp";
	} else if (code.equals("b")) {
		viewPageURI = "Result/b.jsp";
	} else if (code.equals("o")) {
		viewPageURI = "Result/o.jsp";
	} else if (code.equals("ab")) {
		viewPageURI = "Result/ab.jsp";
	}
%>
	<jsp:forward page="<%=viewPageURI %>" />
</body>
</html>