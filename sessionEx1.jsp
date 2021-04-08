<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
session.setAttribute("userId", userId);
session.setMaxInactiveInterval(1*60);
%>
<h1>Session 예제</h1>
<form action="sessionEx2.jsp" method="post">

1. 가장 좋아하는 계절은?<br/>
<input type="radio" name="season" value="봄">봄
<input type="radio" name="season" value="여름">여름
<input type="radio" name="season" value="가을">가을
<input type="radio" name="season" value="겨울">겨울
<p>
<input type="submit" value="결과 보기">

</form>
</body>
</html>