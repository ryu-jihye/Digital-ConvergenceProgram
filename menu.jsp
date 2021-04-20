
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">HOME</a>
			</div>
		</div>
		<div>
			<% String sessionId = ""; %>
			<ul class="navbar-nav mr auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<!-- sessionId가 비어있으면 이런 식 지정 -->
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/member/loginFrm.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/member/joinFrm.jsp">회원가입</a></li>
					</c:when>
					<!-- if문과 비슷 -->
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId %>님]>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/member/logout.jsp">로그아웃</a>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/member/updateFrm.jsp">회원 수정</a></li>
							<!-- href = ${contextPath} 사용 시 오류 -->
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/products.jsp">상품목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/addProduct.jsp">상품등록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/order/shippingInfo.jsp">상품주문</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/cart.jsp">장바구니</a></li>
				<!-- request.getContextPath() 안 쓰면 order/jsp에서 order에서 머물게 됨 -->
			</ul>
		</div>
	</nav>
</body>
</html>