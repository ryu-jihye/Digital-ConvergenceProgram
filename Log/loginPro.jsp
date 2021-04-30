<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="log.SignupDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	SignupDAO dao = SignupDAO.getInstance();
	boolean result = dao.loginCheck(id, pw);
	
	if(result) {
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionPw", pw);
		response.sendRedirect("main.jsp");
	} else {
		out.println("ID, PW을 확인하시오");
	}
%>
</body>
</html>