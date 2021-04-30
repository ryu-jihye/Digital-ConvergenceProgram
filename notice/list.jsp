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
<c:set var="nList" value="${nList}"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>

<!-- 
		} else if(cmd.equals("/notice/listProc.do")) {
			System.out.println("list.Proc");
			List<NoticeVO> nList = dao.selectNoticeAll();
			request.setAttribute("cnt", dao.getListCount());
			request.setAttribute("nList", nList);
			rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response); -->
<%-- <jsp:include page="../menu.jsp"/> --%>
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
			<c:forEach var="n" items="${nList}">
			<tr> <!-- int noticeNo, String managerID, String title, String content, String regDate, int hit -->
				<td>${n.noticeNo}</td><td><a href="${contextPath}/board/viewProc.do?boardNo=${n.noticeNo}">${n.title}</a></td>
				<td>${n.regDate}</td>
				<td>${n.hit}</td><td>${b.userId}</td>
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

</body>
<script type="text/javascript">
function checkFrm(){
	if(${memberId==null}){
		alert("로그인 해주세요");
		return false;
	}
	location.href="<%=request.getContextPath()%>/notice/writeFrm.jsp";
}
</script>
</html>