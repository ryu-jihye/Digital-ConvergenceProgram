<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form name="newWrite" action="writeProc.do"
	class="form-horizontal" method="post" onsubmit="return checkForm()">
	<!-- 채워 넣어야 함  -->
	<div class="form-group row">
		<label class="col-sm-2 control-label">제목</label>
		<div class="col-sm-5">
			<input name="title" type="text" calss="form-control" placeholder="제목입력">
		</div>
</div>
<!-- 채워 넣어야 함 -->
<div class="col-sm-5">
			<input name="content" type="text" calss="form-control" placeholder="내용입력">
		</div>
<div class="forn-group row">
	<div class="col-sm-offset-2 col-sm-10">
		<input type="submit" class="btn btn-success" value="등록">
		<input type="submit" class="btn btn-danger" value="취소">
	</div>
</div>
</form>
</div>
</body>
</html>