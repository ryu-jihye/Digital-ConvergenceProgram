<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language Test</title>
</head>
<body>
	<h2> EL의 Scope 2 </h2>
	id(sessionScope로 받은 값) : <b> ${sessionScope.id} </b></p>
	siteName(applicationScope로 받은 값) : <b> ${applicationScope.siteName}</b>
</body>
</html>