<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../bbsMain4.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>

<form>
	<table border='1' width='600' cellspacing="0" class="table">
		<tr>
			<th bgcolor="#b0e0e6" height='25' width="80" class="tabletd_d" colspan="4">${article.subject}</th>
		</tr>
		<tr>
			<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">작성자</th>
			<td class="tabletd" align='left'>${article.writer}</td>
			<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">조회수</th>
			<td class="tabletd" align='left'>${article.readcount}</td>
		</tr>
		<tr>
			<td align='left' height='100' colspan='4'  class="tabletd">
	 	 	<div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 	
	 		${content}</div></td>
	 	</tr>
	 	<tr>
	 		<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">작성일</th>
	 		<c:set var="reg" value="${article.reg_date }"/>
    		<c:set var="date" value="${fn:substring(reg, 0,10) }"/> <!-- 게시글 날짜를 2012-12-03 -->
	 		<td class="tabletd" align='left' width="200">${date}</td>
	 		<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">IP주소</th>
	 		<td class="tabletd" align='left'>${article.ip }</td>
		</tr>
		</table>
		<table border="0" cellpadding="10" cellspacing="0" width="600">
		<tr>			
			<td colspan=4>
			<c:if test="${article.writer == id}">
			<input type="button" value="글수정" class="btn" onclick="document.location.href='/myweb/mvc2bbs/phpupdate.do?num=${article.num}&pageNum=${pageNum}'">
			<input type="button" value="글삭제" class="btn" onclick="document.location.href='/myweb/mvc2bbs/phpdeleteForm.do?num=${article.num}&pageNum=${pageNum}'">
			</c:if>
			<c:if test="${id != 'guest' }">
			<input type="button" value="답변"  class="btn" onclick="document.location.href='/myweb/mvc2bbs/phpwriteForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
			</c:if>
			<input type="button" value="목록" class="btn" onclick="document.location.href='/myweb/mvc2bbs/phplist.do?pageNum=${pageNum}'">
			</td>
		</tr>
	</table>
</form>
</div>

<jsp:include page="../footer.jsp"/>