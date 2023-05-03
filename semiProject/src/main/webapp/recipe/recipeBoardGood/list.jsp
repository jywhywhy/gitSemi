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
<%@ include file="../../include/session_check.jsp" %>
<script type="text/javascript">
function list(page) {
	location.href="${path}/recipeBoard_servlet/goodList.do?id=${param.id}&curPage="+page;
}
</script>
</head>
<body>
<c:if test="${sessionScope.id != param.id}">
 <script>
  alert("접근할 수 없습니다");
  location.href="${path}/recipe/index.jsp";
 </script>
</c:if>
<%@ include file="../../include/menu.jsp" %>
<div class="container" align="center">
 <table class="table table-hover" style="background-color: rgba(255,255,255,0.9);">
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
       <td class="t3" style="text-align: center">${row.id}</td>
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
       <td class="t3" style="text-align: center">${row.id}</td>
       <td class="t4" style="text-align: center">${row.post_date}</td>
       <td class="t5" style="text-align: right">${row.good}</td>
       <td class="t6" style="text-align: right">${row.read_count}</td>
      </tr>
     </c:when>
     <c:when test="${row.show == 'N' && row.notice == 1}">
      <tr style="background-color: rgba(255,204,204,0.9); font-weight: bold;">
       <td>${row.num}</td>
       <td class="td_content t2">[공지] 삭제된 게시물입니다</td>
       <td class="t3" style="text-align: center">${row.id}</td>
       <td class="t4" style="text-align: center">${row.post_date}</td>
       <td class="t5" style="text-align: right">${row.good}</td>
       <td class="t6" style="text-align: right">${row.read_count}</td>
      </tr>
     </c:when>
     <c:otherwise>
      <tr>
       <td>${row.num}</td>
       <td class="td_content t2">삭제된 게시물입니다</td>
       <td class="t3" style="text-align: center">${row.id}</td>
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
</body>
</html>