<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("userId");
	session.setAttribute("userId", id);
%>
	<%=id %>님 정보 수정이 정상적으로 되었습니다.<br>
	로그아웃	정보수정
</body>
</html>