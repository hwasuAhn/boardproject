<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf" %>
<jsp:include page="../main.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=/myweb/mvc2bbs/list.do?pageNum=${pageNum}">
</c:if>
<c:if test="${check==0}">
	��й�ȣ�� �ٸ��ϴ�
<br/>
<a href="javascript:history.go(-1)">[�� ���������� ���ư���]</a>
</c:if>
<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>