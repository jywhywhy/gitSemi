<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/include/jquery-3.6.3.min.js"></script>
<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/css/bootstrap.css">
<script src="${path}/include/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${path}/include/css1.css" />
<style type="text/css">
@media all and (min-width:1024px) {
  #search_div{width: 800px;}
  .table{width: 100%;}
  .t1{width: 7%;}
  .t2{width: 50%;}
  .t3{width: 10%;}
  .t4{width: 10%;}
  .t5{width: 10%;}
  .t6{width: 10%;}
  #login_div{width: 39%; margin-top: 250px;}
  .login_input, .login_button{width: 85%; border-radius: 10px;}
  #join_div{width: 46%; margin-top: 200px;}
  #join_row_div{width: 90%;}
  #btnJoin{width: 88%;}
  #memberView_div{width: 46%;}
  #memberView_row_div{width: 90%;}
  .tm1{width: 5%;}
  .tm2{width: 10%;}
  .tm3{width: 65%;}
  .tm4{width: 20%;}
  #view_h2, #view_table{margin-left: 100px;}
  #store_view_div{width: 62%;}
  #store_img{width: 300px; height: 300px;}
  #basket_div{width: 70%; padding: 48px;}
  .write_div{width: 77%; padding: 48px; margin-top: 100px;}
  .buttonSet{width: 45%; border-radius: 10px;}
  #memberSearch_div{width: 60%;}
  .memberList_div {width: 100%; height: 100%;}
  #td1{padding-bottom: 90px;}
  #td2{padding-top: 90px;}
  #basket_td1{padding-left: 20px;}
  #buy_div{width: 90%; padding: 48px;}
  #purchaseList_div{width: 80%; padding: 48px;}
  #memberInfo_row_div{width: 98%;}
  #writeMessageModal{margin-top: 100px;}
  #answerMessageModal{margin-top: 100px;}
  #title{font-size: 5em;}
  #purchaseList_view_div{width: 70%; padding: 48px;}
  #updatePasswordModal{margin-top: 250px;}
} 
@media all and (min-width:768px) and (max-width:1023px) {
  #search_div{width: 70%;}
  .table{width: 100%;}
  .t1{width: 7%;}
  .t2{width: 40%;}
  .t3{width: 10%;}
  .t4{width: 20%;}
  .t5{width: 10%;}
  .t6{width: 10%;}
  #login_div{width: 70%; margin-top: 0px;}
  .login_input, .login_button{width: 90%; border-radius: 10px;}
  #join_div{width: 85%; margin-top: 0px;}
  #join_row_div{width: 90%;}
  #btnJoin{width: 86%;}
  #memberView_div{width: 85%;}
  #memberView_row_div{width: 90%;}
  .tm1{width: 5%;}
  .tm2{width: 15%;}
  .tm3{width: 50%;}
  .tm4{width: 30%;}
  #store_card_div{padding-left: 60px;}
  #view_h2, #view_table{margin-left: 80px;}
  #store_view_div{width: 90%;}
  #store_img{width: 200px; height: 200px;}
  #basket_div{width: 80%; padding: 48px;}
  .write_div{width: 90%; padding: 48px; margin-top: 0px;}
  .buttonSet{width: 100%; border-radius: 10px;}
  #btnGrant, #btnRevoke{margin-bottom: 10px;}
  #memberSearch_div{width: 100%;}
  .memberList_div {width: 100%; height: 100%;}
  #td1{padding-bottom: 40px;}
  #td2{padding-top: 40px;}
  #basket_td1{padding-left: 30px;}
  #buy_div{width: 80%; padding: 48px;}
  #purchaseList_div{width: 80%; padding: 48px;}
  #memberInfo_row_div{width: 100%;}
  #writeMessageModal{margin-top: 0px;}
  #answerMessageModal{margin-top: 0px;}
  #title{font-size: 5em;}
  #purchaseList_view_div{width: 80%; padding: 48px;}
  #updatePasswordModal{margin-top: 0px;}
} 
@media all and (max-width:767px) {
  #search_div{width: 80%;}
  .table{width: 100%;}
  .t1{display: none;}
  .t2{width: 55%;}
  .t3{width: 20%;}
  .t4{display: none;}
  .t5{display: none;}
  .t6{width: 20%;}
  #card_div{margin-left: 0px; padding-left: 40px;}
  #login_div{width: 100%; margin-top: 50px;}
  .login_input, .login_button{width: 90%; border-radius: 10px;}
  #join_div{width: 100%; margin-top: 50px;}
  #join_row_div{width: 100%;}
  #btnJoin{width: 90%;}
  #memberView_div{width: 100%;}
  #memberView_row_div{width: 100%;}
  .tm1{width: 5%;}
  .tm2{width: 25%;}
  .tm3{width: 40%;}
  .tm4{width: 30%;}
  #store_card_div{padding-left: 60px;}
  #view_h2, #view_table{margin-left: 50px;}
  #store_view_div{width: 100%;}
  #store_img{width: 100px; height: 100px;}
  #basket_div{width: 100%; padding: 8px;}
  .list_a_div{padding-left: 15px;}
  .write_div{width: 100%; padding: 8px; margin-top: 20px;}
  .buttonSet{width: 100%; border-radius: 10px;}
  #btnGrant, #btnRevoke{margin-bottom: 10px;}
  .memberList_div {width: 100%; height: 100%;}
  #memberSearch_div{width: 100%;}
  #basket_td1{padding-left: 70px;}
  .amount_span{display: none;}
  #basket_td2{padding-left: 60px;}
  #basket_td3{padding-left: 60px;}
  #buy_div{width: 100%; padding: 8px;}
  #purchaseList_div{padding: 8px;}
  #memberInfo_row_div{width: 100%;}
  #writeMessageModal{margin-top: 50px;}
  #answerMessageModal{margin-top: 50px;}
  #title{font-size: 4em;}
  #purchaseList_view_div{width: 100%; padding: 8px;}
  #updatePasswordModal{margin-top: 50px;}
}
</style>