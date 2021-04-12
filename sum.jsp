<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합 구하기</title>
</head>
<body>
<%
	int sum1 = 0;
	for(int i=1; i<=10; i++) {
		sum1 += i;
	}
%>
1부터 10까지의 합은 <%= sum1 %>입니다.

<br>

<%
	int sum2 = 0;
	for(int i=11; i<=20; i++) {
		sum2 += i;
	}
%>
11부터 20까지의 합은 <%= sum2 %>입니다.
</body>
</html>