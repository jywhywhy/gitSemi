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
	if(${sessionScope.id != null}){
		$.ajax({
			type: "post",
			url: "${path}/recipeMessage_servlet/newMessage.do",
			success: function(result) {
				if(result == 1){
					var icon = " <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' color='red' style='padding-bottom: 5px;' fill='currentColor' class='bi bi-circle-fill' viewBox='0 0 16 16'><circle cx='8' cy='8' r='8'/></svg>";
					$(".message_span").html(icon);
				}
			}
		});
	}
});
</script>
</head>
<body>
<div class="container mb-5 pt-5">
 <h1 id="title" class="text-center" style="font-style: italic;"><a href="${path}/recipe/index.jsp" style="text-decoration: none;">Yourecipe</a></h1>
</div>
<nav class="nav justify-content-end">
 <a class="nav-link text-dark fs-4 a" href="${path}/recipeStore_servlet/list.do">포인트상점</a>
 <c:choose>
  <c:when test="${sessionScope.name == null}">
   <a class="nav-link text-dark fs-4 a" href="${path}/recipe/recipeMember/login.jsp">로그인</a>
   <a class="nav-link text-dark fs-4 a" href="${path}/recipe/recipeMember/join.jsp">회원가입</a>
  </c:when>
  <c:when test="${sessionScope.name != null}">
   <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
    <a class="nav-link text-dark fs-4 a" href="${path}/recipeMember_servlet/memberList.do">회원관리</a>
   </c:if>
   <div class="dropdown">
    <a class="nav-link text-dark fs-4 a" data-bs-toggle="dropdown" href="#">${sessionScope.name}<span class="message_span"></span></a>
    <div class="dropdown-menu">
     <a class="dropdown-item" href="${path}/recipeMember_servlet/view.do">내정보</a>
     <a class="dropdown-item" href="${path}/recipeMessage_servlet/list.do">쪽지함<span class="message_span"></span></a>
     <a class="dropdown-item" href="${path}/recipeStoreBasket_servlet/list.do">장바구니</a>
     <a class="dropdown-item" href="${path}/recipeStorePurchaseList_servlet/list.do">구매내역</a>
    </div>
   </div>
   <a class="nav-link text-dark fs-4 a" href="${path}/recipeMember_servlet/logout.do">로그아웃</a>
  </c:when>
 </c:choose>
</nav>
</body>
</html>