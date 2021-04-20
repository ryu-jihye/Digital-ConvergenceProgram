<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="org.beans.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String cartId = session.getId(); //세션 아이디임
	String shppingCartId = "";
	String shippingName = "";
	String shippingCountry = "";
	String shippingAddress = "";
	String shippingPostnumber = ""; //stringZipcode에 해당
	String shippingDate = "";

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String name = thisCookie.getName();
			if (name.equals("shippingCartId")) {
		shppingCartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if (name.equals("shippingName")) {
		shippingName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if (name.equals("shippingCountry")) {
		shippingCountry = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if (name.equals("shippingPostnumber")) {
		shippingPostnumber = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if (name.equals("shippingAddress")) {
		shippingAddress = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if (name.equals("shippingDate")) {
		shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
		}
	}
	%>
	<div class="container col-8 alert alert-into">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justif-content-between">
			<div class="col-4" align="left">
				<strong>배송주소</strong> <br>이름 :
				<%=shippingName%>
				<br>우편번호 :
				<%=shippingPostnumber%>
				<br>주소 :<%=shippingAddress%>(<%=shippingCountry%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일: <%=shippingDate%></em>
			</div>
		</div>
	</div>
<div class="container col-8 alert alert-info">
	<div>
		<table class="table table-hover">
		<tr><th class="text-center">상품</th><th class="text-center">#</th>
		<tr><th class="text-center">가격</th><th class="text-center">소계</th>
<% int sum=0;
	ArrayList<Products> cartList = (ArrayList<Products>)session.getAttribute("cartList");
	if(cartList == null)
		cartList = new ArrayList<Products>();
	for(int i=0; i<cartList.size(); i++) {
		Products product = cartList.get(i);
	int total = product.getUnitPrice()*product.getQuantity();
		sum = sum + total;
	
%>
	<tr>
		<td class="text-center"><em><%=product.getProName() %></em></td>
		<td class="text-center"><%=product.getQuantity() %></td>
		<td class="text-center"><%=product.getUnitPrice() %></td>
		<td class="text-center"><%=total %>원</td>
	</tr>
<% } %>
	<tr>
		<td></td><td></td>
		<td class="text-right"><strong>총액:</strong>
		<td class="text-center text-danger"><strong><%=sum %>원</strong></td>
		</table>
	</div>
	<div>
		<a href="shippingInfo.jsp?cartId=<%=shppingCartId %>" class="btn btn-secondary" role="button">이전</a>
		<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
		<a href="checkoutCanceled.jsp" class="btn btn-secondary" role="button">취소</a>
	</div>
</div> 
</body>
</html>