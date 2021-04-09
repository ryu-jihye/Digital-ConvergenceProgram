<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");  %>
<!--<jsp:param name="name" value="장미"/> 값이 나오려면 UTF-8 인코딩이 필요-->
인클루드 전 name parameter : <%=request.getParameter("name") %>
<hr>
<jsp:include page="body_sub.jsp" flush="false">
	<jsp:param name="name" value="장미"/>
</jsp:include>
<hr/>
인클루드 후 name parameter : <%=request.getParameter("name") %>
</body>
</html>