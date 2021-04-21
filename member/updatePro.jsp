<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="org.beans.Members"/>
<jsp:setProperty property="*" name="member"/>

<%
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "update members set userPwd=?, userName=?, phoneNo=?, address=?, email=? where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, member.getUserPwd());
pstmt.setString(2, member.getUserName());
pstmt.setString(3, member.getPhoneNo());
pstmt.setString(4, member.getAddress());
pstmt.setString(5, member.getEmail());
pstmt.setString(6, member.getUserId());
boolean result=pstmt.execute();

if(result==true){
	      response.sendRedirect(request.getContextPath()+"/member/resultMember.jsp?msg=0");
	   }
%>
<jsp:forward page="updateResult.jsp"/>