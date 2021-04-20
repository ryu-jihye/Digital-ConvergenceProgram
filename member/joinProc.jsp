
<%@page import="java.util.ArrayList, org.beans.Members"%>
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
	<%
		request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	%>
	<jsp:useBean id="members" class="org.beans.Members" />
	<jsp:setProperty name="members" property="*" />
	<%
		String sql = null;
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	sql = "insert into members values(?,?,?,?,?,?,SYSDATE)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, members.getUserId());
	pstmt.setString(2, members.getUserPwd());
	pstmt.setString(3, members.getUserName());
	pstmt.setString(4, members.getPhoneNo());
	pstmt.setString(5, members.getAddress());
	pstmt.setString(6, members.getEmail());
	int result = pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	if (result != 0)
		response.sendRedirect(request.getContextPath() + "/member/resultMember.jsp?msg=1");
	%>
</body>
</html>