<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1></h1><strong><mark>Header임!!</h1></mark></strong>	
	<br>
	<%

int count;
if(session.getAttribute("count") != null)
{	
	count = ((Integer)session.getAttribute("count")).intValue();
}
else
{
	count = 0;	
}
count++;

%>

방문 횟수 : <%=count%>

<%
session.setAttribute("count", new Integer(count)); 
%>
</body>
</html>