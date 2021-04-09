<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <form action="<%=request.getContextPath() %>/view.jsp"> --%>
<form action="view.jsp" method="post">

보고 싶은 페이지 선택:
	<select name="code">
		<option value="A">A 페이지</option>
		<option value="B">B 페이지</option>
		<option value="C">C 페이지</option>
	</select>
	
<input type="submit" value="이동">
</form>
</body>
</html>

<!-- form내에 위치 <form action="<%=request.getContextPath() %> /jsp_0409/view.jsp-->
<!-- 절대 경로로 위치 이동, 위의 방법으로 진행 권장-->