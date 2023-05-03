<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
</head>
<body>
<div class="card" style="width: 21rem;">
 <img src="${path}/recipeBoard_servlet/img.do?num=${dto.num}" onerror="this.src='img/plate-4034728_960_720.png'" class="card-img-top" style="height: 250px;">
 <div class="card-body">
  <h5 class="card-title" style="font-weight: bold;">
   <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" color="red">
    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
   </svg>
   좋아요가 가장 많은 레시피
   <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" color="red">
    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
   </svg>
  </h5>
  <p class="card-text" style="font-weight: bold; font-size: 18px;">
   작성자 : 
   <span class="dropdown" style="text-align: center;">
    <a data-bs-toggle="dropdown" href="#">${dto.id}</a>
    <span class="dropdown-menu">
     <a class="dropdown-item" href="${path}/recipeBoard_servlet/view.do?id=${dto.id}">작성글 보기</a>
     <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${dto.id}')">쪽지 보내기</a>
    </span>
   </span>
   <br>
   제목 : ${dto.subject}
  </p>
  <a href="${path}/recipeBoard_servlet/viewContent.do?num=${dto.num}" class="btn btn-dark button" style="width: 100%;">바로가기</a>
 </div>
</div>
<%@ include file="../../include/writeMessageModal.jsp" %>
</body>
</html>