<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
		
		String sql = "SELECT USERNAME, TITLE, content, TIME, HIT FROM notice4 WHERE num=" + idx;
		
		conn = DriverManager.getConnection(url,id,pass);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		 if(rs.next()){
				String username = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				hit++;
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=hit%></td> 
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=username%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=time%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=content %>
                </tr>
<%  
	//게시판 번호마다 구분 값 : idx, 위에서 hit++를 해줬기에 특정 nview 클릭 시 조회 수 증가
 	sql = "UPDATE notice4 SET HIT=" + hit + " where NUM=" +idx;
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
	 <td colspan="2" width="399"><input type=button value="목록" OnClick="window.location='u_nlist.jsp'"></td>
	<input type=button value="수정" OnClick="window.location='u_nmodify.jsp?idx=<%=idx%>'"></td>
	<input type=button value="삭제" OnClick="window.location='u_ndelete.jsp?idx=<%=idx%>'"></td>
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>
 </html>