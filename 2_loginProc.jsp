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
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

if(userId.equals("admin") && userPwd.equals("admin")) {
	response.sendRedirect("2_loginSuccess.jsp");
} else {
	response.sendRedirect("2_loginFail.jsp");
}
%>
</body>
</html>