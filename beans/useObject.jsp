<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" scope="application" class="org.global.beans.Members"/>
<jsp:getProperty name="member" property="name"/>
<jsp:getProperty name="member" property="userId"/>님 안녕!
<jsp:forward page="useObject.jsp"/>
</body>
</html>