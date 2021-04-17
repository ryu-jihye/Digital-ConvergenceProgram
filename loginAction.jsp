<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형에 반응하는 메타탭 -->
<meta http-equiv="Content-Type" content="text/html"; charset-UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
	/*login 함수는 UserDAO.java에 존재*/
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1) { /*로그인 성공*/
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("location.href = 'main.jsp'");
			script.print("</script>");
		}
		else if(result == 0) {/*비밀번호 불일치*/
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('비밀번호가 틀립니다.')");
			script.print("history.back()");
			script.print("</script>");
		}
		else if(result == -1) { /*아이디가 없음*/
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('존재하지 않는 아이디입니다.')");
			script.print("history.back()");
			script.print("</script>");
		}
		else if(result == -2) { /*데이터 베이스 오류*/
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('데이터베이스 오류가 발생했습니다.')");
			script.print("history.back()");
			script.print("</script>");
		}
	%>
</body>
</html>