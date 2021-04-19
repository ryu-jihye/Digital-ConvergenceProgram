	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set> <!-- 이 파일이 있는 자리 -->
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">HOME</a>
		</div>
		<div>
			<% String sessionId = ""; %>
			<ul class="navbar-nav mr auto">
			<c:choose>
			<c:when test="${empty sessionId}"> <!-- sessionId가 비어있으면 이런 식 지정 -->
			<li class="nav-item"><a class="nav-link"
			href="${contextPath }/member/loginFrm.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link"
			href="${contextPath }/member/joinFrm.jsp">회원가입</a></li>
			</c:when> <!-- if문과 비슷 -->
			<c:otherwise>
			<li style="padding-top: 7px; color:white">[<%=sessionId %>님]></li>
			<li class="nav-item"><a class="nav-link"
			href="${contextPath }/member/logout.jsp">로그아웃</a>
			<li class="nav-item"><a class="nav-link"
			href="${contextPath }/member/updateFrm.jsp">회원 수정</a></li>
			</c:otherwise>
			</c:choose>
			</ul>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${contextPath}/products.jsp">상품목록</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품삭제</a></li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>