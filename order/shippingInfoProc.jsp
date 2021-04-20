<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Cookie cartId = new Cookie("shippingCartId",
		URLEncoder.encode(request.getParameter("cartId"), "UTF-8"));
	Cookie name = new Cookie("shippingName",
		URLEncoder.encode(request.getParameter("name"), "UTF-8"));
	Cookie shippingDate = new Cookie("shippingDate",
			URLEncoder.encode(request.getParameter("shippingDate"), "UTF-8"));
	Cookie country = new Cookie("shippingCountry",
			URLEncoder.encode(request.getParameter("country"), "UTF-8"));
	Cookie address = new Cookie("shippingAddress",
			URLEncoder.encode(request.getParameter("address"), "UTF-8"));
	Cookie postnumber = new Cookie("shippingPostnumber",
			URLEncoder.encode(request.getParameter("postnumber"), "UTF-8"));
	
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	address.setMaxAge(24*60*60);
	postnumber.setMaxAge(24*60*60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(address);
	response.addCookie(postnumber);

	response.sendRedirect("orderConfirmation.jsp");
%>
</body>
</html>