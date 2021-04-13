<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="javabeans.ELBean"/>
<jsp:setProperty name="bean" property="*"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language Bean Test</title>
</head>
<body>
<h2> EL Bean Test</h2>
액션 빈즈 태그 <br/>

id : <jsp:getProperty property="id" name="bean"/><br/>
password :  <jsp:getProperty property="passwd" name="bean"/><br/>
siteBean : <jsp:getProperty property="siteName" name="bean"/><br/>

<br><br>

EL Bean <br/>

id : ${bean.id}<br/>
password : ${bean.passwd}<br/>
siteBean : ${bean.siteName}<br/>

</body>
</html>