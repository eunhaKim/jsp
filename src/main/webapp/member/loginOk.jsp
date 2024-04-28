<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String keepValue = request.getParameter("keepValue");
	
	if(mid.equals("admin") && pwd.equals("1234")){
		if(keepValue.equals("true")){
			Cookie cookieMid = new Cookie("cMid", mid);
		  cookieMid.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일 = 60 * 60 * 24 = ?
		  response.addCookie(cookieMid);
		  
		  Cookie cookiePwd = new Cookie("cPwd", pwd);
		  cookiePwd.setMaxAge(60*60*24);
		  response.addCookie(cookiePwd);
		  
		  Cookie cookieKeepValue = new Cookie("cKeepValue", keepValue);
		  cookieKeepValue.setMaxAge(60*60*24);
		  response.addCookie(cookieKeepValue);
		}
		else if(keepValue.equals("false")){
			Cookie[] cookies = request.getCookies();

			for(int i=0 ; i < cookies.length ; i++){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
%>
<script>
	alert("<%=mid%>님 로그인되셨습니다.");
	location.href="loginMain.jsp?mid=<%=mid%>";
</script>
<% }	else { %>
<script>
	alert("로그인실패~~");
	location.href="login.jsp";
</script>
<% } %>
