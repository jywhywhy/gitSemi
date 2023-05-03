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
	$("#btnLogin").click(function() {
		login();
	});
	$("#password").keyup(function(event) {
		if(event.which === 13){
			$("#btnLogin").click();
		}
	})
});
function login() {
	var id = $("#id");
	var password = $("#password");
	var param = "id="+id.val()+"&password="+password.val();
	if(id.val() == ""){
		alert("아이디를 입력하세요");
		id.focus();
		return;
	}
	if(password.val() == ""){
		alert("비밀번호를 입력해주세요");
		password.focus();
		return;
	}
	$.ajax({
		type: "post",
		url: "${path}/recipeMember_servlet/login.do",
		data: param,
		success: function (result) {
			if(result == 1){
				alert("환영합니다");
				location.href = document.referrer;
			}else if(result == 0){
				alert("아이디나 비밀번호를 확인하세요");
			}else{
				alert("탈퇴한 아이디입니다");
			}
		}
	});
}
</script>
</head>
<body>
<div id="login_container" class="container" align="center">
 <div id="login_div" class="border border-3 p-3" style="border-radius: 20px; background-color: rgba(255,255,255,0.9);">
  <h2 class="mt-3 mb-5" style="font-weight: bold;">로그인</h2>
  <input class="form-control fs-4 mb-4 login_input" id="id" name="id" placeholder="아이디">
  <input type="password" class="form-control fs-4 login_input" id="password" name="password" placeholder="비밀번호">
  <hr class="my-5" style="width: 85%;">
  <button type="button" class="btn btn-dark fs-3 login_button" id="btnLogin" name="btnLogin">로그인</button>
 </div>
</div>
</body>
</html>