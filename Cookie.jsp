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
	Cookie cookie = new Cookie("appleCookie", "apple");
	cookie.setMaxAge(60*1);
	cookie.setValue("tea");
	response.addCookie(cookie); /*변경사항이 생기면 response.addCookie(cookie); 추가*/
%>
<h3>쿠키 생성</h3>
<p>쿠키 확인은 <a href="tasteCookie.jsp">여기로!</a></p>
</body>
</html>