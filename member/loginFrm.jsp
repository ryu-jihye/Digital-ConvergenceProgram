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
<div class="container" align="center">

<h1 style="font-style: italic;">Please sign in</h1>
<c:if test="${result!=null}">
<div class="alert alert-danger">
<c:if test="${result==1}">
<h1 class="display-4">아이디를 확인해 주세요</h1>
</c:if>
<c:if test="${result==2}">
<h1 class="display-4">비밀번호를 확인해 주세요</h1>
</c:if>
</div>
</c:if>
<form action="loginProc.jsp" method="post">
<div class="form-group">
	<input class="form-control-lg" type="text" name="userId"><br>
	<input class="form-control-lg" type="password" name="userPwd"><br>
	<input class="btn btn-success form-control-lg" type="submit" value="로그인">
</div>
</form>
</div>
<jsp:include page="../footer.jsp"/>	 
</body>
</html>