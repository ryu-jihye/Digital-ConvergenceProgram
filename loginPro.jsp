<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- getInitParameter(String paramName) : 
매개변수로 web.xml에 지정했던 param-name 넘겨주면 그에 해당하는 값 갖고 옴-->
<!-- <input type="checkbox" name="idRemember" value="yes">아이디 기억<br> -->
<%! String idRemember; %> 
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(request.getParameter("idRemember")==null){
		idRemember = null;
	}else{
		idRemember = request.getParameter("idRemember");
		//idRemember가 null이 아니면 getParameter
	}

		//loginFrm2 에서 CheckBox가 선택된 상태라면 idRemember 값이 날라올 것임
		if(id.equals(application.getInitParameter("adminId"))&&
		pwd.equals(application.getInitParameter("adminPwd"))&&
		idRemember!=null){
		//그래서 전달 받은 idRemember값이  넘어왔는지 판단
		//체크를 안했다면 null일 것임
		//session.setAttribute("설정한 세션아이디", 세션에 넣을 값);   
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
	
	//요청한 쿠키 갖고 오기
	Cookie[] cookies = request.getCookies();
	if(cookies.length!=2){//이 조건을 넣어줘야 loginFrm2가 2번 실행되도 오류가 안남
		//만일 계속 추가를 해준다면 저장된 아이디 값이 실행때마다 변경됨
	Cookie cookie = new Cookie("idRemember", id);
	//위의 조건을 다 만족 시 쿠키를 만들어 줌. 안에 값으로는 id값이 들어가야 함
	//그래야지 재활용이 가능함.
	response.addCookie(cookie);
	}
	%>
	로그인에 성공했음<br>
	<a href="loginChk.jsp">로그인 정보 확인</a>	
		
<% }else if(!id.equals(application.getInitParameter("adminId"))&&
		pwd.equals(application.getInitParameter("adminPwd"))){
	//아이디만 틀릴 때
%>
	<script>				
		alert('로그인  아이디 정보 오류'); //자바스크립트 명령어임... 로그인 실패시 팝업으로 문제를 알려줌
		history.back(); // 전의 페이지로 돌아감
	</script>
<%
}else if(id.equals(application.getInitParameter("adminId"))&&
		!pwd.equals(application.getInitParameter("adminPwd"))){
	//비밀번호만 틀릴 때
%>
	<script>				
		alert('패스워드 정보 오류');
		history.back();
	</script>
<% 	
}else if(id.equals(application.getInitParameter("adminId"))&&
		pwd.equals(application.getInitParameter("adminPwd"))&&
		idRemember==null){
		session.setAttribute("id", id); //아이디랑 비밀번호는 맞으나 아이디 기억 체크 안했을 때
%>

	로그인에 성공했음<br>
	<a href="loginChk.jsp">로그인 정보 확인</a>	
<%	
	}else{
%>	
	<script>				
		alert('아이디와 패스워드 정보 둘다 오류');
		history.back();
	</script>
<%	
	}
%>
</body>
</html>