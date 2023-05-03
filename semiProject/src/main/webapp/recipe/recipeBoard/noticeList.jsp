<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
	$("#btnWrite").click(function() {
		if(${sessionScope.name == null}){
			if(confirm("글쓰기는 로그인 후 가능합니다\n로그인 하시겠습니까?")){
				location.href="${path}/recipe/recipeMember/login.jsp";
			}
		}else{
			location.href="${path}/recipe/recipeBoard/write.jsp";
		}
	});
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
			alert("선택한 게시물이 없습니다");
			return;
		}
		if(confirm(count+"개의 게시물을 삭제하시겠습니까?"))
		document.form.submit();
	});
});
function list(page) {
	location.href="${path}/recipeBoard_servlet/noticeList.do?curPage="+page;
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<div class="container list_a_div">
 <a href="${path}/recipeBoard_servlet/list.do?search=">목록</a>
</div>
<form id="form" name="form" method="post" action="${path}/recipeBoard_servlet/checkNoticeDelete.do">
 <div class="container" align="center">
  <table class="table table-hover" style="background-color: rgba(255,255,255,0.9);">
   <thead style="text-align: center;">
    <tr>
     <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
      <th style="text-align: left;"><input class="form-check-input" type="checkbox" id="checkAll"></th>
     </c:if>
     <th class="t1" style="text-align: left;">번호</th>
     <th class="t2">제목</th>
     <th class="t3">작성자</th>
     <th class="t4">작성일</th>
     <th class="t5" style="text-align: right;">좋아요</th>
     <th class="t6" style="text-align: right;">조회수</th>
    </tr>
   </thead>
   <tbody>
    <c:set var="date" value="<%=new java.util.Date()%>" />
    <c:set var="now"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
    <c:forEach var="row" items="${list}">
     <c:choose>
      <c:when test="${row.show == 'Y'}">
       <tr style="background-color: rgba(255,204,204,0.9); font-weight: bold;">
        <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
         <td><input type="checkbox" class="form-check-input check" name="check" value="${row.num}"></td>
        </c:if>
        <td class="t1">${row.num}</td>
        <c:choose>
         <c:when test="${row.post_date == now}">
          <td class="td_content t2">
           <span class="badge bg-danger">New</span>
           [공지] <a href="${path}/recipeBoard_servlet/viewContent.do?num=${row.num}">${row.subject}</a>
           <c:if test="${row.filename != '-'}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
             <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
             <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
            </svg>
           </c:if>
          </td>
         </c:when>
         <c:otherwise>
          <td class="td_content t2">
           [공지] <a href="${path}/recipeBoard_servlet/viewContent.do?num=${row.num}">${row.subject}</a>
           <c:if test="${row.filename != '-'}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
             <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
             <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
            </svg>
           </c:if>
          </td>
         </c:otherwise>
        </c:choose>
        <td class="dropdown t3" style="text-align: center;">
         <a data-bs-toggle="dropdown" href="#">${row.id}</a>
         <div class="dropdown-menu">
          <a class="dropdown-item" href="${path}/recipeBoard_servlet/view.do?id=${row.id}">작성글 보기</a>
           <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.id}')">쪽지 보내기</a>
         </div>
        </td>
        <td class="t4" style="text-align: center">${row.post_date}</td>
        <td class="t5" style="text-align: right">${row.good}</td>
        <td class="t6" style="text-align: right">${row.read_count}</td>
       </tr>
      </c:when>
      <c:otherwise>
       <tr style="background-color: rgba(255,204,204,0.9); font-weight: bold;">
        <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
         <td><input type="checkbox" class="form-check-input" disabled></td>
        </c:if>
        <td class="t1">${row.num}</td>
        <td class="td_content t2">[공지] 삭제된 게시물입니다</td>
        <td class="dropdown t3" style="text-align: center;">
         <a data-bs-toggle="dropdown" href="#">${row.id}</a>
         <div class="dropdown-menu">
          <a class="dropdown-item" href="${path}/recipeBoard_servlet/view.do?id=${row.id}">작성글 보기</a>
          <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.id}')">쪽지 보내기</a>
         </div>
        </td>
        <td class="t4" style="text-align: center">${row.post_date}</td>
        <td class="t5" style="text-align: right">${row.good}</td>
        <td class="t6" style="text-align: right">${row.read_count}</td>
       </tr>
      </c:otherwise>
     </c:choose>
    </c:forEach>
   </tbody>
  </table>
  <div class="container" align="right">
   <c:if test="${sessionScope.admin == 'Y' || sessionScope.admin2 == 'Y'}">
    <button type="button" class="btn btn-dark fs-5 button" id="btnDelete" name=" ">삭제</button>
    <button type="button" class="btn btn-dark fs-5 button" id="btnWriteNotice" name="btnWriteNotice" onclick="location.href='${path}/recipe/recipeBoard/writeNotice.jsp'">공지쓰기</button>
   </c:if>
   <button type="button" class="btn btn-dark fs-5 button" id="btnWrite" name="btnWrite">글쓰기</button>
  </div>
 </div>
</form>
<%@ include file="../../include/page.jsp" %>
<%@ include file="../../include/writeMessageModal.jsp" %>
</body>
</html>