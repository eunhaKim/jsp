<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String selectImg = request.getParameter("img");
	String[] selectImgArr = request.getParameterValues("img2");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<div>파일명 : <%=selectImg %></div>
	<div>
	  <img src='<%=request.getContextPath() %>/images/<%=selectImg %>.jpg' width="400px"/>
	</div>
	<div>
		파일명2 : <%
		for(int i=0 ; i<selectImgArr.length ; i++){
			out.println("<li>"+selectImgArr[i]+"</li>");
		}
	%>
	</div>
	<div>
	<%
		for(int i=0 ; i<selectImgArr.length ; i++){
			out.println("<img src='"+request.getContextPath()+"/images/"+selectImgArr[i]+".jpg' width='400px'/>");
		}
	%>
	</div>
</div>
<p><br/></p>
</body>
</html>