<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String shppingCartId = "";
	String shippingName = "";
	String shippingCountry = "";
	String shippingAddress = "";
	String shippingPostnumber = "";
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
<div class="container">
	<%!String greeting = "주문 완료";
	String tagline = "주문 완료";%>
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	<p>주문은 <%=shippingDate %>에 배송될 예정입니다.
	<p>주문번호 : <%=shppingCartId %>
	<p>이름 : <%=shippingName %>
</div>
<div class="container">
	<p><a href="../products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
</div>
<%

session.invalidate(); //세션에서 카트 제거

for(Cookie cookie : cookies) {
	String name = cookie.getName();
	if(name.equals("shippingCartId"))
		cookie.setMaxAge(0);
	else if(name.equals("shippingName"))
		cookie.setMaxAge(0);

/* //나머지 쿠키들도 제거
    Cookie id = new Cookie("shippingCartId", null); // 특정 쿠키만 삭제하기
    id.setMaxAge(0);
    response.addCookie(id); -> 사용하지 않음 위에서 이미 처리*/ 
    
} 
%>
</body>
</html>