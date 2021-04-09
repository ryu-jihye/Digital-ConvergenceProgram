<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Forward Tag Example</h3>
<form method="POST" action="forwardRequest.jsp">
	<p>당신의 혈액형은?<br>
	<input type="radio" name="bloodType" value="a">A형</p>
	<input type="radio" name="bloodType" value="b">B형</p>
	<input type="radio" name="bloodType" value="o">O형</p>
	<input type="radio" name="bloodType" value="ab">AB형</p>
	<input type="submit" value="보내기">
</form>
</body>
</html>