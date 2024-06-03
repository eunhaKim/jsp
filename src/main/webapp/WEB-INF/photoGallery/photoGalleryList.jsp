<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoGalleryList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    .card {
      float:left;
      margin: 10px;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <table class="table table-borderless">
    <tr>
      <td colspan="2"><h2 class="text-center">포토 갤러리</h2></td>
    </tr>
    <tr>
      <td>
        <select name="part" onchange="">
          <option value="전체" ${part == '전체' ? 'selected' : ''}>전체</option>
          <option value="풍경" ${part == '풍경' ? 'selected' : ''}>풍경</option>
          <option value="인물" ${part == '인물' ? 'selected' : ''}>인물</option>
          <option value="학습" ${part == '학습' ? 'selected' : ''}>학습</option>
          <option value="사물" ${part == '사물' ? 'selected' : ''}>사물</option>
          <option value="기타" ${part == '기타' ? 'selected' : ''}>기타</option>
        </select>
        <select name="choice" onchange="">
          <option value="최신순" ${part == '최신순' ? 'selected' : ''}>최신순</option>
          <option value="추천순" ${part == '추천순' ? 'selected' : ''}>추천순</option>
          <option value="조회순" ${part == '조회순' ? 'selected' : ''}>조회순</option>
          <option value="댓글순" ${part == '댓글순' ? 'selected' : ''}>댓글순</option>
        </select>
      </td>
      <td class="text-right">
        <input type="button" value="사진올리기" onclick="location.href='PhotoGalleryInput.ptg';" class="btn btn-success"/>
      </td>
    </tr>
  </table>
  <c:forEach var="vo" items="${vos}" varStatus="st">
    <div class="card" style="width:200px;">
	    <div class="card-body"><img src="${ctp}/images/photoGallery/vo.fSName}" width="200px" height="150px"/></div> 
	    <div class="card-footer">Footer</div>
	  </div>
  </c:forEach>
</div>
<jsp:include page="/include/footer.jsp" />
<p><br/></p>
</body>
</html>