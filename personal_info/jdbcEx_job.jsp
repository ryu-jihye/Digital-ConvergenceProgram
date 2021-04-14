<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<th>EMPNO</th><th>ENAME</th><th>JOB</th><th>DEPTNO</th>
</tr>
<%
   String url="jdbc:oracle:thin:@localhost:1521:xe";
   String dbID="scott", dbPWD="tiger";
   Connection conn = null;
   PreparedStatement pstmt=null;
   ResultSet rs = null;
   String sql = null;
   try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url, dbID, dbPWD);
      out.println("DB연결성공");
      sql = "select * from job";
      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery();
      while(rs.next()){
         
      %>
         <tr>
            <td><%=rs.getString(1)  %></td>
            <td><%=rs.getString(2)  %></td>
            <td><%=rs.getString(3)  %></td>
            <td><%=rs.getString(4)  %></td>
            
         </tr>
      <%}
   }catch(Exception e){
      e.printStackTrace();      
   }finally{
      conn.close();
   }
%>
</table>
</body>
</html>