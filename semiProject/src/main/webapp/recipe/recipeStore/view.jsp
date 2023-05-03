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
$(function() {
	$("#btnDelete").click(function() {
		if(confirm("상품을 삭제하시겠습니까?")){
			document.form.submit();
		}
	})
	$("#btnInsert").click(function() {
		if(${sessionScope.id == null}){
			if(confirm("로그인 후 가능합니다\n로그인 하시겠습니까?")){
				location.href="${path}/recipe/recipeMember/login.jsp";
			}
			return;
		}
		var amount = $("#amount").val();
		if(amount == "" || amount < 1){
			alert("수량을 선택하세요").
			return;
		}
		$.ajax({
			type: "post",
			url: "${path}/recipeStoreBasket_servlet/insert.do",
			data: "snum=${dto.snum}&amount="+$("#amount").val(),
			success: function() {
				alert('${dto.sname} ' + $("#amount").val() + "개를 장바구니에 담았습니다");
				if(confirm("장바구니로 이동하시겠습니까?")){
					location.href = "${path}/recipeStoreBasket_servlet/list.do";
				}
			}
		});
	});
	$("#amount").keyup(function() {
		money();
	});
	$("#amount").change(function() {
		money();
	});
});
function money() {
	var amount = $("#amount").val();
	if(amount > 10){
		alert("최대 10개까지 선택 가능합니다");
		$("#amount").val(10);
		return;
	}
	var money = ${dto.price} * $("#amount").val();
	$("#money").text(money);
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<form method="post" id="form" name="form" action="${path}/recipeStore_servlet/delete.do">
 <input type="hidden" id="snum" name="snum" value="${dto.snum}">
 <div class="container" align="center" style="word-break: break-all;">
  <div id="store_view_div" class="border border-3 p-4 mt-5" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <table style="width: 100%;">
    <tr>
     <td rowspan="3"><img id="store_img" alt="" src="${path}/recipeStore_servlet/img.do?snum=${dto.snum}"></td>
    </tr>
    <tr>
     <td id="td1" align="center"><h2>${dto.sname}</h2></td>
    </tr>
    <tr align="right">
     <td id="td2">
      <span class="fs-5">가격 : <span id="money">${dto.price}</span> P</span>
      <div class="input-group" style="width: 130px;">
      <input class="form-control input" type="number" id="amount" name="amount" value="1" min="1" max="10">
      <button class="btn btn-dark button" type="button" id="btnInsert" name="btnInsert">담기</button>
     </div>
     </td>
    </tr>
   </table>
   <c:if test="${sessionScope.admin != null || sessionScope.admin2 != null}">
    <div class="mt-2" align="right">
     <button class="btn btn-dark button" type="button" id="btnDelete" name="btnDelete">상품삭제</button>
    </div>
   </c:if>
  </div>
 </div>
</form>
</body>
</html>