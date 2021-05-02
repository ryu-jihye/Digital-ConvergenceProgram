<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="PtestOut.jsp">
		First name : <input type="text" name="firstName" /><br /><br />
		Last name : <input type="text" name="lastName" /><br /><br />
		<input type="checkbox" name="favoriteLanguage" value="Java"  />Java<br /><br />
		<input type="checkbox" name="favoriteLanguage" value="C"  />C<br /><br />
		<input type="checkbox" name="favoriteLanguage" value="Python"  />Python<br /><br />
		<input type="checkbox" name="favoriteLanguage" value="IDL"  />IDL<br /><br />
		<input type="checkbox" name="favoriteLanguage" value="C#"  />C#<br /><br />
		
		<input type="submit" value="확인" />
	</form>
</body>
</html>