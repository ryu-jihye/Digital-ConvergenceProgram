<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="org.beans.Members"/>
<jsp:setProperty property="userId" name="member" value="${userId}"/>
<%
   request.setCharacterEncoding("utf-8");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = null;
   
   InitialContext ic = new InitialContext();
   DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
   conn = ds.getConnection();
   
   sql="select * from members where userId=?";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, member.getUserId());
   rs=pstmt.executeQuery();
   rs.next();
%>
<form action="updateProc.do" method="post">
   <table border="1">
      <tr>
         <th>아이디</th>
         <td><input type="text" name="userId" value="<%=rs.getString(1)%>" readonly="readonly"></td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td><input type="password" name="userPwd" value="<%=rs.getString(2)%>"></td>
      </tr>
      <tr>
         <th>이름</th>
         <td><input type="text" name="userName" value="<%=rs.getString(3)%>"></td>
      </tr>
      <tr>
         <th>전화번호</th>
         <td><input type="text" name="phoneNo" value="<%=rs.getString(4)%>"></td>
      </tr>
      <tr>
         <th>주소</th>
         <td><input type="text" name="address" value="<%=rs.getString(5)%>"></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td><input type="text" name="email" value="<%=rs.getString(6)%>"></td>
      </tr>
      <tr>
      <td colspan="2" align=center><input type="submit" value="수정하기"></td>
      </tr>
   </table>
</form>
   <%
      rs.close();
      pstmt.close();
      conn.close(); //작업 완료 시 free하게 만들어 줌
      %>

</body>
</html>