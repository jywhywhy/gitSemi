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
function list(page) {
	location.href="${path}/recipeStore_servlet/list.do?curPage="+page;
}
</script>
<style type="text/css">
.storeImg {
	opacity: 0.8;
}
.card:hover {
	.storeImg {
		opacity: 1.0;
	}
}
</style>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<c:choose>
 <c:when test="${count != 0}">
  <div class="container mt-5">
   <div id="store_card_div" class="row">
    <c:forEach var="row" items="${list}">
     <div class="col-lg-3 col-md-6 col-sm-12">
      <div class="card mb-5" style="width: 16rem;" onclick="location.href='${path}/recipeStore_servlet/view.do?snum=${row.snum}'">
       <img src="${path}/recipeStore_servlet/img.do?snum=${row.snum}" class="card-img-top storeImg" alt="..." style="height: 200px;">
       <div class="card-body">
        <h5 class="card-title" style="font-weight: bold;">${row.sname}</h5>
        <p class="card-text d-inline-block text-truncate" style="width: 200px;">${row.description}</p>
        <P class="card-text">가격 : ${row.price} P</P>
       </div>
      </div>
     </div>
    </c:forEach>
   </div>
  </div>
 </c:when>
 <c:otherwise>
  <div class="container" align="center">
   <div class="border border-3 p-5 mt-5" style="width: 900px; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <h2 class="mt-3 mb-3 h2" style="font-weight: bold;">상품이 없습니다</h2>
   </div>
  </div>
 </c:otherwise>
</c:choose>
<div class="container" align="right">
 <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
  <button type="button" class="btn btn-dark fs-5 button" id="btnWrite" name="btnWrite" onclick="location.href='${path}/recipe/recipeStore/write.jsp'">상품등록</button>
 </c:if>
</div>
<c:if test="${count != 0}">
 <%@ include file="../../include/page.jsp" %>
</c:if>
</body>
</html>