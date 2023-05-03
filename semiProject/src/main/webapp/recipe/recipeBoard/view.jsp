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
function list(page) {
	location.href="${path}/recipeBoard_servlet/view.do?id=${requestScope.id}&curPage="+page;
}
</script>
</head>
<body>
<%@ include file="../../include/menu.jsp" %>
<div class="container">
 <div class="border border-3" style="width: 100%; border-radius: 20px; background-color: rgba(255,255,255,0.9);">
  <h2 id="view_h2" class="mt-4 mb-3" style="font-weight: bold;">
   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
   </svg>
   &nbsp;${requestScope.id}
  </h2>
  <div class="container">
   <table id="view_table" style="width: 80%; margin-top: 20px; margin-bottom: 20px;">
    <tr>
     <td style="font-weight: bold;">작성글 ${requestScope.count}</td>
     <td align="right" style="font-weight: bold;">가입일 ${requestScope.reg_date}</td>
    </tr>
   </table>
  </div>
 </div>
</div>
<div class="container mt-2" align="center">
 <table class="table table-hover" style="background-color: rgba(255,255,255,0.9); width: width: 1296px;">
  <thead style="text-align: center;">
   <tr>
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
     <c:when test="${row.show == 'Y' && row.notice == 0}">
      <tr>
       <td class="t1">${row.num}</td>
       <c:choose>
        <c:when test="${row.post_date == now}">
         <td class="td_content t2">
          <span class="badge bg-danger">New</span>
          <a href="${path}/recipeBoard_servlet/viewContent.do?num=${row.num}">${row.subject}</a>
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
          <a href="${path}/recipeBoard_servlet/viewContent.do?num=${row.num}">${row.subject}</a>
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
         <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.id}')">쪽지 보내기</a>
        </div>
       </td>
       <td class="t4" style="text-align: center">${row.post_date}</td>
       <td class="t5" style="text-align: right">${row.good}</td>
       <td class="t6" style="text-align: right">${row.read_count}</td>
      </tr>
     </c:when>
     <c:when test="${row.show == 'Y' && row.notice == 1}">
      <tr style="background-color: rgba(255,204,204,0.9); font-weight: bold;">
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
         <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.id}')">쪽지 보내기</a>
        </div>
       </td>
       <td class="t4" style="text-align: center">${row.post_date}</td>
       <td class="t5" style="text-align: right">${row.good}</td>
       <td class="t6" style="text-align: right">${row.read_count}</td>
      </tr>
     </c:when>
     <c:when test="${row.show == 'N' && row.notice == 1}">
      <tr style="background-color: rgba(255,204,204,0.9); font-weight: bold;">
       <td class="t1">${row.num}</td>
       <td class="td_content t2">[공지] 삭제된 게시물입니다</td>
       <td class="dropdown t3" style="text-align: center;">
        <a data-bs-toggle="dropdown" href="#">${row.id}</a>
        <div class="dropdown-menu">
         <a class="dropdown-item" data-bs-toggle="modal" href="#" onclick="message('${row.id}')">쪽지 보내기</a>
        </div>
       </td>
       <td class="t1" style="text-align: center">${row.post_date}</td>
       <td class="t1" style="text-align: right">${row.good}</td>
       <td style="text-align: right">${row.read_count}</td>
      </tr>
     </c:when>
     <c:otherwise>
      <tr>
       <td>${row.num}</td>
       <td class="td_content">삭제된 게시물입니다</td>
       <td class="dropdown" style="text-align: center;">
        <a data-bs-toggle="dropdown" href="#">${row.id}</a>
        <div class="dropdown-menu">
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
</div>
<%@ include file="../../include/page.jsp" %>
<%@ include file="../../include/writeMessageModal.jsp" %>
</body>
</html>