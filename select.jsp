<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
<style>
table {
	border-collapse: collapse;
}

th {
	width: 100px;
	background-color: rgb(255, 140, 140);
	border-color: black;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<h1>도시 목록 조회</h1>
	<table border="1">
		<tr>
			<th>도시 이름</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
		<%
			// JDBC 참조 변수 준비
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott", pw = "tiger";

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			// 1) JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");

			// 2) DB연결(DB url, DB id, DB pw)
			con = DriverManager.getConnection(url, user, pw);

			// 3) SQL문 준비
			String sql = "SELECT * FROM sample";
			pstmt = con.prepareStatement(sql);

			// 4) 실행
			rs = pstmt.executeQuery();

			// 5) 결과를 테이블에 출력
			while (rs.next()) {
				String cityName = rs.getString("city_name");
				double latitude = rs.getDouble("latitude");
				double longitude = rs.getDouble("longitude");
		%>
		<tr>
			<td><%=cityName%></td>
			<td><%=latitude%></td>
			<td><%=longitude%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		// JDBC 자원 닫기
		rs.close();
		pstmt.close();
		con.close();
	%>
</body>
</html>