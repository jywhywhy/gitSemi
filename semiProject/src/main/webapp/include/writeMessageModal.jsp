<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(function() {
	$("#writeMessageModal").modal({ 
		keyboard: false,
		backdrop: 'static' 
	});
	$("#btnSave").click(function() {
		var content = $("#content");
		if(content.val() == ""){
			content.focus();
			alert("내용을 입력하세요");
			return;
		}
		$("#receiver").attr("disabled", false);
		document.messageForm.submit();
	});
});
function message(id) {
	if(${sessionScope.id == null}){
		if(confirm("쪽지는 로그인 후 보낼 수 있습니다\n로그인 하시겠습니까?")){
			location.href="${path}/recipe/recipeMember/login.jsp";
		}
	}else{
		$("#writeMessageModal").modal("show");
		$("#receiver").val(id);
	}
}
</script>

</head>
<body>

<form method="post" name="messageForm" action="${path}/recipeMessage_servlet/write.do">
 <div class="modal fade" id="writeMessageModal" tabindex="-1">
  <div class="modal-dialog">
   <div class="modal-content">
    <div class="modal-header">
     <h1 class="modal-title fs-3" style="font-weight: bold;">쪽지 보내기</h1>
     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body">
     <div class="container my-3">
     <div class="row">
      <div class="col-3 pt-1" style="font-weight: bold;">
       받는 사람 
      </div>
      <div class="col-9">
      <input class="form-control input" id="receiver" name="receiver" value="" disabled>
      </div>
     </div>
      <textarea rows="5" class="form-control input mt-3" name="content" id="content" style="resize: none;"></textarea>
     </div>
    </div>
    <div class="modal-footer justify-content-center">
     <button type="button" class="btn btn-dark fs-5 button" id="btnSave" style="width: 440px;">전송</button>
    </div>
   </div>
  </div>
 </div>
</form>

</body>
</html>