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
		<form action="<c:url value="/board/wirteFrm.jsp"/>" method="post">
			<div>
				<div class="test-right">
					<span class="badge badge-warning">전체 게시글 수 출력 위치</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
				<!-- 데이터 가져오기 -->
				</table>
					<table>
						<tr>
							<td width="100%" align="left">&nbsp;&nbsp; <select
								name="items" class="txt">
									<option value="subject">제목에서</option>
									<option value="content">본문에서</option>
									<option value="name">글쓴이에게</option>
							</select> <input name="text" type="text" /> <input type="submit"
								id="btnAdd" class="btn btn-danger" value="검색" />
							</td>
							<td width="100%" align="right"><a href="#"
								onclick="checkForm(); return false;" class="btn btn-info">&laquo;글쓰기</a>
							</td>
						</tr>
				</table>
		</form>
	</div>

</body>
</html>