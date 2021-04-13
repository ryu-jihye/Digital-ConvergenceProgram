<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mm" uri="/WEB-INF/Finctions.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language Test</title>
</head>
<body>
<h2> EL의 정적 메소드 </h2>
123456789 를 1000 단위 구분 기호(,) 로 표시하시오 <p>
<b> result : ${mm:comma(123456789)}</b>
</body>
</html>