<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.conan.vo.Products"%>
<%@page import="java.sql.*,javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="product" class="com.conan.vo.Products"
		scope="request" />
	<%
		InitialContext ic = new InitialContext();

	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select * from Products");
	ResultSet rs = pstmt.executeQuery();
	//데이터를 리스트에 담음
	ArrayList<Products> pl = new ArrayList<Products>();
	while(rs.next()){
		pl.add(new Products(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7)));
		
		
	}
	rs.close(); pstmt.close(); conn.close();
	
	%>
	<jsp:include page="menu.jsp" />

	<!-- 상품목록 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1> <!-- 큰 제목 -->
		</div>
	</div>
	
	<!-- 상품 -->

	<div class="container">
		<!-- 행으로 가운데에 -->
		<div class="row" align="center">
			<!-- list에 리스트를 넣기 -->
			<c:set var="list" value="<%=pl %>"/>
				<!-- 리스트를 한행씩 item에 넣고 출력 -->
				<c:forEach var="item" items="${list}">
				<div class="col-md-4">
					<h3>${item.proName }</h3>
					<p>${item.description }</p>
					<p>${item.unitPrice }원</p>
					<p><a href="productDetail.jsp?proId=${item.proId}"
						class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</div>
				</c:forEach>
		</div>
	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>