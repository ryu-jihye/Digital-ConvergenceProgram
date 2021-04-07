<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Q1 1부터 10까지의 합을 구하기</h1>
<%
	int sum = 0;
	for(int i = 1; i <= 10; i++) {
		sum = sum + i;
	}
%>
1부터 10까지의 합은 <%= sum %> 입니다.
</body>
</html>