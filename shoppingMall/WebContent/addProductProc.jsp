
<%@page import="java.util.*, org.beans.Products"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*" %>
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
<% request.setCharacterEncoding("utf-8"); %>
	<%
	MultipartRequest multi = null;
	String path = application.getRealPath("/upload");//시스템 물리적인 경로
	int size = 1024*1024*10;
		multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String proId = multi.getParameter("proId");
		String proName = multi.getParameter("proName");
		int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		int noOfStock = Integer.parseInt(multi.getParameter("noOfStock"));
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("insert into products values(?,?,?,?,?,?,?,?)");
		pstmt.setString(1, proId);
		pstmt.setString(2, proName);
		pstmt.setInt(3, unitPrice);
		pstmt.setString(4, description);
		pstmt.setString(5, manufacturer);
		pstmt.setString(6, category);
		pstmt.setInt(7, noOfStock);
		pstmt.setString(8, orgFile);
		pstmt.execute();
		
		pstmt.close();
		conn.close();
		
		out.println(proId);
	
	
	
	
	
	
	%>
	
	<%--  <c:set var="pro" value="<%=product%>" /> --%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 입력내역</h1>
		</div>
	</div>
	<div class="container">
	<div class="col-md-6">
		<h1>저장이 완료되었습니다!</h1>
		<p><b>상품명 : ${proName}</b></p>
		<p><b>상세설명 : </b> ${description}</p>
		<p><b>상품코드 : </b><span class="badge badge-danger">${proId}</span></p>
		<p><b>제조사 : </b>${manufacturer}</p>
		<p><b>가격 : </b>${unitPrice}</p>
		<p><b>제품분류 : </b>${category}</p>
		<a href="products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
	</div>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>