<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/adminSession_check.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnOut").click(function() {
		if(confirm("${dto.id}님의 계정을 삭제하시겠습니까?")){
			document.form1.submit();
		}
	});
	$("#btnIn").click(function() {
		if(confirm("${dto.id}님의 계정을 복구하시겠습니까?")){
			document.form1.action = "${path}/recipeMember_servlet/in.do";
			document.form1.submit();
		}
	});
	$("#btnGrant").click(function() {
		if(confirm("${dto.id}님에게 관리자권한을 부여하시겠습니까?")){
			document.form1.action = "${path}/recipeMember_servlet/grant.do";
			document.form1.submit();
		}
	});
	$("#btnRevoke").click(function() {
		if(confirm("${dto.id}님의 관리자권한을 회수하시겠습니까?")){
			document.form1.action = "${path}/recipeMember_servlet/revoke.do";
			document.form1.submit();
		}
	});
});
</script>
<style type="text/css">
label {
	font-weight: bold;
}
</style>
</head>
<body>
<form method="post" id="form1" name="form1" action="${path}/recipeMember_servlet/out.do">
 <div class="container" align="center">
  <div id="memberInfo_row_div" class="row fs-5">
   <div class="col-4" align="left">
    <label for="id" class="form-label">아이디</label>
   </div>
   <div class="col-8 mb-4">
    <input class="form-control input" id="id" name="id" value="${requestScope.dto.id}" readonly>
   </div>
   <div class="col-4" align="left">
    <label for="name" class="form-label">이름</label>
   </div>
   <div class="col-8 mb-4">
    <input class="form-control input" id="name" name="name" value="${requestScope.dto.name}" readonly>
   </div>
   <div class="col-4" align="left">
    <label for="birth_date" class="form-label">생년월일</label>
   </div>
   <div class="col-8 mb-4">
    <input type="date" class="form-control input" id="birth_date" name="birth_date" value="${requestScope.dto.birth_date}" readonly>
   </div>
   <div class="col-4" align="left">
    <label for="reg_date" class="form-label">가입일자</label>
   </div>
   <div class="col-8 mb-4">
    <input type="date" class="form-control input" id="reg_date" name="reg_date" value="${requestScope.dto.reg_date}" readonly>
   </div>
   <div class="col-4" align="left">
    <label for="point" class="form-label">보유포인트</label>
   </div>
   <div class="col-8 mb-4">
    <input class="form-control input" id="point" name="point" value="${requestScope.dto.point} P" readonly>
   </div>
   <div class="col-6" align="left">
    <a href="${path}/recipeBoard_servlet/view.do?id=${requestScope.dto.id}">작성글 목록</a>
   </div>
   <div class="col-6" align="right">
    <a href="${path}/recipeBoard_servlet/goodList.do?id=${requestScope.dto.id}">좋아요 누른 게시글</a>
   </div>
  </div>
  <hr class="my-5" style="width: 100%;">
  <c:choose>
   <c:when test="${sessionScope.admin == 'Y'}">
    <c:choose>
     <c:when test="${dto.show == 'Y' && dto.admin2 != 'Y'}">
      <button type="button" class="btn btn-dark fs-4 buttonSet" id="btnGrant" name="btnGrant" style=" margin-right: 30px;">관리자권한 부여</button>
      <button type="button" class="btn btn-dark fs-4 buttonSet" id="btnOut" name="btnOut" >추방</button>
     </c:when>
     <c:when test="${dto.show == 'Y' && dto.admin2 == 'Y'}">
      <button type="button" class="btn btn-dark fs-4 buttonSet" id="btnRevoke" name="btnRevoke" style="margin-right: 30px;">관리자권한 회수</button>
      <button type="button" class="btn btn-dark fs-4 buttonSet" id="btnOut" name="btnOut">추방</button>
     </c:when>
     <c:otherwise>
      <button type="button" class="btn btn-dark fs-4 button" id="btnIn" name="btnIn" style="width: 100%;">복구</button>
     </c:otherwise>
    </c:choose>
   </c:when>
   <c:otherwise>
    <c:if test="${dto.admin2 == 'N'}">
     <c:choose>
      <c:when test="${dto.show == 'Y'}">
       <button type="button" class="btn btn-dark fs-4 button" id="btnOut" name="btnOut" style="width: 100%;">추방</button>
      </c:when>
      <c:otherwise>
       <button type="button" class="btn btn-dark fs-4 button" id="btnIn" name="btnIn" style="width: 100%;">복구</button>
      </c:otherwise>
     </c:choose>
    </c:if>
   </c:otherwise>
  </c:choose>
 </div>
</form>
</body>
</html>