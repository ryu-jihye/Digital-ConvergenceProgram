<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! String greeting = "Welcome to IT's Products";
	String tagline = "제품 설명";%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><%=greeting %></h1>
	</div>
</div>
<main role="main">
	<div class="container">
		<div class="text">
			<h3><%=tagline %></h3>
			<a href="products.jsp" class="btn btn-info">상품  목록 &raquo;</a> 
            <a href="addProduct.jsp" class="btn btn-secondary">상품 등록 &raquo;</a>
		
		</div>
		<hr>
	</div>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>