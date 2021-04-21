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
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">가입 완료</h1>
		</div>
	</div>
	<div class="container" align="center">
	<%-- 	<%
		String userName = request.getParameter("userName");
		%>
		<%=userName %>님 환영합니다 --%>
		회원가입이 정상적으로 되었습니다.
		<a href='loginFrm.jsp'>로그인</a>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>