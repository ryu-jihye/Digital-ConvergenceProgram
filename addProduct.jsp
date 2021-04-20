<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
<div class="container">
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>

<% String imageUrl = request.getContextPath()+"/upload"; %>

<img alt="img" src="<%=imageUrl%>/${pList.pImage}" width="500px" height="500px">
<div class="container">
	<form action="addProductProc.jsp" method="post" name="newProduct" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
		<label class="col-sm-2"><b>상품코드</b></label>
		<input type="text" name="proId" id="proId" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><b>상품명</b></label>
		<input type="text" name="proName" id="proName" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><b>가격</b></label>
		<input type="number" name="unitPrice" id="unitPrice" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2">상품설명</label>
		<textarea id="description" name="description" class="form-control"></textarea>
		</div>
		<div class="form-group row">
		<label class="col-sm-2">제조사</label>
		<input type="text" name="manufacturer" id="manufacturer" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-10">상품분류
		<b>채소</b><input type="radio" name="category" value="채소" >
		<b>과일</b><input type="radio" name="category" value="과일" >
		<b>육류</b><input type="radio" name="category" value="육류" >
		<b>견과류</b><input type="radio" name="category" value="견과류" >
		</label>
		</div>
		
		<div class="form-group row">
		<label class="col-sm-2">재고수량</label>
		<input type="number" name="noOfStock" id="noOfStock" class="form-control">
		</div>
		
		<div class="form-group row">
		<label class="col-sm-2">상품이미지</label>
		<input type="file" name="proImage" id="pImage" class="form-control"> 
		</div> <!-- 이미지 이름 확인 -->
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록">
			</div>  
		</div>
	</form>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>