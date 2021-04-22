<%@page import="org.beans.d.MemberDTO"%>
<%@page import="org.beans.d.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MemberDAO mmm = MemberDAO.getInstance();
ArrayList<MemberDTO> aaa = mmm.selectMemberAll();



out.println(aaa.get(0).getUserId());
out.println(aaa.get(0).getUserPwd());
out.println(aaa.get(0).getUserName());

%>
</body>
</html>