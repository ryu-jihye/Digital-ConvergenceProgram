<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류발생함(26행부터~)</title>
</head>
<body>
<%
	String adminId = application.getInitParameter("adminId"); //초기 패러미터 읽어오기
	String adminPwd = application.getInitParameter("adminPwd");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	if(userId.equals(adminId) && userPwd.equals(adminPwd)) {
		session.setAttribute("userId", userId);
		out.println("로그인에 성공했음 <a href='loginFrm2.jsp'>로그인 폼으로</a>");
		String idSave = request.getParameter("idSave");
		Cookie cook = new Cookie("savedId", userId);
		if(idSave != null) { //저장을 원하는 경우
			response.addCookie(cook);
		} else { //저장을 원하지 않는 경우, 쿠키를 삭제하고 응답에 추가하여 전송
			cook.setMaxAge(0);
			response.addCookie(cook);
		}
	} else if(userId.equals(adminId)) {
		out.println("<script>alert('비밀번호 불일치'); history.back();</script>");
	} else {
		out.println("<script>alert('아이디 불일치'); history.back();</script>");
	}
%>

<%
 	String savedId = "";
	Cookie cookies[] = request.getCookies();
	if (cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("savedId")) {
				savedId = cookies[i].getValue();
			}
		}
	}
%>
</body>
</html>