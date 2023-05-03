<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<%@ include file="../include/header.jsp" %>

</head>
<body>

<div class="container mt-5">
 <nav>
  <ul class="pagination justify-content-center">
   <c:choose>
    <c:when test="${page.curPage > 1}">
     <li class="page-item"><a class="page-link" href="#" onclick="list('1')">&lt;&lt;</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item disabled"><a class="page-link" href="#">&lt;&lt;</a></li>
    </c:otherwise>
   </c:choose>
   <c:choose>
    <c:when test="${page.curBlock > 1}">
     <li class="page-item"><a class="page-link" href="#" onclick="list('${page.prevPage}')">&lt;</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
    </c:otherwise>
   </c:choose>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <li class="page-item active"><a class="page-link" href="#">${num}</a></li>
     </c:when>
     <c:otherwise>
      <li class="page-item"><a class="page-link" href="#" onclick="list('${num}')">${num}</a></li>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:choose>
    <c:when test="${page.curBlock < page.totBlock}">
     <li class="page-item"><a class="page-link" href="#" onclick="list('${page.nextPage}')">&gt;</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
    </c:otherwise>
   </c:choose>
   <c:choose>
    <c:when test="${page.curPage < page.totPage}">
     <li class="page-item"><a class="page-link" href="#" onclick="list('${page.totPage}')">&gt;&gt;</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item disabled"><a class="page-link" href="#">&gt;&gt;</a></li>
    </c:otherwise>
   </c:choose>
  </ul>
 </nav>
</div>

</body>
</html>