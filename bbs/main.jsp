<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("sessionId") == null) { %>
<center>
<br /><br /><br />
<h1>Welcome</h1>
<br /><br /><br />
<form action="logPro.jsp" method="post">
	ID <input type="text" name="id" /><br /><br />
	PW <input type="password" name="pw" /><br /><br />
	<input type="submit" value="Login"/>
	<input type="button" value="SignUp" onClick="window.location='signup.jsp'" />
</form>
</center>
<% } else { %>
<center>
<h2>Welcome back, <%=session.getAttribute("sessionId") %></h2>
<input type="button" value="Logout" onclick="window.locaion='logout.jsp'" />
<% } %>
</center>

</body>
</html>