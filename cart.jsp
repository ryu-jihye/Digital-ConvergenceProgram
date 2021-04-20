<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.beans.Products" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<%
	String cartId = session.getId();
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<!-- cartId 만들어야 함 -->
					<td align="left"><a href="deleteCart.jsp?cartId=<%=cartId%>"
						class="btn btn-danger">삭제하기</a>
					<td align="right"><a
						href="order/shippingInfo.jsp?cartId=<%=cartId%>"
						class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<%-- <%
				request.setCharacterEncoding("UTF-8");
			String userId = request.getParameter("cartList");
			session.setAttribute("cartList", cartList);
			%> --%>

			<%
				request.setCharacterEncoding("UTF-8");
						int sum = 0;
					ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
					if (cartList == null) {
						cartList = new ArrayList<Products>();
					}
					for (int i = 0; i < cartList.size(); i++) {
						Products product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum += total; //가격
			%>
			<tr>
				<td><%=product.getProId()%> - <%=product.getProName()%></td>
				<td><%=product.getUnitPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
				<td><a href="removeCart.jsp?proId=<%=product.getProId()%>"
					"class="badge badge-danger">삭제</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum%></th>
				<th></th>
			</tr>
		</table>
		<a href="products.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		<jsp:include page="footer.jsp" />
</body>
</html>