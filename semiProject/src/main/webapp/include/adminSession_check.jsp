<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.admin2 == 'N' || sessionScope.admin2 == null}">
 <script>
  alert("관리자만 접근 가능합니다");
  location.href="${path}/recipe/recipeMember/login.jsp";
 </script>
</c:if>