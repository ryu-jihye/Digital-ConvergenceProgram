<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Enumeration e = session.getAttributeNames();
	while(e.hasMoreElements()) {
	String name=e.nextElement().toString();
	String value=session.getAttribute(name).toString();
}

<%
session.setAttribute("userId", "rose");
session.setAttribute("userPwd", "1234");
String name, value; 
int i=0;

Enumeration en = session.getAttributeNames();
while(en.hasMoreElements) {
	i++;
	name = (String)en.nextElement();
	value = (String)session.getAttribute(name);
	out.println("설정된 세션의 속성 이름["+i+"] : "+name+"<br>");
	out.println("설정된 세션의 속성 값["+i+"] : "+value+"<br>");
}

%>
</body>
</html>