<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = (String) session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
%>
<nav class="navbar navbar-expand-sm bg-danger navbar-dark mb-5">
  <%-- <a class="navbar-brand" href="<%=request.getContextPath()%>">Home</a> --%>
  <a class="navbar-brand" href="http://192.168.50.70:9090/javaclass/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Guest</a>
      </li>
      <% if(!mid_.equals("")){ %>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>    
      <!-- Dropdown -->
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        Study
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t01.jsp">서버환경</a>
	        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0426/t02.jsp">성적계산</a>
	        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex1_Login.jsp">아이디저장연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp">jstl연습</a>
	      </div>
	    </li>
	    <% } %>
	    <li class="nav-item">
	    <% if(!mid_.equals("")){ %>
        <a class="nav-link" href="${pageContext.request.contextPath }/j0427/Logout">Logout</a>
      <% } else { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/study/0428_Login/login.jsp">Login</a>
      <% } %>
      </li>
    </ul>
    <button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=request.getContextPath()%>/member/login.jsp'">로그인</button>
  </div>  
</nav>