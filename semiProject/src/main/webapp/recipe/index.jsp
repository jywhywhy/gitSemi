<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$.ajax({
		type: "post",
		url: "${path}/recipeBoard_servlet/bestGood.do",
		success: function(result) {
			$("#card1").html(result);
		}
	});
	$.ajax({
		type: "post",
		url: "${path}/recipeBoard_servlet/bestRead_count.do",
		success: function(result) {
			$("#card2").html(result);
		}
	});
	$.ajax({
		type: "post",
		url: "${path}/recipeBoard_servlet/bestMember.do",
		success: function(result) {
			$("#card3").html(result);
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form method="post" id="form" name="form" action="${path}/recipeBoard_servlet/list.do">
 <div class="container" id="search_div">
  <div class="input-group">
   <input class="form-control fs-4 my-5 input" type="search" id="search" name="search" placeholder="모든 게시물 검색">
   <button class="btn btn-dark fs-4 my-5 button">검색</button>
  </div>
 </div>
</form>
<div id="card_div" class="container mt-5">
 <div class="row">
  <div class="col-lg-4 col-md-6 col-sm-12 mb-4" id="card1"></div>
  <div class="col-lg-4 col-md-6 col-sm-12 mb-4" id="card2"></div>
  <div class="col-lg-4 col-md-6 col-sm-12" id="card3"></div>
 </div>
</div>
</body>
</html>