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
<%@ page import="log.SignupDTO" %>

<jsp:useBean id="dto" class="log.SignupDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
	SignupDAO dao = SignupDAO.getInstance();
	dao.insert(dto);
%>
</body>
</html>