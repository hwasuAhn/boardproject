<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="./view/color.jspf" %> --%>
<jsp:include page="header.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../../images/j_board_notice_mvc.gif"/><br/><br/>
<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=/myweb/admin/bbs/list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	글삭제에러
<br/>
<a href="javascript:history.go(-1)">[돌아가기]</a>
</c:if>
<!-- 본문 끝 -->
</div>

