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
	$("#btnUpdatePassword").click(function() {
		updatePassword();
	});
	$("#btnUpdate").click(function() {
		var name = $("#name");
		var birth_date = $("#birth_date");
		var expName = /^[가-힣]+$/;
		var expBirth_date = /^[\d]{4}-[\d]{2}-[\d]{2}$/;
		if(name.val() == ""){
			alert("이름을 입력해주세요");
			name.focus();
			return;
		}
		if(!expName.test(name.val())){
			alert("이름은 한글로 입력해주세요");
			name.focus();
			return;
		}
		if(birth_date.val() == ""){
			alert("생년월일을 입력해주세요");
			birth_date.focus();
			return;
		}
		if(!expBirth_date.test(birth_date.val())){
			alert("생년월일을 확인해주세요");
			birth_date.focus();
			return;
		}
		document.form1.submit();
		alert("수정이 완료되었습니다");
	});
	$("#btnDelete").click(function() {
		if(confirm("정말로 탈퇴하시겠습니까?")){
			document.form1.action = "${path}/recipeMember_servlet/delete.do";
			document.form1.submit();
		}
	});
	$('#updatePasswordModal').modal({ 
		keyboard: false,
		backdrop: 'static' 
	});
});
function updatePassword() {
	var password = $("#updatePassword");
	var passwordCheck = $("#updatePasswordCheck");
	var expPassword = /^[a-zA-Z0-9]{8,12}$/;
	if(password.val() == ""){
		alert("변경할 비밀번호를 입력해주세요");
		password.focus();
		return;
	}
	if(!expPassword.test(password.val())){
		alert("비밀번호는 영문, 숫자를 조합해 8~12 사이로 입력하세요");
		password.focus();
		return;
	}
	if(passwordCheck.val() == ""){
		alert("변경할 비밀번호를 확인해주세요");
		passwordCheck.focus();
		return;
	}
	if(password.val() !== passwordCheck.val()){
		alert("비밀번호가 같지 않습니다");
		passwordCheck.focus();
		return;
	}
	document.form2.submit();
	alert("비밀번호가 변경되었습니다");
}
</script>
</head>
<body>
<form method="post" id="form1" name="form1" action="${path}/recipeMember_servlet/update.do">
 <div class="container" align="center" style="padding-top: 100px;">
  <div id="memberView_div" class="border border-3 p-3" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <h2 class="mt-3 mb-5" style="font-weight: bold;">내정보</h2>
   <div id="memberView_row_div" class="row fs-5">
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
     <input class="form-control input" id="name" name="name" value="${requestScope.dto.name}">
    </div>
    <div class="col-4" align="left">
     <label for="password" class="form-label">비밀번호</label>
    </div>
    <div class="col-8 mb-4">
     <div class="input-group">
      <input type="password" class="form-control input" id="password" name="password" value="password" readonly>
      <button type="button" class="btn btn-dark button" data-bs-toggle="modal" data-bs-target="#updatePasswordModal">변경</button>
     </div>
    </div>
    <div class="col-4" align="left">
     <label for="birth_date" class="form-label">생년월일</label>
    </div>
    <div class="col-8 mb-4">
     <input type="date" class="form-control input" id="birth_date" name="birth_date" value="${requestScope.dto.birth_date}">
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
     <a href="${path}/recipeBoard_servlet/view.do?id=${requestScope.dto.id}">내글 목록</a>
    </div>
    <div class="col-6" align="right">
     <a href="${path}/recipeBoard_servlet/goodList.do?id=${requestScope.dto.id}">좋아요 누른 게시글</a>
    </div>
   </div>
   <hr class="my-5" style="width: 88%;">
   <button type="button" class="btn btn-dark fs-4 button" id="btnUpdate" name="btnUpdate" style="width: 40%; margin-right: 35px;">수정</button>
   <button type="button" class="btn btn-dark fs-4 button" id="btnDelete" name="btnDelete" style="width: 40%;">탈퇴</button>
  </div>
 </div>
</form>
<form method="post" name="form2" action="${path}/recipeMember_servlet/passwordUpdate.do">
 <div class="modal fade" id="updatePasswordModal" tabindex="-1">
  <div class="modal-dialog">
   <div class="modal-content">
    <div class="modal-header">
     <h1 class="modal-title fs-3" style="font-weight: bold;">비밀번호 변경</h1>
     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body">
     <div class="container my-3">
      <label for="updatePassword" class="form-label"> &nbsp;변경할 비밀번호</label>
      <input type="password" class="form-control mb-3 input" id="updatePassword" name="updatePassword">
      <label for="updatePasswordCheck" class="form-label"> &nbsp;변경할 비밀번호 확인</label>
      <input type="password" class="form-control input" id="updatePasswordCheck" name="updatePasswordCheck">
     </div>
    </div>
    <div class="modal-footer justify-content-center">
     <button type="button" class="btn btn-dark fs-5 button" id="btnUpdatePassword" style="width: 440px;">변경</button>
    </div>
   </div>
  </div>
 </div>
</form>
</body>
</html>