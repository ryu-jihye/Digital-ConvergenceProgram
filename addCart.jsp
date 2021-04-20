<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.beans.Products"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 요청에서 패러미터를 추출하여 proId에 저장 
	 정상적으로 카트에 추가된 후 상세보기 페이지로 이동 -->
	<%
		String proId = request.getParameter("proId");
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from products where proId=?");
			pstmt.setString(1, proId);
			ResultSet rs = pstmt.executeQuery();

			Products selectedItem = null;
			if (rs.next()) {
		selectedItem = new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
		rs.getString(6), rs.getInt(7), rs.getString(8));
			}

			ArrayList<Products> cartList = (ArrayList<Products>)session.getAttribute("cartList");

			if (cartList == null) { //세션에 카트리스트가 없으면 카트 리스트는 선택된 모든 아이템 저장
		cartList = new ArrayList<Products>();
		session.setAttribute("cartList", cartList); //새로 생성
			}
			int cnt = 0;
			Products orderdItem = new Products(); //주문 상품
			for (int i = 0; i < cartList.size(); i++) {
		orderdItem = cartList.get(i); //세선에 추가된 상품을 주문 상품에 추가
		if (orderdItem.getProId().equals(proId)) {
			int orderedQuantity = orderdItem.getQuantity() + 1;
			orderdItem.setQuantity(orderedQuantity);
			out.print("++" + orderdItem.getQuantity());
		}
			}
			if (cnt == 0) { //카트에 추가된 적이 없으면
		selectedItem.setQuantity(1); //최초 주문수량을 1로 설정
		cartList.add(selectedItem); //카트리스트에 추가
			}
			/* out.print("aaa"); */
			response.sendRedirect("productDetail.jsp?proId=" + proId);
	%>

</body>
</html>