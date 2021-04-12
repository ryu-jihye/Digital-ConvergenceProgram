<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding ("utf-8"); %>
<jsp:useBean id="member" scope="request" class="org.global.beans.Members" />
<jsp:setProperty name="member" property="*"/>
<jsp:setProperty name="member" property="userId" param="id"/>
<h1>회원정보</h1>
이름: <jsp:getProperty name="member" property="name"/><br>
아이디 : <jsp:getProperty name="member" property="userId"/><br>
<h1>회원정보</h1>
이름: <jsp:setProperty name="member" property="name" value="코난"/><br>
아이디 : <jsp:setProperty name="member" property="userId" value="1111"/><br>
</body>
</html>