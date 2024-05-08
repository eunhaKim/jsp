<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test5.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
    'use strict';
    
    function calc(flag) {
    	if(flag == 'hap') myform.action = "hap.do4";
    	else if(flag == 'cha') myform.action = "cha.do4";
    	else if(flag == 'gop') myform.action = "gop.do4";
    	else if(flag == 'mok') myform.action = "mok.do4";
    	
    	myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test5.jsp(/WEB-INF/study2/mapping)</h2>
  <hr/>
  <div>전송 메세지 : ${msg}</div>
  <hr/>
  <select name="select">
  	<a href="list.do5" class="btn btn-success mr-3">연습List</a>
  	<a href="input.do5" class="btn btn-warning mr-3">연습Input</a>
  	<a href="update.do5" class="btn btn-info mr-3">연습Update</a>
  	<a href="delete.do5" class="btn btn-primary mr-3">연습Delete</a>
  	<a href="search.do5" class="btn btn-primary mr-3">연습Search</a>
  </select>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>