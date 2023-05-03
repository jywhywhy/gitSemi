<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/session_check.jsp" %>
</head>
<body>
<div class="border border-3 p-2 mb-2" align="left" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
 <c:choose>
  <c:when test="${dto != null}">
   <div class="row">
    <div class="col-8">
     <h5>${dto.aname}</h5>
    </div>
    <div class="col-4" align="right">
     <span class="badge bg-primary">기본배송지</span>
    </div>
    <div class="col-12">
     <span>${dto.address1} ${dto.address2} (${dto.zipcode})</span>
    </div>
   </div> 
  </c:when>
  <c:otherwise>
   <h5 class="pt-1" style="font-weight: bold;">기본배송지가 없습니다</h5>
  </c:otherwise>
 </c:choose>
</div>
</body>
</html>