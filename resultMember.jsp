<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");
		if (msg != null) {
			out.println("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
		} else if (msg.equals("1")) {
			out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
		} else if (msg.equals("2")) {
			String loginId = (String) session.getAttribute("sessionId");
			out.println("<h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
		} else {
			out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
		}
		%>
	</div>
</body>
</html>