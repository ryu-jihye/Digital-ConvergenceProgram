<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
List<String> nameList = new ArrayList
<String> (Arrays.asList("홍길동", "김철수", "박영희"));
model.addAttribute("nameList", nameList);

<!-- jsp페이지에서 출력 -->
<c:forEach var="name" item="${nameList}" var

</body>
</html>