<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (request.getMethod().equals("POST")) {
		String id = request.getParameter("userid");
		String pwd = request.getParameter("userpwd");
		session.setAttribute("userid", id);
		session.setAttribute("userpwd", pwd);

		if (!id.equals((String) application.getInitParameter("adminId"))
		|| !pwd.equals((String) application.getInitParameter("adminPwd"))) {
			RequestDispatcher rd = request.getRequestDispatcher("loginFrm2.jsp");
			rd.forward(request, response);
		}
	%>
	로그인에 성공했음<br>
	<a href='loginChk.jsp'>로그인 정보 확인</a>
	<%
		}
	%>
</body>
</html>