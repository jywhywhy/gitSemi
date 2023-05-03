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
var check = false;
$(function() {
	$("#id").change(function() {
		check = false;
		$("#result").html("");
	});
	$("#btnIdCheck").click(function() {
		idCheck();
	});
	$("#id").keyup(function(event) {
		if(event.which === 13){
			$("#btnIdCheck").click();
		}
	});
	$("#btnJoin").click(function() {
		insert();
	});
	$("#birth_date").keyup(function(event) {
		if(event.which === 13){
			$("#btnJoin").click();
		}
	});
});
function insert() {
	var id = $("#id");
	var name = $("#name");
	var password = $("#password");
	var passwordCheck = $("#passwordCheck");
	var birth_date = $("#birth_date");
	var expId = /^[a-z0-9]{5,8}$/;
	var expName = /^[가-힣]+$/;
	var expPassword = /^[a-zA-Z0-9]{8,12}$/;
	var expBirth_date = /^[\d]{4}-[\d]{2}-[\d]{2}$/;
	
	if(id.val() == ""){
		alert("아이디를 입력하세요");
		id.focus();
		return;
	}
	if(!expId.test(id.val())){
		alert("아이디는 영문 소문자, 숫자를 조합해 5~8 사이로 입력하세요");
		id.focus();
		return;
	}
	if(name.val() == ""){
		alert("이름을 입력하세요");
		name.focus();
		return;
	}
	if(!expName.test(name.val())){
		alert("이름은 한글로 입력하세요");
		name.focus();
		return;
	}
	if(password.val() == ""){
		alert("비밀번호를 입력하세요");
		password.focus();
		return;
	}
	if(!expPassword.test(password.val())){
		alert("비밀번호는 영문, 숫자를 조합해 8~12 사이로 입력하세요");
		password.focus();
		return;
	}
	if(passwordCheck.val() == ""){
		alert("비밀번호를 확인하세요");
		passwordCheck.focus();
		return;
	}
	if(password.val() !== passwordCheck.val()){
		alert("비밀번호가 같지 않습니다.");
		passwordCheck.focus();
		return;
	}
	if(birth_date.val() == ""){
		alert("생년월일을 입력하세요");
		birth_date.focus();
		return;
	}
	if(!expBirth_date.test(birth_date.val())){
		alert("생년월일을 확인하세요");
		birth_date.focus();
		return;
	}
	if(check){
		document.form.submit();
		alert("회원가입이 완료되었습니다");
	}else{
		alert("중복확인을 하세요");
	}
}
function idCheck() {
	var id = $("#id");
	var expId = /^[a-z0-9]{5,8}$/;
	if(id.val() == ""){
		alert("아이디를 입력하세요");
		id.focus();
		return;
	}
	if(!expId.test(id.val())){
		alert("아이디는 영문 소문자, 숫자를 조합해 5~8 사이로 입력하세요");
		id.focus();
		return;
	}
	var param = "id="+$("#id").val();
	$.ajax({
		type: "post",
		url: "${path}/recipeMember_servlet/idCheck.do",
		data: param,
		success: function (result) {
			if(result == 0){
				$("#result").html("사용 가능한 아이디입니다");
				check = true;
			}else{
				$("#result").html("중복된 아이디입니다");
				check = false;
			}
		}
	});
}
</script>
</head>
<body>
<form method="post" id="form" name="form" action="${path}/recipeMember_servlet/insert.do">
 <div class="container" align="center">
  <div id="join_div" class="border border-3 p-3" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
   <h2 class="mt-3 mb-5" style="font-weight: bold;">회원가입</h2>
   <div id="join_row_div" class="row fs-5">
    <div class="col-4" align="left">
     <label for="id" class="form-label">아이디</label>
    </div>
    <div class="col-8">
     <div class="input-group">
      <input class="form-control input" id="id" name="id" placeholder="영문 소문자, 숫자 5~8">
      <button type="button" class="btn btn-dark button" id="btnIdCheck">중복확인</button>
     </div>
    </div>
    <span class="col-12 mb-4" id="result"></span>
    <div class="col-4" align="left">
     <label for="name" class="form-label">이름</label>
    </div>
    <div class="col-8 mb-4">
     <input class="form-control input" id="name" name="name" placeholder="한글">
    </div>
    <div class="col-4" align="left">
     <label for="password" class="form-label">비밀번호</label>
    </div>
    <div class="col-8 mb-4">
     <input type="password" class="form-control input" id="password" name="password" placeholder="영문, 숫자 8~12">
    </div>
    <div class="col-4" align="left">
     <label for="passwordCheck" class="form-label">비밀번호 확인</label>
    </div>
    <div class="col-8 mb-4">
     <input type="password" class="form-control input" id="passwordCheck" name="passwordCheck">
    </div>
    <div class="col-4" align="left">
     <label for="birth_date" class="form-label">생년월일</label>
    </div>
    <div class="col-8">
     <input type="date" class="form-control input" id="birth_date" name="birth_date">
    </div>
   </div>
   <hr class="my-5" style="width: 88%;">
   <button type="button" class="btn btn-dark fs-4 button" id="btnJoin" name="btnJoin">회원가입</button>
  </div>
 </div>
</form>
</body>
</html>