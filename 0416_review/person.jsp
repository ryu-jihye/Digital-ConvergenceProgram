<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.conan.vo.Products"%>
<%@page import="java.sql.*,javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>등장인물 소개</title>
</head>
<body>
	<!-- java:useBean 자바 인스턴스를 준비한다. 보관소에서 자바 인스턴스를 꺼내거나 자바 인스턴스를 새로 만들어 보관소에 저장하는 코드를 생성한다. -->
	<!-- java:useBean scope 속성 : page(JspContext), request(ServletRequest), session(HttpSession), application(ServletContext) -->
	<java:useBean id="stranger" class="com.conan.vo.strangers"
		scope="request" />
	<%
	//initialcontext : 이름 지정 작업을 수행하기 위한 시작 컨텍스트 
	//초기 컨텍스트는 컨텍스트 인터페이스를 구현하고 이를 확인하기 위한 시작점 제공(JDNI)
	InitialContext ic = new InitialContext();

	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement("select * from stranger");
	ResultSet rs = pstmt.executeQuery();
	
	ArrayList<strangers> sr = new ArrayList<strangers>();
	while(rs.next()) {
		sr.add(new strangers(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
							rs.getInt(6), rs.getString(7)));
	}
	rs.close(); pstmt.close(); conn.close();
	%>
	
	<jsp:include page="menu.jsp"/>
	
	<!-- 기획의도 -->
	<div class="media">
  <img src="image/logo.PNG" class="align-self-start mr-3" alt="..." width="200px" height="150px">
  <div class="media-body">
    <h5 class="mt-0">비밀의 숲 기획의도</h5>
    <p>감정을 느끼지 못하는 외톨이 검사 황시목이, 정의롭고 따뜻한 형사 한여진과 함께 검찰 스폰서 살인사건과 그 이면에 숨겨진 진실을 파헤치는 내부 비밀 추적극</p>
  </div>
</div>
	
	<!-- 등장인물 소개 -->
	<div class="container">
		<div class="row" align="center"> <!-- 행 가운데 -->
			<c:set var="list" value="<%=sr %>"/> <!-- <c:set var="num" value="1" 형식--> <!-- list에 리스트(ArrayList넣기) -->
			<c:forEach var="item" items="${list}"> <!-- 리스트를 한 행씩 item에 넣음 -->
			<!-- 매우 작은 기기(모바일) - 너비가 768px 미만인 화면 .col-xs-*
				   작은 기기(태블릿) - 너비가 768px 이상인 화면 .col-sm-*
				   중간 기기(노트북) - 너비가 992px 이상인 화면 .col-md-*
				   큰 기기(노트북/데스크탑) - 너비가 1200px 이상인 화면 .col-lg-* -->
			<div class="col-md-4">
				<h3>${item.name }</h3>
				<p>${item.department }</p>
				<p>${item.description }</p>
				<p><a href="persondetail.jsp?name=${item.name}"
					class="btn btn-secondary" role="button">상세정보 &raquo;</a>
		</div>
		</c:forEach>
	</div>
	</div>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>