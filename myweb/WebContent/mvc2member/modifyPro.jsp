<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<c:if test="${res==1 }">
		<meta http-equiv="Refresh" content="0;url=/myweb/mvc2member/loginForm.do">
	</c:if>
	<c:if test="${res==-1 || res==0}">
	회원정보수정 실패<br/>
	<a href='javascript:history.back();'>[다시시도]</a>
	</c:if>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>