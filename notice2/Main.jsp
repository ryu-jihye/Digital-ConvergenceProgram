<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background: url('https://source.unsplash.com/twukN12EN7c/1920x1080')
        no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;
}
 
    nav ul {
        list-style-type: none;
    }
    
    nav ul .list {
        padding: 0 5px;
        float: right;
    }
    
    nav ul::after {
        content: "";
        clear: both;
        display: block;
    }
    
    nav ul .list a {
        text-decoration: none;
        color: olive;
        padding: 0 10px;
    }
    
     .dropdown {
            display: none;
        }
 
    .list:hover .dropdown {
        display: block;
    }
    
</style>
</head>
<body>
 
<!-- Navigation -->
    <nav>
        <ul>
            
          <c:if test="${sessionID==null}">
        <li  class="list"><a href="Login.do">Login</a></li>
        <li class="list"><a  href="Join.do">SignUp</a></li>
          </c:if>
           </ul>
            </nav>
            
            <nav>
          <ul>
          <c:if test="${sessionID!=null}">
         <li class="list"><a href="Logout.do">Logout</a></li>
         
          <li class="list"><a href="Board.do">Board</a></li>
             </c:if>
            
           </ul>  
   </nav> 
   
        <%
            //세션 아이디 유무 확인
            String sessionID = null;
            if(session.getAttribute("sessionID") != null){
                sessionID = (String) session.getAttribute("sessionID");
            }
        %>
    
    <c:if test= '${loginResult == 1}'>
    <div role="alert"
        style="  padding: 30px;
        font-size: 15px;
        font-weight: bold;
        text-align: center;
        background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.5 ); " 
        class="align">
        <span  style="color: gray;">${sessionScope.sessionID} 님이 로그인 하셨습니다.</span><br><br>
        <button type="button" onclick="location.href='Logout.do'">로그아웃</button>
        
        
        <c:if test= '${joinResult == 1}'>
        <div role="alert"
        style="  padding: 30px;
        font-size: 15px;
        font-weight: bold;
        text-align: center;
        background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0.5 ); " 
        class="align">
        <span  style="color: gray;">${sessionScope.sessionID} 님이 회원가입 하셨습니다.</span><br><br>
        </div>
        </c:if>
        
    
    </div>
    </c:if>
        
    <!-- Page Content -->
    <div class="container">
      <div class="card border-0 shadow my-5">
        <div class="card-body p-5">
          <h1 class="font-weight-light" align="center">환영합니다!</h1>
          <h1 class="lead" align="center">Hello</h1>
          <div style="height: 700px"></div>
          <p class="lead mb-0">You've reached the end!</p>
        </div>
      </div>
    </div>
    
    </body>
</html>
