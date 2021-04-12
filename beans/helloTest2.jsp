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

<!-- value값이 있을 땐 jsp:setProperty -->
<jsp:setProperty property="name" name="hello" value="conan" /><br/>
<jsp:setProperty property="number" name="hello" value="010-1111-1111" />
<hr/>
<jsp:getProperty property="name" name="hello"/><br/>
<jsp:getProperty property="number" name="hello"/><br/>
</body>
</html>