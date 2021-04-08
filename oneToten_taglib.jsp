<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="num" begin="1" end="10" step="1">
		<c:out value="${num}"/> <!-- 변수 num이 출력하고자 하는 값 -->
	</c:forEach> <!-- for문 -->
</body>
</html>