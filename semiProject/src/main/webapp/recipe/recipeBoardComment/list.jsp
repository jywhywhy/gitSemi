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
function save(comment_num) {
	var content = $("#content_"+comment_num);
	if(content.val() == ""){
		alert("내용을 입력하세요");
		content.focus();
		return;
	}
	$("#form_"+comment_num).submit();
}
function update(comment_num) {
	$("#content_"+comment_num).show();
	$("#content"+comment_num).css("display", "none");
	$("#btnUpdate_"+comment_num).css("display", "none");
	$("#btnDelete_"+comment_num).css("display", "none");
	$("#btnReComment_"+comment_num).css("display", "none");
	$("#btnSave_"+comment_num).show();
	$("#content_"+comment_num+"_2").css("display", "none");
	$("#btnSave_"+comment_num+"_2").css("display", "none");
}
function delete_(comment_num) {
	if(confirm("댓글을 삭제하시겠습니까?")){
		$("#form_"+comment_num).attr("action", "${path}/recipeBoardComment_servlet/delete.do")
		$("#form_"+comment_num).submit();
	}
}
function write_(comment_num) {
	$("#content_"+comment_num+"_2").show();
	$("#btnSave_"+comment_num+"_2").show();
}
function save2(comment_num) {
	var content = $("#content_"+comment_num+"_2");
	if(content.val() == ""){
		alert("내용을 입력하세요");
		content.focus();
		return;
	}
	$("#form_"+comment_num).attr("action", "${path}/recipeBoardComment_servlet/insertComment.do");
	$("#form_"+comment_num).submit();
}
</script>
</head>
<body>
<c:forEach var="row" items="${list}">
 <form method="post" id="form_${row.comment_num}" action="${path}/recipeBoardComment_servlet/update.do">
  <input type="hidden" id="num" name="num" value="${row.num}">
  <input type="hidden" id="comment_num_${row.comment_num}" name="comment_num" value="${row.comment_num}">
  <div class="row">
   <c:forEach var="i" begin="1" end="${row.re_level}">
    <div class="col-1" style="width: 60px;"></div>
   </c:forEach>
   <div class="col">
    <div class="border border-1 p-3 mt-3" style="width: 100%; border-radius: 20px;">
     <div class="mb-2" style="float: left;">
      <c:if test="${row.re_level > 0}">
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
       </svg>
      </c:if>
      ${row.id}
      <c:if test="${row.re == 'Y' && row.show == 'Y'}">
       <span style="font-size: 12px; color: blue;">(수정된 댓글입니다)</span>
      </c:if>
     </div>
     <div style="float: right;">
      ${row.post_date}
     </div>
     <hr style="width: 100%;">
     <c:choose>
      <c:when test="${row.show == 'Y'}">
       <span id="content${row.comment_num}">&nbsp;${row.content}</span>
       <textarea rows="3" class="form-control input" name="content" id="content_${row.comment_num}" style="resize: none; display: none;">${row.content}</textarea>
       <div class="mt-2" align="right">
        <c:if test="${sessionScope.name != null}">
         <button class="btn btn-dark button" type="button" onclick="write_('${row.comment_num}')" id="btnReComment_${row.comment_num}" name="btnReComment">답글</button>
        </c:if>
        <c:choose>
         <c:when test="${sessionScope.id == row.id || sessionScope.admin == 'Y'}">
          <button class="btn btn-dark button" type="button" onclick="update('${row.comment_num}')" id="btnUpdate_${row.comment_num}">수정</button>
          <button class="btn btn-dark button" type="button" onclick="delete_('${row.comment_num}')" id="btnDelete_${row.comment_num}">삭제</button>
          <button class="btn btn-dark button" type="button" onclick="save('${row.comment_num}')" id="btnSave_${row.comment_num}" style="display: none;">작성</button>
         </c:when>
        </c:choose>
       </div>
       <textarea rows="3" class="form-control input mt-3" name="content2" id="content_${row.comment_num}_2" style="resize: none; display: none;" placeholder="답글 쓰기"></textarea>
       <div class="mt-2" align="right">
        <button class="btn btn-dark button" type="button" onclick="save2('${row.comment_num}')" id="btnSave_${row.comment_num}_2" style="display: none;">작성</button>
       </div>
      </c:when>
      <c:otherwise>
       <span style="font-weight: bold;">&nbsp;삭제된 댓글입니다</span>
      </c:otherwise>
     </c:choose>
    </div>
   </div>
  </div>
 </form>
</c:forEach>
</body>
</html>