<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<c:if test="${res==1 }">
	<!--
	${res }
	${sessionScope.s_id }
	${sessionScope.s_mlevel }"
	-->
		<c:set var="memid" value="${sessionScope.s_id2 }" scope="session"/>
		<c:set var="s_mlevel" value="${sessionScope.s_mlevel }" scope="session"/>
		<meta http-equiv="Refresh" content="0;url=/myweb/index.jsp">
	</c:if>
	<c:if test="${res==0 }">
	<!-- 
	${res }
	-->
		아이디 및 비밀번호가 다릅니다
		<br/>
		<a href="javascript:history.go(-1)">[돌아가기]</a>
	</c:if>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		