<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- get은 주소창에 아이디, 비번이 보임 / post: 주소창에 아이디, 비번이 보이지 않음 -->
<!-- method=get 예: http://localhost:9090/JSP_global/0408/loginProc.jsp?userId=ddd&userPwd=ddd -->
<!-- method=post 예: http://localhost:9090/JSP_global/0408/loginProc.jsp -->

<form action="loginProc.jsp" method="post">
ID:<input type="text" name="userId"/><br>
PW: <input type="password" name="userPwd"><br>	
<input type="submit" value="로그인">

</form>
</body>
</html>