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
	String sessionId = session.getId();
	long lastTime = session.getLastAccessedTime();
	long startTime = session.getCreationTime();
	long lapse = (lastTime - startTime)/1000/60;
	out.println("세션 아이디 : " + sessionId + "<br/>");
	out.println("요청 시작 시간 : " + startTime + "<br/>");
	out.println("요청 마지막 시간 : " + lastTime + "<br/>");
	out.println("웹사이트 경과 시간 : " + lapse + "분<br/>");
%>
</body>
</html>