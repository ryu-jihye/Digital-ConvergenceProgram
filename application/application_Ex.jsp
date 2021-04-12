<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
관리자 아이디 : <%=application.getInitParameter("adminId") %><br>
관리자 비밀번호 : <%=application.getInitParameter("adminPwd") %>
</body>
</html>