<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../bbsMain2.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
	* 글 삭제 *<br/>
<form method="post" name="delForm" action="/myweb/mvc2bbs/phpdeletePro.do?pageNum=${pageNum}" onsubmit="return deleteSave()">
	<input type="hidden" name="num" value="${num}">
	<table border="0" cellpadding="2" cellspacing="2" class="table">
	<tr>
		<th class="tableth" colspan="2">삭제 하시겠습니까?</th>
	</tr>
		<tr>
			<td class="tabletd" colspan="2" align="center">
				<input type="submit" value="삭제" class="btn">
				<input type="button" value="취소" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
	</table>
</form>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>