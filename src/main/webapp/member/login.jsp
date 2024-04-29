<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	String pwd = "";
	String keepValue = "";
	if (cookies != null) {
		for (Cookie c : cookies) {
			if(c.getName().equals("cMid")) mid = c.getValue();
			if(c.getName().equals("cPwd")) pwd = c.getValue();
			if(c.getName().equals("cKeepValue")) keepValue = c.getValue();
		} 
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<style>
    
    .login-box {width:700px; margin:0 auto;}
		.login-box h2 {position:relative; line-height:2;margin-bottom:40px;}
    .login-box h2:after {content: ''; position: absolute; left: 0; bottom: 1px; width: 100%; height: 1px; background: #d5d5d5; }
    .login-box .form-inline {margin-bottom:10px;}
    .login-box .form-inline > label {width:150px; font-weight:600}
    .login-box .btn-box {margin-top:40px; border-top:1px solid #ddd; padding-top:40px; text-align:center;}
	</style>
	<script>
    'use strict';
    
    window.onload=()=>{
    	// 아이디저장 체크 쿠키에서 확인
    	const keep = document.getElementById("keep");
    	if('<%=keepValue%>' == 'true'){
    		keep.checked = true;
    	}
    	// 아이디저장 체크박스 값이 변할때 값을 keepValue(체크박스 체크여부값을 가진 변수)에 넣어주고 로그인할때 넘기기 위한처리
    	keep.addEventListener('change',(e)=>{
    		const keepValue = document.getElementById("keepValue");
    		keepValue.value = e.target.checked; // 체크박스 상태값(true,false) 넣기
    	})
    }
    
  </script>
</head>
<body>
	<%@ include file = "/include/header.jsp" %>
	<%@ include file = "/include/nav.jsp" %>
	<div class="container">
		<form name="myform" method="post" class="login-box" action="loginOk.jsp">
			<h2>로그인</h2>
			<div class="form-inline">
				<label for="mid" class="mr-sm-2">아이디</label>
	  		<input type="text" id="mid" name="mid" class="form-control mr-sm-2" placeholder="아이디" value="<%=mid %>" autofocus required />
	  		<div class="form-check mr-sm-2">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" id="keep" name="keep"/> 아이디 저장
			    </label>
			  </div>
			</div>
			<div class="form-inline">
				<label for="pwd" class="mr-sm-2">비밀번호</label>
	  		<input type="password" id="pwd" name="pwd" class="form-control mr-sm-2" placeholder="비밀번호" value="<%=pwd %>" required />
			</div>
			
			<div class="btn-box">
				<input type="submit" value="로그인" class="btn btn-primary" />
				<input type="reset" value="다시입력" class="btn btn-warning" />
				<button type="button" onclick="alert('준비중입니다.')" class="btn btn-success">회원가입</button>
			</div>
			<input type="hidden" name="keepValue" id="keepValue">
		</form>
	</div>
	<%@ include file = "/include/footer.jsp" %>
</body>
</html>