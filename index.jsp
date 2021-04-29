<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
홈 화면 출력됨<br />
<c:if test="${sessionID == null }">
	<a href="login.do"><button>로그인</button></a><br />
</c:if>
<c:if test="${sessionID != null }">
	${sessionID } 로그인 중<br />
	<a href="logout.do"><button>로그아웃</button></a><br />
	<a href="bbs.do"><button>게시판</button></a><br />
</c:if>
</body>
</html>