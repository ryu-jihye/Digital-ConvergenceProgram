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
	request.setCharacterEncoding("UTF-8"); 
	String userId = request.getParameter("userId");	
	String userPwd = request.getParameter("userPwd");
	//아이디와 비밀번호 확인
	if(userId.equals("admin") && userPwd.equals("admin")) {
		response.sendRedirect("loginSuccess.jsp");
	} else {
		response.sendRedirect("loginFail.jsp");
	}
	
%>
아이디 : <%=userId %> / 비밀번호 : <%=userPwd %>
</body>
</html>