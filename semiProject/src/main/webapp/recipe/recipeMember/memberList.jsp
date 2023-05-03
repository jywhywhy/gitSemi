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
	$.ajax({
		type: "post",
		url: "${path}/recipeMember_servlet/memberInfo.do",
		data: "id="+$('#result a:first').text(),
		success: function(result) {
			$("#result2").html(result);
		}
	});
	$("#search").keyup(function(event) {
		if(event.which === 13){
			$("#btnSearch").click();
		}
	})
	$("#btnSearch").click(function() {
		$.ajax({
			type: "post",
			url: "${path}/recipeMember_servlet/search.do",
			data: "search="+$("#search").val(),
			success: function(result) {
				$("#result").html(result);
			}
		});
	});
});
function memberInfo(id) {
	$.ajax({
		type: "post",
		url: "${path}/recipeMember_servlet/memberInfo.do",
		data: "id="+id,
		success: function(result) {
			$("#result2").html(result);
			location.href="#memberInfo_div";
		}
	});
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<div class="container mt-5" align="center">
 <div class="row">
  <div class="col-lg-6 col-md-6 col-sm-12">
   <div id="memberList_div"class="border border-3 p-3 memberList_div" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <h2 class="mt-3 mb-5" style="font-weight: bold;">회원목록</h2>
    <div class="container">
     <div id="memberSearch_div" class="input-group">
      <input class="form-control input" type="search" id="search" name="search">
      <button class="btn btn-dark button" type="button" id="btnSearch">검색</button>
     </div>
    </div>
    <div class="mt-4" id="result" style="height: 350px; overflow: auto; width: 300px;">
     <c:forEach var="row" items="${list}">
      <div class="mb-2 fs-5">
       <a href="#" onclick="memberInfo('${row.id}')">${row.id}</a>
      </div>
     </c:forEach>
    </div>
   </div>
  </div>
  <div class="col-lg-6 col-md col-sm-12">
   <div id="memberInfo_div" class="border border-3 p-3 memberList_div" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <h2 class="mt-3 mb-5" style="font-weight: bold;">회원정보</h2>
    <div id="result2"></div>
   </div>
  </div>
 </div>
</div>
</body>
</html>