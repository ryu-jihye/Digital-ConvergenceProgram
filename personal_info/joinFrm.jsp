<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="joinForm" action="joinProc.jsp" method="post">
	<left>
		<h3>회원가입</h3>
		<table border=1>
			<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
			<tr><td>이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>나이</td><td><input type="text" name="age"></td></tr>
			<tr><td>성별(male/female)</td><td><input type="text" name="gender"></td></tr>
			<tr><td>연락처</td><td><input type="text" name="phonenum"></td></tr>
			<tr>
			<td colspan="2" align="center">
			<input type="submit" value="가입하기">
		</table>
	</left>
</form>
</body>
</html>