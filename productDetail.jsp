<%@page import="java.util.ArrayList, org.beans.Products"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.beans.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>

	<jsp:useBean id="product" class="org.beans.Products" scope="request" />
	<%
		InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select * from products where proId=?");
	pstmt.setString(1, request.getParameter("proId"));
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	product = new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
			rs.getString(6), rs.getInt(7), rs.getString(8));

	rs.close();
	pstmt.close();
	conn.close();
	%>
	<c:set var="pro" value="<%=product%>" />
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-md-6">
			<h1>${pro.proName}</h1>
			<p>${pro.description}</p>
			<img src="${imageUrl }/${pList.pImage}" alt="" , width="80%">
			<!-- 사진 넣기 -->
			<p>
				<b>상품코드 : </b><span class="badge badge-danger">${pro.proId}</span>
			</p>
			<p>
				<b>제조사 : </b>${pro.manufacturer}</p>
			<p>
				<b>가격 : </b>${pro.unitPrice}</p>
			<p>
				<b>제품분류 : </b>${pro.category}</p>
			<form name="addForm" action="addCart.jsp" ?proId=${product.proId }
				" method="post">
				<a href="#" class="btn btn-info">상품 주문&raquo;</a> <a href="cart.jsp"
					class="btn btn-warning">장바구니</a> <a href="products.jsp"
					class="btn btn-secondary">상품목록&raquo;</a>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>