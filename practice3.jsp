<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Q3 1부터 100까지의 합을 구하여 다음과 같이 출력하기 </h1>
1부터 100까지의 합은?
<%
	int sum = 0;
	for(int i=1; i<=100; i++) {
		sum=sum+i;
		if(i<100) {
			out.print(i+"+");
		}
		if(i==100) {
			out.print("100=");
			sum+=100;
		}
	}out.print(sum);%>
</body>
</html>