<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.invalidate(); %>
로그아웃 완료.<br>
<a href='loginFrm.jsp'>로그인 화면으로</a>
</body>
</html>