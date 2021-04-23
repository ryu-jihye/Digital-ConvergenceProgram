<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
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
		</div
</body>
</html>