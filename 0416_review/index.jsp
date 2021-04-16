<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp"/> <!-- / 안 넣으면 오류 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>index</title>
</head>
<body>
<%!
	String greeting ="비밀의 숲 소개";
	String tagline = "설계된 진실, 모두가 동기를 가진 용의자다.";
%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-4"><%=greeting %></h1>
	</div>
</div>
<main role="main">
	<div class="text">
		<h4 class="display-5"><%=tagline %></h4> <!-- 동일한 결과 : <h4><%=tagline %></h4> -->
	<img src="image/tree.PNG" width=700px" height="400px" border="10"><br> 
	<a href="person.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">등장인물</a>
	<a href="addperson.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">등장인물 추가</a>	
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>