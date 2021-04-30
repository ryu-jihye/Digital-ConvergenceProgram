<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="notice.NoticeVO" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
 <c:set var="n" value="${vo}"/> 
<%-- <jsp:include page="<%=request.getContextPath()%>/menu.jsp"/> --%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시글 입력</h1>
	</div>
</div>
<div class="container">
 <form name="newWrite" action="updateProc.do" class="form-horizontal" 
method="post" onsubmit="return checkForm()">
	<div class="form-group row">
		<label class="col-sm-2 control-label">회원ID</label>
		<div class="col-sm-3">
			<input type="text" name="managerID" class="form-control" value="${n.managerID}" readonly="readonly">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label">제목</label>
		<div class="col-sm-7">
			<input type="text" name="title" class="form-control" value="${n.title}">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 control-label">내용</label>
		<div class="col-sm-7">
		<textarea class="form-control" rows="7" name="content" >${n.content}</textarea>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
		<c:if test="${memberId==vo.managerID}">
			<input type="submit" class="btn btn-success" value="수정">
			<a href="<%=request.getContextPath()%>/notice/deleteProc.do?boardNo=${n.noticeNo}" class="btn btn-success">삭제</a>
		</c:if>	
			<a href="<%=request.getContextPath()%>/notice/listProc.do" class="btn btn-primary">목록</a>
		</div>
	</div>
</form>
</div>
</body>
<script type="text/javascript">
function checkForm(){
	if(!document.newWrite.title.value){
		alert("제목을 입력하세요");
	}
	if(!document.newWrite.content.value){
		alert("내용을 입력하세요");
	}
} 
</script>
</html>