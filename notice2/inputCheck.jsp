<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/CSS" href="css/board.css">
<title>edit</title>
</head>
<body>
<%!
	private final String driver="oracle.jdbc.driver.OracleDriver";
	private final String url="jdbc:mysql:/jdbc:oracle:thin:@localhost:1521:xe";
	private final String user="scott";
	private final String psword="tiger";
%>
<%
	Connection conn=null;
	Statement stmt=null;
	String query =null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,psword);
		stmt = conn.createStatement();
	} catch(ClassNotFoundException e){
		System.out.println("Driver load fail! ");
	} catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>