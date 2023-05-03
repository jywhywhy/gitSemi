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
	default_address();
	$("#btnDefault_address").click(function() {
		updateDefault_address();
	});
	$("#btnSave").click(function() {
		write();
	});
	$("#btnNewAddress").click(function() {
		$("#newAddress_div").show();
		$("#btnNewAddress").css("display", "none");
	});
	$("#btnBuy").click(function() {
		var p = ${point - moneyAll};
		if(p < 0){
			alert("포인트가 부족합니다");
			return;
		}
		if(${default_address == null}){
			alert("기본배송지를 설정하세요");
			return;
		}
		if(confirm("현재 포인트 ${point}\n구매 후 포인트 "+p+"\n정말로 구매하시겠습니까?")){
			document.form.submit();
		}
	});
});
function addressList() {
	$.ajax({
		type: "post",
		url: "${path}/recipeMemberAddress_servlet/addressList.do",
		success: function(result) {
			$("#address_div").html(result);
			$("#btnDefault_address").show();
			$("#btnNewAddress").show();
			$("#addressList").css("display", "none");
			$("#closeList").show();
			$("#address_div").show();
		}
	});
}
function write() {
	var aname = $("#aname");
	var zipcode = $("#zipcode").val();
	var address2 = $("#address2");
	if(aname.val() == ""){
		alert("배송지명을 입력하세요");
		$("#aname").focus();
		return;
	}
	if(zipcode == ""){
		alert("주소를 입력하세요");
		return;
	}
	if(address2.val() == ""){
		alert("상세주소를 입력하세요");
		address2.focus();
		return;
		}
	var param = "aname="+$("#aname").val()+"&zipcode="+$("#zipcode").val()+"&address1="+$("#address1").val()+"&address2="+$("#address2").val();
	$.ajax({
		type: "post",
		url: "${path}/recipeMemberAddress_servlet/write.do",
		data: param,
		success: function(result) {
			if(result == "full"){
				alert("배송지는 3개까지 등록 가능합니다");
			}
			$("#newAddress_div").css("display", "none");
			$("#aname").val("");
			$("#zipcode").val("");
			$("#address1").val("");
			$("#address2").val("");
			$("#btnDefault_address").show();
			addressList();
		}
	});
}
function updateDefault_address() {
	$.ajax({
		type: "post",
		url: "${path}/recipeMemberAddress_servlet/update.do",
		data: "anum="+$("input:radio[name='address']:checked").val(),
		success: function() {
			location.reload();
		}
	});
}
function default_address() {
	$.ajax({
		type: "post",
		url: "${path}/recipeMemberAddress_servlet/default_address.do",
		success: function(result) {
			$("#default_address_div").html(result);
		}
	});
}
function closeList() {
	$("#address_div").css("display", "none");
	$("#closeList").css("display", "none");
	$("#addressList").show();
	$("#btnDefault_address").css("display", "none");
	$("#btnNewAddress").css("display", "none");
	$("#newAddress_div").css("display", "none");
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<form id="form" name="form" method="post" action="${path}/recipeStorePurchaseList_servlet/write.do">
 <input type="hidden" id="point" name="point" value="${point - moneyAll}">
 <div class="container" align="center">
  <div id="buy_div" class="border border-3 mt-5" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <c:forEach var="row" items="${list}">
    <input type="hidden" id="bnum" name="bnum" value="${row.bnum}">
    <div class="border border-3 p-2 mb-2" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
     <table style="width: 100%;">
      <tr>
       <td rowspan="3" style="width: 20%;"><img alt="" src="${path}/recipeStore_servlet/img.do?snum=${row.snum}" style="width: 50px; height: 50px;"></td>
      </tr>
      <tr>
       <td align="left" colspan="2"><h3 class="pt-2">${row.sname}</h3></td>
      </tr>
      <tr>
       <td align="left">수량 : ${row.amount}</td>
       <td align="left">가격 : ${row.money} P</td>
      </tr>
     </table>
    </div>
   </c:forEach>
   <div class="border border-3 p-4 mt-4" align="left" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <div id="default_address_div"></div>
    <table style="width: 100%;">
     <tr>
      <td>
       <a href="#" id="closeList"onclick="closeList()" style="display: none;">배송지 목록 닫기</a>
       <a href="#" id="addressList" onclick="addressList()">배송지 목록</a>
      </td>
      <td align="right">
       <button type="button" class="btn btn-dark button" id="btnDefault_address" style="display: none;">기본배송지 변경</button>
      </td>
     </tr>
    </table>
    <div id="address_div" class="mt-2"></div>
    <div id="newAddress_div" class="border border-3 px-3 py-4 mb-2" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9); display: none;">
     <div class="container">
      <input class="form-control input fs-5 mb-2" id="aname" name="aname" placeholder="배송지명">
      <div class="input-group mb-2">
       <input class="form-control input fs-5" id="zipcode" name="zipcode" placeholder="우편변호" readonly>
       <button type="button" class="btn btn-dark button fs-5" onclick="findAddress()">찾기</button>
      </div>
      <input class="form-control input fs-5 mb-2" id="address1" name="address1" placeholder="주소" readonly>
      <input class="form-control input fs-5 mb-2" id="address2" name="address2" placeholder="상세주소">
      <button type="button" class="btn btn-dark fs-5 button" id="btnSave" name="btnSave" style="width: 100%;">등록</button>
     </div>
    </div>
    <div class="container" align="right">
     <button type="button" class="btn btn-dark button" id="btnNewAddress" style="display: none;">배송지 추가</button>
    </div>
   </div>
   <div class="border border-3 mt-4 p-3" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <table style="width: 100%;">
     <tr>
      <td align="left">필요 포인트 : ${moneyAll} P
     </tr>
     <tr>
      <td align="left">보유 포인트 : ${point} P</td>
      <td align="right"><button type="button" class="btn btn-dark button" id="btnBuy">구매</button></td>
     </tr>
    </table>
   </div>
  </div>
 </div>
</form>
</body>
</html>