<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date" %>

 <%
	request.setCharacterEncoding("UTF-8");	
 	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "scott";
	String pw = "tiger";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String title = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		
		
		Connection conn = DriverManager.getConnection(url,id,pw);
		Statement stmt = conn.createStatement();

		
		String sql = "SELECT TITLE FROM NOTICE4 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

 		if(rs.next()){
			title = rs.getString(1);
 		}
			
	rs.close();
	stmt.close();
	conn.close();
 	
} catch(SQLException e) {

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
  <%
 	SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
 	Date time = new Date();
 	String time1 = sdformat.format(time);
 %>
<table>
<form name=replyform method=post action="nreplyProc.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>답글</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100" value = "re:" "<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="username" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">작성날짜</td>
      <td><input type="text" name="time"  value=<%=time1 %> size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="content" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록"  OnClick="javascript:replyCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body> 
<script language = "javascript">
function replyCheck()
  {
   var form = document.replyform;
   
   if( !form.username.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
</html>
