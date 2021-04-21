<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String result = request.getParameter("error"); 
%>
<c:set var="result" value="<%=result %>"></c:set>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron" align="center">
	<h1 class="display-3">
		로그인
	</h1>
</div>
<form action="loginProc.do" method="post">
	ID: <input type="text" name="userId"><br>
	PWD: <input type="password" name="userPwd"><br>
	<input type="submit" value="로그인">
</form>
<jsp:include page="../footer.jsp"/>	 
</body>
</html>