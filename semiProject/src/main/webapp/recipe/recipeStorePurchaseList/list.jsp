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
<script type="text/javascript">
function view(order_num) {
	$("#form_"+order_num).submit();
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<div class="container" align="center">
 <div id="purchaseList_div" class="border border-3 mt-5" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
  <c:choose>
   <c:when test="${count != 0}">
    <h2 class="mt-3 mb-5 h2" style="font-weight: bold;">구매내역</h2>
    <c:forEach var="row" items="${list}">
     <form method="post" id="form_${row.order_num}" name="form_${row.order_num}" action="${path}/recipeStorePurchaseList_servlet/view.do">
      <input type="hidden" id="order_num" name="order_num" value="${row.order_num}">
      <div class="border border-3 p-4 mb-2" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9); cursor: pointer;" onclick="view('${row.order_num}')">
       <table style="width: 100%;">
        <tr>
         <td style="width: 10%;" rowspan="2">${row.order_num}</td>
         <td align="center">구매일 : <fmt:formatDate value="${row.order_date}" pattern="yyyy-MM-dd HH:mm"/></td>
        </tr>
        <tr>
         <td align="center">${row.address1} ${row.address2} (${row.zipcode})</td>
        </tr>
       </table>
      </div>
     </form>
    </c:forEach>
   </c:when>
   <c:otherwise>
    <h2 class="mt-3 mb-3 h2" style="font-weight: bold;">구매내역이 없습니다</h2>
   </c:otherwise>
  </c:choose>
 </div>
</div>
</body>
</html>