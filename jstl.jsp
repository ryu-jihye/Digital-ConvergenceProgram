<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<c:out value="<h1>Hello JSTL</h1>"></c:out>
	
	<c:set var="test" value="Hello JSTL" />
	<h3>
		&lt;c:set&gt; 사용 후 :
		<c:out value="${test }" />
	</h3>
	
	<c:set var="test" value="Hello JSTL" />
	<h3>
		&lt;c:set&gt; 사용 후 :
		<c:out value="${test }" />
	</h3>
	<c:remove var="test" />
	<h3>
		&lt;c:remove&gt; 사용 후 :
		<c:out value="${test }" />
	</h3>
	
	<c:catch var="err">
		<%=10 / 0%>
	</c:catch>
	<h3>
		&lt;c:catch&gt;로 잡아낸 오류 :
		<c:out value="${err }" />
	</h3>
	
	<c:if test="${5 < 10 }">
		<h3>5는 10보다 작다.</h3>
	</c:if>
	<c:if test="${6 + 3 == 9 }">
		<h3>6 + 3 = 9</h3>
	</c:if>
	
	<c:choose>
		<c:when test="${5 + 10 == 50 }">
			<h3>5 + 10 = 50</h3>
		</c:when>
		<c:when test="${5 + 10 == 20 }">
			<h3>5 + 10 = 20</h3>
		</c:when>

		<c:otherwise>
			<h3>5 + 10 != 50</h3>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="count" begin="1" end="5" step="1">
		<h${count }>글자 크기</h${count }>
	</c:forEach>
	
	<c:forTokens var="alphabet" items="a,b,c,d,e,f,g,h" delims=",">
		<b>${alphabet }</b><br />
	</c:forTokens>
	
	<c:set var="data" value="a,b,c,d,e,f,g,h" />
	<c:forTokens var="alphabet" items="${data }" delims=",">
		<b>${alphabet }</b><br />
	</c:forTokens>
</body>
</html>