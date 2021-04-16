<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.conan.vo.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
</head>
<body>
   <jsp:useBean id="product" class="com.conan.vo.Products" scope="request" />
   <jsp:setProperty property="*" name="product"/>
   <%
      String proId = request.getParameter("proId");
   InitialContext ic = new InitialContext();
   DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
   Connection conn = ds.getConnection();
   PreparedStatement pstmt = conn.prepareStatement("select * from products where proid=?");
   pstmt.setString(1, proId);
   ResultSet rs = pstmt.executeQuery();
   rs.next();
   %>
   <jsp:include page="menu.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 상세정보</h1>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <div class="col-md-6">
            <h3><%=rs.getString(2) %></h3>
            <p><%=rs.getString(4) %></p>
            <p>
               <b>상품 코드: </b><span class="badge badge-danger"><%=rs.getString(1)%></span>
            </p>
            <p>
               <b>제조사: </b><%=rs.getString(5)%></p>
            <p>
               <b>분류: </b>
            </p>
            <p>
               <b>재고 수: </b><%=rs.getString(7)%></p>
            <p><%=rs.getInt(3) %></p>
            <a href="addProduct.jsp" class="btn btn-info">상품 주문 &raquo;</a> 
            <a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
         </div>
      </div>
   </div>
   <%
   rs.close();
   pstmt.close();
   conn.close();
   %>
</body>
</html>