<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='loginProc.jsp' method='post'>
	관리자 로그인<br>
	아이디: <input type='text' name='userId'>
	<input type="checkbox" name="idsave" value="save">아이디 기억<br>
	비밀번호 : <input type='password' name='userPwd'>
	<input type='submit' value='전송'>
</form>
</body>
</html>