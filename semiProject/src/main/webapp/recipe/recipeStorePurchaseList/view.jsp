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
<%@ include file="../../include/menu.jsp" %>
<div class="container" align="center">
 <div id="purchaseList_view_div" class="border border-3 mt-5" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
  <c:forEach var="row" items="${list}">
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
   <table style="width: 100%;">
    <tr>
     <td align="left" style="width: 60%;">배송지 : ${address}</td>
     <td align="right" style="width: 40%;">총금액 : ${moneyAll} P</td>
    </tr>
   </table>
 </div>
</div>
</body>
</html>