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
	$("#checkAll").click(function() {
		if($("#checkAll").prop("checked")){
			$(".check").prop("checked", true);
		}else{
			$(".check").prop("checked", false);
		}
	});
	$("#btnDelete").click(function() {
		var count = $("input:checkbox[name=check]:checked").length;
		if(count == 0){
			alert("선택한 쪽지가 없습니다");
			return;
		}
		if(confirm(count+"개의 쪽지를 삭제하시겠습니까?")){
			document.form1.submit();
		}
	});
	
});
function list(page) {
	location.href="${path}/recipeMessage_servlet/list.do?curPage="+page;
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<c:choose>
 <c:when test="${count != 0}">
  <form id="form1" name="form1" method="post" action="${path}/recipeMessage_servlet/checkDelete.do">
   <div class="container mt-4" align="center">
    <table class="table table-hover table" style="background-color: rgba(255,255,255,0.9);">
     <thead align="center">
      <tr>
       <th class="tm1" style="text-align: left;"><input class="form-check-input" type="checkbox" id="checkAll"></th>
       <th class="tm2">보낸사람</th>
       <th class="tm3">내용</th>
       <th class="tm4">보낸시간</th>
      </tr>
     </thead>
     <tbody>
      <c:forEach var="row" items="${list}">
       <tr>
        <td class="tm1"><input type="checkbox" class="form-check-input check" name="check" value="${row.mnum}"></td>
        <td class="dropdown tm2" style="text-align: center;">
         <a data-bs-toggle="dropdown" href="#">${row.sender}</a>
         <div class="dropdown-menu">
          <a class="dropdown-item" href="${path}/recipeBoard_servlet/view.do?id=${row.sender}">작성글 보기</a>
          <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.sender}')">쪽지 보내기</a>
         </div>
        </td>
        <td class="td_content tm3">
         <c:if test="${row.read != 'Y'}">
          <span class="badge bg-danger">New</span>
         </c:if>
         <a data-bs-toggle="modal" href="#" onclick="answer('${row.mnum}', '${row.sender}', '${row.content}')">${row.content}</a>
        </td>
        <td class="tm4" align="right"><fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
       </tr>
      </c:forEach>
     </tbody>
    </table>
   </div>
   <div class="container" align="right">
    <button type="button" class="btn btn-dark fs-5 button" id="btnDelete">삭제</button>
   </div>
  </form>
<%@ include file="../../include/page.jsp" %>
<%@ include file="../../include/writeMessageModal.jsp" %>
<%@ include file="../../include/answerMessageModal.jsp" %>
 </c:when>
 <c:otherwise>
  <div class="container" align="center">
   <div class="border border-3 p-5 mt-5" style="width: 900px; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
    <h2 class="mt-3 mb-3 h2" style="font-weight: bold;">쪽지함이 비었습니다</h2>
   </div>
  </div>
 </c:otherwise>
</c:choose>
</body>
</html>