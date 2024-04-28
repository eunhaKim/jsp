<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String mid = request.getParameter("mid");
	pageContext.setAttribute("mid",mid);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>loginMain.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
	
		function viewInfo() {
			document.getElementById("demo").style.display = "block";
		}
		
		function logout() {
			alert('${mid}님 로그아웃 되었습니다.');
			location.href="login.jsp";
		}
	</script>
</head>
<body>
	<%@ include file = "/include/header.jsp" %>
	<%@ include file = "/include/nav.jsp" %>
	<div class="container text-center">
		<h2>회원 전용방</h2>
	  <hr/>
	  <p>현재 <strong class="text-primary">${mid}</strong>님 로그인 중이십니다.</p>
	  <hr/>
	  <p><img src="<%=request.getContextPath()%>/images/111.jpg" alt="회원전용방 이미지" width="700px"/></p>
	  <hr/>
	  <div>
	  	<button onclick="viewInfo()" class="btn btn-primary">접속조회</button>
	  	<button onclick="logout()" class="btn btn-danger">로그아웃</button>
	  </div>
	  <div id="demo" class="text-left mt-5" style="display:none">
		  <hr/>
		  <h2 class="text-center">서버의 환경변수값 확인하기</h2>
		  <hr/>
		  <ul>
		    <li>호스트IP : <%=request.getRemoteAddr() %></li>
			  <li>전송방식 : <%=request.getMethod() %></li>
			  <li>접속 프로토콜 : <%=request.getProtocol() %></li>
			  <li>접속(서버) 포트 : <%=request.getServerPort() %></li>
			  <li>접속(서버) 이름 : <%=request.getServerName() %></li>
			  <li>접속 Context 이름 : <%=request.getContextPath() %></li>
			  <li>접속 URL : <%=request.getRequestURL() %></li>
			  <li>접속 URI : <%=request.getRequestURI() %></li>
		  </ul>
		  <hr/>
		  <div class="text-center mt-5"><button onclick="location.reload()" class="btn btn-info">새로고침</button></div>
	  </div>
	</div>
	<%@ include file = "/include/footer.jsp" %>
</body>
</html>