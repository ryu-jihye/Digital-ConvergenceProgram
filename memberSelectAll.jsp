<%@page import="org.beans.d.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.beans.d.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDAO dao = MemberDAO.getInstance(); //md 자원 얻음
	ArrayList<MemberDTO> dtos = dao.selectMemberAll();
	//String userId, String userPwd, String userName, String phoneNo, 
	//String address, String email, String regDate
	%>
<c:set var="list" value="<%=dtos%>" /> <!--test의 값을 list에 넣기 -->
	<table border="2">
		<tr>
		<th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>이메일</th><th>등록일</th>
		</tr>
		<c:foreach var="item" items="${list }">
			<!--list에 넣은 값을 item에 넣기-->
			<tr>
				<td>${ item.userId}</td>
				<td>${ item.userPwd}</td>
				<td>${ item.userName}</td>
				<td>${ item.phoneNo}</td>
				<td>${ item.address}</td>
				<td>${ item.email}</td>
				<td>${ item.regDate}</td>
			</tr>
		</c:foreach>
	</table>







</body>
</html>