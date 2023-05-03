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
function good(){
	if(${sessionScope.name == null}){
		if(confirm("좋아요는 로그인 후 가능합니다\n로그인 하시겠습니까?")){
			location.href="${path}/recipe/recipeMember/login.jsp";
		}
		return;
	}
	$.ajax({
		type: "post",
		url: "${path}/recipeBoard_servlet/good.do",
		data: "num=${dto.num}",
		success: function(result) {
			$(".result_good").html(result);
			$.ajax({
				type: "post",
				url: "${path}/recipeBoardGood_servlet/good.do",
				data: "num=${dto.num}",
				success: function (result) {
					$(".result").html(result);
				}
			});
		}
	});
}
function noGood(){
	$.ajax({
		type: "post",
		url: "${path}/recipeBoard_servlet/noGood.do",
		data: "num=${dto.num}",
		success: function(result) {
			$(".result_good").html(result);
			$.ajax({
				type: "post",
				url: "${path}/recipeBoardGood_servlet/good.do",
				data: "num=${dto.num}",
				success: function (result) {
					$(".result").html(result);
				}
			});
		}
	});
}
</script>
</head>
<body>
<c:choose>
 <c:when test="${count == 0}">
  <button class="btn button" type="button" onclick="good()" style="font-weight: bold;">
   <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" color="red">
    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
   </svg>
   <span class="result_good" style="font-size: 20px;">${dto.good}</span>
  </button>
 </c:when>
 <c:otherwise>
  <button class="btn button" type="button" onclick="noGood()" style="font-weight: bold;">
   <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16" color="red">
    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
   </svg>
   <span class="result_good" style="font-size: 20px;">${dto.good}</span>
  </button>
 </c:otherwise>
</c:choose>
</body>
</html>