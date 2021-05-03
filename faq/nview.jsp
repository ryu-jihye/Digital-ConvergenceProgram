<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pass = "tiger";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {
		
		String sql = "SELECT USERID, TITLE, content, IQDATE, HIT FROM inquiry WHERE IQNO=" + idx;
		
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		 if(rs.next()){
				String userid = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String iqdate = rs.getString(4);
				int hit = rs.getInt(5);
				hit++;
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <style>
h1 { text-align: center; }

table {
	margin-left: auto;
	margin-right: auto;
}
h3 {text-align: center; color:white;}
h4 {text-align: left; color:black;}
.container{padding-top: 100px; padding-bottom: 30px;}
.tacontent{width:550px; height:100px; padding:8px; border-radius: 5px;}

input[type=text], input[type=password], textarea{
width:550px; height:30px;
border: none;  font-size: 18px;
background-color:white;}
input[type=submit]{
width:563px; height:40px;
border: none;  font-size: 18px;}
.ip{
display: flex;
	justify-content: center;
	align-items: center;
}
.ip>input {
	font-size: 18px;
	border-radius: 5px;
	padding: 8px;
	background-color: white;
	border: white;
}
.sm {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
}

.sm>input{
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
	background-color: white;
	border-radius: 5px;
}

.sm>input:hover {background-color: black;}
table{width:980px;}
#order{padding-top:15px; padding-bottom:15px;}
.container{padding-top: 100px; padding-bottom: 30px;}
input[readonly]{background-color: #E3DCAC}
.content{padding-top: 20px; padding-bottom:20px;}
.ip {padding-top: 30px; }
.sm {padding-top: 20px;}
.aleft{padding-right:20px;}
.aright{padding-left:20px;}
.tacontent{width:550px; height:100px; padding:8px; border-radius: 5px;}
h1{text-align: center; color:white;}
h3{text-align: left; color:white;}
div1{float:left;}
</style>
 <title>상세 페이지</title>
<%--  <jsp:include page="../menu.jsp"/> --%>
 </head>
 <body>
 <jsp:include page="../menu.jsp" />
 <br>
 <br>
 <div class="container">
		<h1>상세 페이지</h1>
</div>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
    </table>
    	<div class="ip">
		<h3>글번호</h3>
		<input type="text" name="title" value=<%=idx%>></div>
		<div class="ip">
		<h3>조회수</h3>
			<input type="text" name="title" value=<%=hit%>></div>
		<div class="ip">
		<h3>작성자</h3>
			<input type="text" name="title" value=<%=userid%>></div>
		<div class="ip">
		<h3>날짜</h3>
			<input type="text" name="title" value=<%=iqdate%>></div>
		<div class="ip">
		<h3>제목</h3>
			<input type="text" name="title" value=<%=title%>></div>
		<div class="ip">
		<h3>내용</h3>
			<input type="text" name="title" value=<%=content%>></div>
<%  
	//게시판 번호마다 구분 값 : idx, 위에서 hit++를 해줬기에 특정 nview 클릭 시 조회 수 증가
 	sql = "UPDATE inquiry SET HIT=" + hit + " where iqno=" +idx;
 	pstmt.executeUpdate(sql); 
 	rs.close();
 	pstmt.close();
 	conn.close();
	 	} 
	}catch(SQLException e) {
}

%>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
 
	<a href='nlist.jsp'" onclick="chenForm();" style="float:right;"><h2>목록</h2></a>
			
	<c:if test="${userID==null}">
     </c:if>
     <c:if test="${userID!=null}">
     	<div1><a href='nmodify.jsp?idx=<%=idx%>'" onclick="chenForm();" style="float:left;"><h2>수정</h2></a><br><br></div>
     	<div1><a href='ndelete.jsp?idx=<%=idx%>'" onclick="chenForm();" style="float:left;"><h2>삭제</h2></a><br><br></div>
     </c:if>
     <c:if test="${userID == 'manager'}">
    	<div1><a href='nreply.jsp?idx=<%=idx%>'" onclick="chenForm();" style="float:left;"><h2>답글</h2></a><br><br></div>

         	</c:if> 
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>
 </html>