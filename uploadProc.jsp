<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*,
com.oreilly.servlet.multipart.*,
java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String path=application.getRealPath("/upload");
int size= 1024*1024*10;
try {
MultipartRequest multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());

Enumeration files = multi.getFileNames();
String name = (String) files.nextElement();
String file = multi.getFilesystemName(name);
long fileSize = multi.getFile("file").length();
String orgFile = multi.getOriginalFileName(name);
String type = multi.getContentType(name);
out.println("파일명" +file+"<br/>");
out.println("파일크키" +fileSize+"<br/>");
out.println("원본파일명" +orgFile+"<br/>");
out.println("콘텐츠유형" +type+"<br/>");
} catch(Exception e) {
	out.println("오류 발생" + e);
}

%>
</body>
</html>