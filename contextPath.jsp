<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 어플리케이션 경로 구하기</title>
</head>
<body>
<!-- jsp가 포함된 웹 어플리케이션의 컨텍스트 경로 구할 수 있음 -->
웹 어플리케이션 컨텍스트 경로: "<%= request.getContextPath() %>"
</body>
</html>