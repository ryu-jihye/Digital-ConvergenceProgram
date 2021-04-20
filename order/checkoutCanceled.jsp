<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//설정돤 새션값들을 모두 사라지도록 함
	session.invalidate();
%>
<jsp:forward page="cart.jsp">
<div class="alert alert-danger" role="alert">
 	주문 취소
</div>

</body>
</html>