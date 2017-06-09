<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../bbsMain2.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
	* 글 수정 *<br/>
<script language="javaScript">
function updateSave()
{
	if(document.updateForm.passwd.value=='')
	{
		alert("비밀번호를 입력하십시요");
		document.updateForm.passwd.focus();
		return false;
	}
}
</script>
<form method="post" name="updateForm" action="/myweb/mvc2bbs/updateForm.do?pageNum=${pageNum}" onsubmit="return updateSave()">
	<input type="hidden" name="num" value="${num}">
	<table border="0" cellpadding="2" cellspacing="2" class="table">
	<tr>
		<th class="tableth">비밀번호</th>
		<td class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
	</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="submit" value="수정" class="btn">
				<input type="button" value="취소" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>