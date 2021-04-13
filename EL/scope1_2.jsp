<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("msg", "아름다운 꽃 푸르른 하늘");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL의 Scope Test</title>
</head>
<body>
<h2> EL의 Scope </h2>

msg(pageSope로 부터 받은 값 : ) : <b> ${pageScope.msg} </b>
<p/>
1에서 10까지의 합(request로 받은 값) : <b><%=request.getAttribute("sum") %></b>
<p/>
1에서 10까지의 합(rquestScope로 받은 값) : <b>${requestScope.sum}</b>
<p/>
</body>
</html>