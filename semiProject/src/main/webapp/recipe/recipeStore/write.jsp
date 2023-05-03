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
		var sname = $("#sname");
		var price = $("#price");
		var description = $("#description");
		var file = $("#file");
		
		if(sname.val() == ""){
			alert("상품명을 입력하세요");
			sname.focus();
			return;
		}
		if(price.val() == ""){
			alert("상품가격을 입력하세요");
			price.focus();
			return;
		}
		if(description.val() == ""){
			alert("한줄설명을 입력하세요");
			description.focus();
			return;
		}
		if(file.val() == ""){
			alert("사진을 등록하세요");
			file.focus();
			return;
		}
		document.form.submit();
	});
});
</script>
</head>
<body>
<form method="post" action="${path}/recipeStore_servlet/write.do" id="form" name="form" enctype="multipart/form-data">
 <div class="container" align="center">
  <div class="border border-3 p-4 write_div" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <h2 class="mt-3 mb-5 h2" style="font-weight: bold;">상품등록</h2>
   <div class="container" align="left">
    <label for="sname" class="form-label" style="font-weight: bold;">&nbsp;상품명</label>
    <input class="form-control input" name="sname" id="sname">
    <label for="price" class="form-label mt-1" style="font-weight: bold;">&nbsp;상품가격</label>
    <input class="form-control input" name="price" id="price">
    <label for="description" class="form-label mt-1" style="font-weight: bold;">&nbsp;상품설명</label>
    <textarea rows="5" class="form-control input mb-3" name="description" id="description" style="resize: none;"></textarea>
    <input class="form-control input" accept="image/*" type="file" id="file" name="file">
   </div>
   <hr class="my-5" style="width: 97%;">
   <div class="container">
    <button type="button" class="btn btn-dark button fs-4" id="btnSave" name="btnSave" style="width: 100%;">등록</button>
   </div>
  </div>
 </div>
</form>
</body>
</html>