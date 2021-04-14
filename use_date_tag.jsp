<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>numberFormat 태그</title>
</head>
<body>

<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
<fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
<fmt:formatDate value="${now}" type="time" /><br>
<fmt:formatDate value="${now}" type="both" 
				dateStyle="full" timeStyle="full" /><br>
<fmt:formatDate value="${now}" pattern="z a h:mm" /><br>

</body>
</html>