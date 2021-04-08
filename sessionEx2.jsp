<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
String season = request.getParameter("season");
/* String fruit = request.getParameter("fruit"); */
String userId = (String)session.getAttribute("userId");
String sessionId = session.getId();
int intervalTime = session.getMaxInactiveInterval();
if (userId != null) {
%>
<h1>Session 예제</h1>
<b><%=userId %></b>님이 좋아하는 계절은 <b><%=season %></b>입니다.	
<p>
세션 ID : <%=sessionId %>
세션 유지 시간 : <%=intervalTime %>초
<p>
<%
} else {
	out.println("세션의 시간이 경과 되었거나~");
}
%>
<body>
<h1>Session예제
</h1>
<b><%=userId %></b>
<b><%=season %></b>
<%-- <b><%=fruit %></b> --%>
</body>
</html>