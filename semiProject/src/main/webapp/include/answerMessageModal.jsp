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
	$("#answerMessageModal").modal({ 
		keyboard: false,
		backdrop: 'static' 
	});
	$("#btnAnswer").click(function() {
		$("#answerContent").attr("disabled", false);
		$("#btnAnswer").css("display", "none");
		$("#btnWrite").show();
	});
	$("#btnWrite").click(function() {
		var content = $("#answerContent");
		if(content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		$("#sender").attr("disabled", false);
		document.answerMessageform.submit();
	});
	
	$("#btnClose").click(function() {
		location.reload();
		$("#answerContent").attr("disabled", true);
		$("#btnSave").css("display", "none");
		$("#btnAnswer").show();
	});
});
function answer(mnum, sender, content) {
	$.ajax({
		type: "post",
		url: "${path}/recipeMessage_servlet/read.do",
		data: "mnum="+mnum
	});
	$("#answerMessageModal").modal("show");
	$("#sender").val(sender);
	$("#answerContent").html(content);
}
</script>

</head>
<body>

<form method="post" name="answerMessageform" action="${path}/recipeMessage_servlet/answer.do">
 <div class="modal fade" id="answerMessageModal" tabindex="-1">
  <div class="modal-dialog">
   <div class="modal-content">
    <div class="modal-header">
     <h1 class="modal-title fs-3" style="font-weight: bold;">쪽지</h1>
     <button type="button" class="btn-close" data-bs-dismiss="modal" id="btnClose"></button>
    </div>
    <div class="modal-body">
     <div class="container my-3">
     <div class="row">
      <div class="col-3 pt-1" style="font-weight: bold;">
       보낸사람 
      </div>
      <div class="col-9">
      <input class="form-control input" id="sender" name="sender" value="" disabled>
      </div>
     </div>
      <textarea rows="5" class="form-control input mt-3" name="answerContent" id="answerContent" style="resize: none;" disabled></textarea>
     </div>
    </div>
    <div class="modal-footer justify-content-center">
     <button type="button" class="btn btn-dark fs-5 button" id="btnAnswer" style="width: 440px;">답장</button>
     <button type="button" class="btn btn-dark fs-5 button" id="btnWrite" style="width: 440px; display: none;">전송</button>
    </div>
   </div>
  </div>
 </div>
</form>

</body>
</html>