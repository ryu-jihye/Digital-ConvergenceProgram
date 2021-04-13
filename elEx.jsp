<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Literal : ${"Literals"}
<br>Operation: ${5>3}
<br>Implicit Object: ${header["host"]}
<br>
<%request.setAttribute("name", "conan"); %>
<!-- 속성값 설정: setAttribute -->

요청 URI = ${pageContext.request.requestURI}<br/>
request의 네임 : ${requestScope.name} <br/>
code 패러미터 : ${param.code}


</body>
</html>