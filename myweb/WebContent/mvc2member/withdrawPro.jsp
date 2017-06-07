<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<c:if test="${res==1 }">
		<c:remove var="memid" scope="session"/>
		<c:remove var="s_mlevel" scope="session"/>
		<meta http-equiv="Refresh" content="0;url=/myweb/mvc2member/loginForm.do">
	</c:if>
	<c:if test="${res==0 }">
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다");
		history.back();
	</script>
	</c:if>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		