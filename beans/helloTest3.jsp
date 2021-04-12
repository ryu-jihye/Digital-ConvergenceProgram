<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean class="org.global.beans.HelloBean" id="hello"/>
<hr/>
<jsp:getProperty property="name" name="hello"/><br/>
<jsp:getProperty property="number" name="hello"/><br/>
<jsp:setProperty property="name" name="hello" param="name"/><br/>
<jsp:setProperty property="number" name="hello" param="number"/>
<hr/>
<jsp:getProperty property="name" name="hello"/><br/>
<jsp:getProperty property="number" name="hello"/><br/>
</body>
</html>