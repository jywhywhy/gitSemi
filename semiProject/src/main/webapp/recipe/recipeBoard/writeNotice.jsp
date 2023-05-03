<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/adminSession_check.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnSave").click(function() {
		var subject = $("#subject");
		var content = $("#content");
		if(subject.val() == ""){
			alert("제목을 입력하세요");
			subject.focus();
			return;
		}
		if(content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		document.form.submit();
	});
});
</script>
</head>
<body>
<form method="post" id="form" name="form" action="${path}/recipeBoard_servlet/writeNotice.do" enctype="multipart/form-data">
 <div class="container" align="center">
  <div class="border border-3 write_div" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <h2 class="mt-3 mb-5 h2" style="font-weight: bold;">공지쓰기</h2>
   <div class="container" align="left">
    <label for="subject" class="form-label" style="font-weight: bold;">&nbsp;제목</label>
    <input class="form-control input" name="subject" id="subject">
    <label for="content" class="form-label mt-1" style="font-weight: bold;">&nbsp;내용</label>
    <textarea rows="10" class="form-control input mb-3" name="content" id="content" style="resize: none;"></textarea>
    <input class="form-control input" accept="image/*" type="file" id="file" name="file" value="">
   </div>
   <hr class="my-5" style="width: 97%;">
   <div class="container">
    <button type="button" class="btn btn-dark button fs-4" id="btnSave" name="btnSave" style="width: 100%;">저장</button>
   </div>
  </div>
 </div>
</form>
</body>
</html>