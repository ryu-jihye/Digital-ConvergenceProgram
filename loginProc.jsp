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
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
if(userId.isEmpty() || userPwd.isEmpty()) {
	RequestDispatcher rd = request.getRequestDispatcher("loginFrm.jsp");
	rd.forward(request, response);
	return;
}
%>
아이디 : <%= userId %> / 비밀번호 : <%= userPwd %>
</body>
</html>