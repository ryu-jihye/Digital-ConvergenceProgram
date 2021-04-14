<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NumberFormat 태그 사용</title>
</head>
<body>

<c:set var="price" value="10000"/>
<fmt:formatNumber value="${price}" type="number" var="numberType" />
<br/>
통화 : <fmt:formatNumber value="${price}"
		type="currency" currencySymbol="원"/>
<br/>
퍼센트 : <fmt:formatNumber value="${price}"
		type="percent" groupingUsed="false"/>
<br/>
숫자 : ${numberType}
<br/>
패턴 : <fmt:formatNumber value="${price}"
		pattern="00000000.00"/>
</body>
</html>