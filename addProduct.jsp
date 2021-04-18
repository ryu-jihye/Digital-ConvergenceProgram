<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<jsp:include page="menu.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 등록</h1>
      </div>
   </div>
   <div class="container">
      <form name="newProduct" action="addProductProc.jsp" class="form-horizontal" method="post">
         <div class="form-group row">
            <label class="col-sm-2">상품 코드</label>
            <div class="col-sm-3">
               <input type="text" id="proId" name="proId" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">상품명</label>
            <div class="col-sm-3">
               <input type="text" id="proName" name="proName" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">가격</label>
            <div class="col-sm-3">
               <input type="text" id="unitPrice" name="unitPrice" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">상세 정보</label>
            <div class="col-sm-3">
               <textarea id="description" name="description" class="form-control">
               </textarea>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">제조사</label>
            <div class="col-sm-3">
               <input type="text" id="manufacturer" name="manufacturer" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">분류</label>
            <div class="col-sm-3">
        	<b>핸드폰</b><input type="radio" name="category" value="핸드폰" >
			<b>노트북</b><input type="radio" name="category" value="노트북" >
			<b>태블릿</b><input type="radio" name="category" value="태블릿" >
			<b>기타</b><input type="radio" name="category" value="기타" >
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">재고 수</label>
            <div class="col-sm-3">
               <input type="text" id="noOfStock" name="noOfStock" class="form-control">
            </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
               <input type="submit" class="btn btn-primary" value="등록">
            </div>
         </div>
      </form>
   </div>

</body>
</html>