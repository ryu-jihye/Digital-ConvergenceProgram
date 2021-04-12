<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.global.beans.HelloBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
HelloBean hello = (HelloBean)request.getAttribute("hello");

if (hello == null) {
	hello = new HelloBean();
	request.setAttribute("hello", hello);
}
out.println("변경 전" + hello.getName());
out.println("변경 후" + hello.getName());
%> --%>

<jsp:useBean class="org.global.beans.HelloBean" id="hello"/>
<hr/>
변경 전
<jsp:getProperty property="name" name="hello"/>
<jsp:getProperty property="name" name="hello"/>
<hr/>
변경 후
<jsp:getProperty property="name" name="hello"/>

<!-- useBean -> id -->

</body>
</html>