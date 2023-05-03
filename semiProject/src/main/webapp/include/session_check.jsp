<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.name == null}">
 <script>
  alert("로그인 후 사용하세요");
  location.href="${path}/recipe/recipeMember/login.jsp";
 </script>
</c:if>