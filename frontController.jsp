<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath() %>/member2/login.action">로그인</a><hr/>
<a href="<%=request.getContextPath() %>/member2/insert.action">회원 가입</a><hr/>
<a href="http://localhost:8080/finalEx/member2/select.action">회원 조회</a><hr/>
<a href="<%=request.getContextPath() %>/member2/update.action">회원정보 수정</a><hr/>
<a href="<%=request.getContextPath() %>/member2/delete.action">회원 삭제</a><hr/>
<a href="<%=request.getContextPath() %>/member2/selectAll.action">모든 회원 보기</a><hr/>


</body>
</html>