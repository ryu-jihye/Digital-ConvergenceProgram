<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container">
		<form action="shippingInfoProc.jsp" class="form-horizontal"
			method="post">
			<input type="hidden" name="cartId"
				value="<%=request.getParameter("cartId")%>" />
			<h3>배송 정보</h3>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control" />(yyyy/mm/dd)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="postnumber" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input name="address" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group fow">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="cart.jsp?cartId="
						<%=request.getParameter("cartId")%>"
				class="btn btn-secondary"
						role="button">이전</a> <input type="submit" class="btn btn-primary"
						value="등록" /> <a href="checkoutCanceled.jsp"
						class="btn btn-secondary" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>