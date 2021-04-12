<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table> <!-- 5강 18p참고 -->
	<tr>
	<td colspan=2><jsp:include page="include/top.jsp"/></td>
	</tr>
	<tr>
	<td><jsp:include page="include/menu.jsp"/></td>
	<td>챔피언을 선택하십시오.<br>
	<img src="../images/champ.jpg" width=200;>
	</td>
	</tr>
	<tr>
	<td colspan=2><jsp:include page="include/bottom.jsp"/></td>
	</tr>
</table>
</body>
</html>