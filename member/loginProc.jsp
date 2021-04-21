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
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="org.beans.Members"/>
<jsp:setProperty property="userId" name="member" value="${param.userId}"/>
<jsp:setProperty property="userPwd" name="member" value="${param.userPwd}"/>


<%
System.out.print("dsa");
String sql = null;
String userId = member.getUserId();// 위에 useBean과 setProperty를 해줘서 가능
String userPwd = member.getUserPwd();

InitialContext ic = new InitialContext();
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();

sql = "select userid, userpwd from members where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userId);
ResultSet rs = pstmt.executeQuery();
boolean result = rs.next();

if(!result){//회원이 아닌 경우
   response.sendRedirect(request.getContextPath()+"/member/loginFrm.jsp?error=1");//회원아이디가 없는경우
}else {//아이디는 db에 존재하는 경우
   if(userPwd.equals(rs.getString(2))){
      session.setAttribute("userId", userId);
      response.sendRedirect(request.getContextPath()+"/member/resultMember.jsp?msg=2");
   }else{
      response.sendRedirect(request.getContextPath()+"/member/loginFrm.jsp?error=2");//비밀번호 틀린경우
   }
}
rs.close(); pstmt.close(); conn.close();
%>
</body>
</html>