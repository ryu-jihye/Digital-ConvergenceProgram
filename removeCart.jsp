<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.beans.Products" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String proId = request.getParameter("proId");
	ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
	Products selectedItem = new Products();
	for(int i = 0; i<cartList.size(); i++) {
		selectedItem = cartList.get(i);
		if (selectedItem.getProId().equals(proId)) { cartList.remove(selectedItem); }
	}
%>
<!-- cart.jsp로 리다이렉트 -->
<jsp:forward page="cart.jsp">
</body>
</html>