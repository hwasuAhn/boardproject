<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../bbsMain2.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
	* �� ���� *<br/>
<script language="javaScript">
function deleteSave()
{
	if(document.delForm.passwd.value=='')
	{
		alert("��й�ȣ�� �Է��Ͻʽÿ�");
		document.delForm.passwd.focus();
		return false;
	}
}
</script>
<form method="post" name="delForm" action="/myweb/mvc2bbs/deletePro.do?pageNum=${pageNum}" onsubmit="return deleteSave()">
	<input type="hidden" name="num" value="${num}">
	<table border="0" cellpadding="2" cellspacing="2" class="table">
	<tr>
		<th class="tableth">��й�ȣ</th>
		<td class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
	</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="submit" value="����" class="btn">
				<input type="button" value="���" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>