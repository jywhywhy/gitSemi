<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$.ajax({
		type: "post",
		url: "${path}/recipeBoardGood_servlet/good.do",
		data: "num=${dto.num}",
		success: function (result) {
			$(".result").html(result);
		}
	});
	if(${message == "noShow"}){
		alert("삭제된 게시물입니다");
		if(${viewUp == "Y"}){
			location.href = document.referrer;
		}else{
			location.href = "${path}/recipeBoard_servlet/list.do?search=";
		}
	}
	$.ajax({
		type: "post",
		url: "${path}/recipeBoardComment_servlet/list.do",
		data: "num=${dto.num}&id",
		success: function (result) {
			$("#result").html(result);
		}
	});
	$("#btnInsert").click(function() {
		var content = $("#content_");
		if(content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		document.form2.submit();
	});
	$("#btnUpdate").click(function() {
		document.form1.action = "${path}/recipe/recipeBoard/updateWrite.jsp";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		if(confirm("글을 삭제하시겠습니까?")){
			document.form1.action = "${path}/recipeBoard_servlet/delete.do";
			document.form1.submit();
		}
	});
	$("#btnReWrite").click(function() {
		document.form1.action = "${path}/recipe/recipeBoard/reWrite.jsp";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<div class="container" style="word-break: break-all;">
 <c:choose>
  <c:when test="${message != 'noShow'}">
   <div class="border border-3 p-4 mt-5 mb-5" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <h2 class="mt-3 mb-3" style="font-weight: bold; float: left;">${dto.subject}</h2>
    <form method="post" id="form1" name="form1">
     <input type="hidden" id="num" name="num" value="${dto.num}">
     <c:choose>
      <c:when test="${sessionScope.id == dto.id || sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
       <input type="hidden" id="subject" name="subject" value="${dto.subject}">
       <input type="hidden" id="content" name="content" value="${dto.content}">
       <div class="fs-5 mt-3" style="float: right;">
        <span class="result"></span>
        <button class="btn btn-dark button" type="button" id="btnUpdate">수정</button>
        <button class="btn btn-dark button" type="button" id="btnDelete">삭제</button>
       </div>
      </c:when>
      <c:otherwise>
       <div class="fs-5 mt-3" style="float: right;">
        <span class="result"></span>
       </div>
      </c:otherwise>
     </c:choose>
     <div style="clear: both;"></div>
     <div class="mb-2" style="float: left; font-size: 20px;">
      <span style="font-weight: bold;">작성자 : </span>${dto.id}
     </div>
     <div style="float: right; font-size: 20px;">
      ${dto.post_date}
     </div>
     <hr style="width: 100%;">
     <div class="mb-5" style="clear: both;">
      <c:if test="${dto.filename != '-'}">
       <img id="viewContent_img" alt="" src="${path}/recipeBoard_servlet/img.do?num=${dto.num}" style="width: 50%; height: 50%;"> <br>
      </c:if>
      &nbsp;${dto.content}
     </div>
     <c:if test="${dto.re_level > 0}">
      <div>
       <a href="${path}/recipeBoard_servlet/viewUp.do?num=${dto.num}">본문 보기</a>
      </div>
     </c:if>
     <c:if test="${sessionScope.name != null && dto.notice == 0}">
      <div class="my-2" align="right">
       <button class="btn btn-dark button" type="button" id="btnReWrite" name="btnReWrite">답글</button>&nbsp;&nbsp;
      </div>
     </c:if>
    </form>
    <form method="post" id="form2" name="form2" action="${path}/recipeBoardComment_servlet/insert.do">
     <c:choose>
      <c:when test="${sessionScope.name != null}">
       <input type="hidden" id="num_" name="num_" value="${dto.num}">
       <div class="border border-1 p-3" style="width: 100%; border-radius: 20px;">
        <label for="content_" class="form-label" style="font-weight: bold;">&nbsp;댓글</label>
        <textarea rows="3" class="form-control input" name="content_" id="content_" style="resize: none;"></textarea>
        <div class="mt-2" align="right">
         <button class="btn btn-dark button" type="button" id="btnInsert" name="btnInsert">작성</button>
        </div>
       </div>
      </c:when>
     </c:choose>
    </form>
    <div id="result"></div>
   </div>
  </c:when>
  <c:otherwise>
   <div class="container" align="center">
    <div class="border border-3 p-5 mt-5" style="width: 900px; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
     <h2 class="mt-3 mb-3 h2" style="font-weight: bold;">삭제된 게시물입니다</h2>
    </div>
   </div>
  </c:otherwise>
 </c:choose>
</div>
</body>
</html>