<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="background.jsp" method="post">
이름:<input type="text" name="name"/><br>
좋아하는 색깔: <select name="color" size="1" muliple>
		<option value="파랑색" selected>파랑색</option>
		<option value="붉은색">붉은색</option>
		<option value="초록색">초록색</option>
		<option value="오렌지색">오렌지색</option>
		<option value="기타(하얀색)">기타(하얀색)</option>
<input type="submit" value="로그인">
</body>
</html>