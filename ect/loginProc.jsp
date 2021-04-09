<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getMethod().equals("POST")) { %>

<%
	request.setCharacterEncoding("UTF-8"); 
	String userId = request.getParameter("userId");	
	String userPwd = request.getParameter("userPwd");
	
	//유효성 처리 -- 비어 있으면 다시 loginFrm.jsp
	if(userId.isEmpty() || userPwd.isEmpty()) {
		RequestDispatcher rd = request.getRequestDispatcher("loginFrm.jsp");
		rd.forward(request, response);
	}
	//로그인 처리
	if(session.isNew() || session.getAttribute("userId") == null) {
		session.setAttribute("userId", userId); //"userId"란 이름으로 userId 등록
		/*session.setMaxInactiveInterval(1*60);  *///재시동 시 60초에 한 번씩 됨 *, 로그아웃 시 문제 발생할 수 있어서 주석 처리/
		out.print("로그인 완료되었음");
	} else {
		out.print("이미 로그인 상태임");
	}
	
%>
아이디 : <%=userId %> / 비밀번호 : <%=userPwd %>
<%
} else if(request.getMethod().equals("GET")) { //짝 맞춰가면서 진행하기(<%)
	if(session != null || session.getAttribute("userId") != null) {
		session.invalidate();
		out.print("로그아웃 작업 완료");
	}
	else {
		out.println("현재 로그인 상태가 아님");
	}
}
%>
</body>
</html>
<!-- a href => get 방식 -->
