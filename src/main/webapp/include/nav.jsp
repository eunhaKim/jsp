<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	String mid_ = (String) session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
%>
<nav class="navbar navbar-expand-sm bg-danger navbar-dark mb-5">
  <%-- <a class="navbar-brand" href="<%=request.getContextPath()%>">Home</a> --%>
  <a class="navbar-brand" href="http://192.168.50.70:9090/javaclass/Main">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList">Guest</a>
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
	        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex2_GuGuDan.jsp">구구단계산</a>
	        <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t2_Session.jsp">세션연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0427_storage/t4_StorageTest.jsp">Storage연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex1_Login.jsp">아이디저장연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/el1.jsp">EL연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0429_JSTL/jstl1.jsp?jumsu=85&code=K">jstl연습</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t1_Filter.jsp">Filter한글연습</a>
			    <%-- <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/filter/t2_Certification.jsp">인증코드발생(관리자)</a> --%>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/init/t03_init.jsp">초기값확인</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿 생명주기</a>
			    <a class="dropdown-item" href="<%=request.getContextPath()%>/study/database/LoginList">데이터베이스연습</a>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        Study2
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호암호화</a>
	        <a class="dropdown-item" href="${ctp}/mapping/test1">디렉토리매핑연습</a>
	        <a class="dropdown-item" href="${ctp}/mapping/test2.do">확장자매핑연습</a>
	        <a class="dropdown-item" href="${ctp}/mapping/test3.do3">확장자매핑연습3</a>
	        <a class="dropdown-item" href="${ctp}/mapping/test4.do4">확장자매핑연습4</a>
	        <a class="dropdown-item" href="${ctp}/ajaxTest1.st">AJAX연습(일반)</a>
	        <a class="dropdown-item" href="${ctp}/ajaxTest2.st">AJAX연습(응용)</a>
	        <a class="dropdown-item" href="${ctp}/ajaxTest3.st">AJAX연습(회원관리)</a>
	      </div>
	    </li>
	    <% } %>
	    <li class="nav-item">
	    <% if(!mid_.equals("")){ %>
        <a class="nav-link" href="${pageContext.request.contextPath }/database/Logout">Logout</a>
      <% } else { %>
        <a class="nav-link" href="<%=request.getContextPath()%>/study/database/login.jsp">Login</a>
      <% } %>
      </li>
    </ul>
    <button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=request.getContextPath()%>/member/login.jsp'">로그인</button>
  </div>  
</nav>