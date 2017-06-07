<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../main.jsp"/>
<c:remove var="memid" scope="session"/>
<c:remove var="s_mlevel" scope="session"/>
<meta http-equiv="Refresh" content="0;url=/myweb/mvc2member/loginForm.do">
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		