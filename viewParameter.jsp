<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<!-- requestParameter(String name) : 요청 패러미터 이름이 name인 값을 전달 받음, 해당 패러미터 값 없으면 null -->
<b>request.getParameter() 메서드 사용</b><br>
name 파라미터 = <%= request.getParameter("name") %><br>
address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues() 메서드 사용</b><br>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null) {
		for(int i=0; i< values.length; i++) {
	%>
		<%= values[i] %>
	<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
	%>
		<%= name %>
	<%
	}
	%>
	<p>
	<b>request.getParameterMap()메서드 사용</b><br>
	<% 
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		if (nameParam != null) {
		%>
		name = <%= nameParam[0] %>
		<%
		}
		%>	
</body>
</html>