<%@page import="java.util.*"%>
<%@page import="org.beans.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String proId = request.getParameter("proId");
   InitialContext ic = new InitialContext();
   DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
   Connection conn = ds.getConnection();

   PreparedStatement pstmt = conn.prepareStatement("select * from products where proId=?");
   pstmt.setString(1, proId);
   
   ResultSet rs = pstmt.executeQuery();
   
   Products selectedItem = null;
   if(rs.next()){
      selectedItem = new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4)
            , rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
   }
   ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
   
   
   if(cartList == null){
      cartList = new ArrayList<Products>();
      session.setAttribute("cartList", cartList);
   }
   int cnt = 0;
   Products orderItem = new Products();
   for(int i=0; i<cartList.size(); i++){
      orderItem = cartList.get(i);
      if(orderItem.getProId().equals(proId)){
         cnt++;
         int orderQuantity = orderItem.getQuantity() +1;
         orderItem.setQuantity(orderQuantity);
         out.print("++"+orderItem.getQuantity());
      }
   }
   if(cnt == 0){
      selectedItem.setQuantity(1);
      cartList.add(selectedItem);
   } 
    /* out.print(selectedItem.getQuantity());  */

   response.sendRedirect("productDetail.jsp?proId="+proId);
   
   rs.close(); pstmt.close(); conn.close();
%>
<body>

</body>
</html>