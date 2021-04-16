<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.conan.vo.Products"%>
<%@page import="java.sql.*,javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
   String id = request.getParameter("proId");
   String name = request.getParameter("proName");
   int price = Integer.parseInt(request.getParameter("unitPrice"));
   String description = request.getParameter("description");
   String manufacturer = request.getParameter("manufacturer");
   String category = request.getParameter("category");
   int stock = Integer.parseInt(request.getParameter("noOfStock"));

   Products product = new Products(id, name, price, description, manufacturer, category, stock);

   //1.JNDI 서버 객체 생성
   InitialContext ic = new InitialContext();
   //2.lookup()
   DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
   //3.getConnection()
   Connection conn = ds.getConnection();
   String sql = "insert into products (proid, proname, unitprice, description, manufactuer,category, noofstock) values (?,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.setString(2, name);
   pstmt.setInt(3, price);
   pstmt.setString(4, description);
   pstmt.setString(5, manufacturer);
   pstmt.setString(6, category);
   pstmt.setInt(7, stock);
   ResultSet rs = pstmt.executeQuery();
   rs.next();
   
   out.print("등록되었습니다.");
   %>
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
               <input type="text" id="category" name="category" class="form-control">
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