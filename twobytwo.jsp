<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--사전에 할 일-->
<!--topcat에서 Apache Standard Taglib 1.2.5 Released - [download] -[Jar Files]에서
1) taglibs-standard-compat-1.2.5.jar
2) taglibs-standard-impl-1.2.5.jar
3) taglibs-standard-jstlel-1.2.5.jar
4) taglibs-standard-spec-1.2.5.jar 설치 후 WEB-INF 내 lib에 4개 파일 copy하기 -->
<title>Insert title here</title>
</head>
<body>
<c:forEach var="num" begin="2" end="50" step="2">
<c:out value = "${num}"/>
</c:forEach>
</body>
</html>