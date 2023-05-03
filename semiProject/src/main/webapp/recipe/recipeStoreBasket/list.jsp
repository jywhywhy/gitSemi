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
$(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").prop("checked")){
			$(".check").prop("checked", true);
		}else{
			$(".check").prop("checked", false);
		}
	});
	$("#btnDelete").click(function() {
		var count = $("input:checkbox[name=check]:checked").length;
		if(count == 0){
			alert("선택한 상품이 없습니다");
			return;
		}
		if(confirm(count+"개의 상품을 삭제하시겠습니까?")){
			document.form.submit();
		}
	});
	$("#btnBuy").click(function() {
		var count = $("input:checkbox[name=check]:checked").length;
		if(count == 0){
			alert("선택한 상품이 없습니다");
			return;
		}
		document.form.action = "${path}/recipeStoreBasket_servlet/buy.do";
		document.form.submit();
	});
});
function money(price, bnum) {
	var amount = $("#amount_"+bnum).val();
	if(amount == "" || amount < 1){
		return;
	}else if(amount > 10){
		alert("최대 10개까지 선택 가능합니다");
		$("#amount_"+bnum).val(10);
		return;
	}
	var money = price * $("#amount_"+bnum).val();
	$("#money_"+bnum).text(money);
	$.ajax({
		type: "post",
		url: "${path}/recipeStoreBasket_servlet/update.do",
		data: "bnum="+bnum+"&amount="+$("#amount_"+bnum).val(),
	});
}
</script>
</head>
<body style="word-break: break-all;">
<%@ include file="../../include/menu.jsp" %>
<form id="form" name="form" method="post" action="${path}/recipeStoreBasket_servlet/delete.do">
 <div class="container" align="center">
  <div id="basket_div" class="border border-3 mt-5" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <c:choose>
    <c:when test="${count != 0}">
     <h2 class="mt-3 mb-5 h2" style="font-weight: bold;">장바구니</h2>
     <c:forEach var="row" items="${list}">
      <c:if test="${row.show == 'Y'}">
       <div class="border border-3 p-4 mb-2" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
        <table style="width: 100%;">
         <tr>
          <td rowspan="4"><img alt="" src="${path}/recipeStore_servlet/img.do?snum=${row.snum}" style="width: 100px; height: 100px;"></td>
         </tr>
         <tr>
          <td id="basket_td1" colspan="4"><h3>${row.sname}</h3></td>
         </tr>
         <tr>
          <td id="basket_td2" align="center" colspan="3"><span class="amount_span">수량 : </span><input type="number" id="amount_${row.bnum}" name="amount_${row.bnum}" min="1" max="10" class="form-control" value="${row.amount}" style="width: 80px; display: inline;" onchange="money('${row.price}', '${row.bnum}')" onkeyup="money('${row.price}', '${row.bnum}')"></td>
          <td style="padding-bottom: 40px;" rowspan="2" align="right"><input type="checkbox" class="form-check-input check" name="check" value="${row.bnum}"></td>
         </tr>
         <tr>
          <td id="basket_td3" align="center" colspan="3"><span class="amount_span">가격 : </span><span id="money_${row.bnum}">${row.money}</span> P</td>
         </tr>
        </table>
       </div>
      </c:if>
     </c:forEach>
     <div class="container" align="right" style="padding-right: 38px;">
      전체 <input class="form-check-input" type="checkbox" id="checkAll">
     </div>
     <div class="container mt-3" align="right">
      <button type="button" class="btn btn-dark fs-5 button" id="btnBuy">구매</button>
      <button type="button" class="btn btn-dark fs-5 button" id="btnDelete">삭제</button>
     </div>
    </c:when>
    <c:otherwise>
     <h2 class="mt-3 mb-3 h2" style="font-weight: bold;">장바구니가 비었습니다</h2>
    </c:otherwise>
   </c:choose>
  </div>
 </div>
</form>
</body>
</html>