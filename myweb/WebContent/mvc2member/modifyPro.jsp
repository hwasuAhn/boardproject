<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<c:if test="${res==1 }">
		<meta http-equiv="Refresh" content="0;url=/myweb/mvc2member/loginForm.do">
	</c:if>
	<c:if test="${res==-1 || res==0}">
	ȸ���������� ����<br/>
	<a href='javascript:history.back();'>[�ٽýõ�]</a>
	</c:if>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>