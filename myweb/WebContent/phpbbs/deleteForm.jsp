<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../bbsMain2.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
	* �� ���� *<br/>
<form method="post" name="delForm" action="/myweb/mvc2bbs/phpdeletePro.do?pageNum=${pageNum}" onsubmit="return deleteSave()">
	<input type="hidden" name="num" value="${num}">
	<table border="0" cellpadding="2" cellspacing="2" class="table">
	<tr>
		<th class="tableth" colspan="2">���� �Ͻðڽ��ϱ�?</th>
	</tr>
		<tr>
			<td class="tabletd" colspan="2" align="center">
				<input type="submit" value="����" class="btn">
				<input type="button" value="���" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>