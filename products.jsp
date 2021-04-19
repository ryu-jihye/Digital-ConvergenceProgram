<%@page import="java.util.ArrayList, org.beans.Products"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="product" class="org.beans.Products" scope="request" />
	<%
		InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select * from products");
	ResultSet rs = pstmt.executeQuery();
	ArrayList<Products> pList = new ArrayList<Products>();
	while (rs.next()) {
		pList.add(new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getInt(7), rs.getString(8)));
	}
	rs.close();
	pstmt.close();
	conn.close();
	
	String imageUrl = request.getContextPath()+"/upload";
	%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:set var="pList" value="<%=pList%>" />
			<c:forEach var="pList" items="${pList}">
			<div class="col-md-4">
			<img alt="image" src="<%=imageUrl%>/${pList.pImage}" width="300px" height="300px">
			<h3>${pList.proName}</h3>
			<p>${pList.description}</p>
			<p>${pList.unitPrice}원</p>
			<P><a href="productDetail.jsp?proId=${pList.proId}" class="btn btn-secondary" role="button">상세정보</a></P>
			</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	

</body>
</html>