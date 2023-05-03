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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/include/address.js"></script>
<script type="text/javascript">
$(function() {
	if(${count == 0}){
		$("#btnDefault_address").css("display", "none");
	}
});
function deleteAddress(anum) {
	if(confirm("배송지를 삭제하시겠습니까?")){
		$.ajax({
			type: "post",
			url: "${path}/recipeMemberAddress_servlet/delete.do",
			data: "anum="+anum,
			success: function() {
				location.reload();
			}
		});
	}
}
</script>
</head>
<body>
<c:forEach var="row" items="${list}">
 <c:if test="${row.show == 'Y'}">
  <div class="border border-3 p-2 mb-2" align="left" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <div class="row">
    <div class="col-6">
     <h5>${row.aname}</h5>
    </div>
    <div class="col-6" align="right">
     <c:choose>
      <c:when test="${row.default_address == 'Y'}">
       <span class="badge bg-primary">기본배송지</span>
       <input class="form-check-input" type="radio" id="address" name="address" value="${row.anum}" checked>
      </c:when>
      <c:otherwise>
       <input class="form-check-input" type="radio" id="address" name="address" value="${row.anum}">
      </c:otherwise>
     </c:choose>
    </div>
    <div class="col-8 pt-2">
     <span>${row.address1} ${row.address2} (${row.zipcode})</span>
    </div>
    <div class="col-4" align="right">
     <button type="button" class="btn btn-dark button" onclick="deleteAddress('${row.anum}')">삭제</button>
    </div>
   </div> 
  </div>
 </c:if>
</c:forEach>
</body>
</html>