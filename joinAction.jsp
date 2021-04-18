<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
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
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('출력이 안 된 사항이 있습니다.')");
			script.print("history.back()");
			script.print("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			/*login 함수는 UserDAO.java에 존재*/
				int result = userDAO.join(user);
				if(result == -1) { 
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("alert('이미 존재하는 아이디입니다.')");
					script.print("history.back()");
					script.print("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.print("<script>");
					script.print("location.href = 'main.jsp'");
					script.print("</script>");
				}
		}
	%>
</body>
</html>