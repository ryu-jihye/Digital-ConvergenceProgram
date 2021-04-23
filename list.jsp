<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="bList" value="${bList}"/>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">${memberId}게시판</h1>
	</div>
</div>
<div class="container">
	<form action="writeFrm.jsp" method="post">
	<div><div class="text-right">
		<span class="badge badge-warning">총 게시물${cnt}개</span>
	</div></div>
	<div style="padding-top:50px">
		<table class="table table-hover">
			<tr>
				<th width="15%">#</th><th width="30%">제목</th><th width="30%">작성일</th><th width="10%">조회</th><th width="15%">글쓴이</th>
			</tr>
			<c:forEach var="b" items="${bList}">
			<tr>
				<td>${b.boardNo}</td><td><a href="${contextPath}/board/viewProc.do?boardNo=${b.boardNo}">${b.title}</a></td>
				<td>${b.regDate}</td>
				<td>${b.hit}</td><td>${b.userId}</td>
			</tr>
			</c:forEach>
		</table>
		<table>
		<tr>
				<td width="100%" align="left">&nbsp;&nbsp;
				<select name="items" class="txt">
					<option value="subject">제목에서</option>
					<option value="content">본문에서</option>
					<option value="name">글쓴이에서</option>
				</select>
				<input name="text" type="text">
				<input type="submit" id="btnAdd" class="btn btn-danger" value="검색">
				</td>
				<td width="100%" align="right">
					<a href="writeFrm.jsp" 
					onclick="checkFrm();return false" class="btn btn-info">&laquo;글쓰기</a>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
<script type="text/javascript">
function checkFrm(){
	if(${memberId==null}){
		alert("로그인 해주세요");
		return false;
	}
	location.href="<%=request.getContextPath()%>/board/writeFrm.jsp";
}
</script>
</html>