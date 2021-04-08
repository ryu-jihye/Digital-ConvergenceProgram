<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int total=out.getBufferSize();
	out.print("첫번째 텍스트임"); //출력 버퍼로 저장
	out.clearBuffer(); //버퍼를 지움
	out.print("출력 버퍼의 크기 : "+total);
	out.print("<br> 사용되지 않은 버퍼의 크기 : " +out.getRemaining());
	out.flush(); //버퍼의 내용 출력
	out.print("<br> flush 후 버퍼의 크기 : " +out.getRemaining());
	
%>
<hr>
<h3>out.print() 메소드</h3>
<%
out.print(10);
out.print(true);
out.print("aaa");
out.print('가');
out.print(new java.io.File("/"));
out.println("버퍼의 크기"+out.getRemaining());
%>
</body>
</html>